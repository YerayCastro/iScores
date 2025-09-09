//
//  ScoresEditVM.swift
//  iScores
//
//  Created by Yery Castro on 1/10/24.
//

import SwiftUI
import PhotosUI

final class ScoresEditVM: ObservableObject {
    @Published var title = ""
    @Published var composer = ""
    @Published var year = 0
    @Published var length = 0.0
    @Published var cover = ""
    
    
    @Published var msg = ""
    @Published var showAlert = false
    
    @Published var tracks: [ScoreTracks]
    
    @Published var photo: PhotosPickerItem? {
        didSet {
            if let photo {
                photo.loadTransferable(type: Data.self) { result in
                    if case .success(let imageData) = result,
                        let imageData,
                        let image = UIImage(data: imageData),
                        let resize = image.resize(width: 300) {
                        DispatchQueue.main.async {
                            self.newCover = resize
                        }
                    }
                }
            }
        }
    }
    @Published var newCover: UIImage?
    
    let score: Score
    
    init(score: Score) {
        self.score = score
        title = score.title
        composer = score.composer
        year = score.year
        length = score.length
        cover = score.cover
        tracks = score.tracks.map {
            ScoreTracks(name: $0)
        }
        newCover = ImageInteractor.shared.loadImage(id: score.id)
    }
    
    func deleteTrack(index: IndexSet) {
        tracks.remove(atOffsets: index)
    }
    
    func validateScore() -> Score? {
        var message = ""
        if title.isEmpty || title.count > 200 {
            message += "Title cannot be empty or greater than 200 characters.\n"
        }
        if year < 1900 || year > 2050 {
            message += "Year must be between 1900 and 2050.\n"
        }
        if length <= 0 || length > 300 {
            message += "length must be greater than 0 and less than 300.\n"
        }
        if message.isEmpty {
            if let newCover {
                ImageInteractor.shared.saveImage(id: self.score.id, image: newCover)
            }
            return Score(id: score.id,
                         title: title,
                         composer: composer,
                         year: year,
                         length: length,
                         cover: score.cover,
                         tracks: tracks.map(\.name))
        } else {
            self.msg = String(message.dropLast())
            self.showAlert.toggle()
            return nil
        }
    }
}

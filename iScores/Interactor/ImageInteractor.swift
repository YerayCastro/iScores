//
//  ImageInteractor.swift
//  iScores
//
//  Created by Yery Castro on 3/10/24.
//

import SwiftUI

struct ImageInteractor {
    static let shared = ImageInteractor()
    
    let urlDoc = URL.documentsDirectory
    
    func loadImage(id: Int) -> UIImage? {
        let url = urlDoc.appending(path: "cover\(id).jpg")
        if FileManager.default.fileExists(atPath: url.path()) {
            do {
                let data = try Data(contentsOf: url)
                return UIImage(data: data)
            } catch {
                print("Error en la carga de la portada \(id).")
            }
        }
        return nil
    }
    
    func saveImage(id: Int, image: UIImage) {
        guard let data = image.jpegData(compressionQuality: 0.7) else { return } 
        let url = urlDoc.appending(path: "cover\(id).jpg")
        try? data.write(to: url, options: .atomic)
    }
}

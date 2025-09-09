//
//  ScoresViewModel.swift
//  iScores
//
//  Created by Yery Castro on 27/9/24.
//

import SwiftUI

final class ScoresViewModel: ObservableObject {
    let interactor: Interactor
    
    @Published var scores: [Score] {
        didSet {
            try? interactor.saveData(json: scores)
        }
    }
    
    var composers: [String] {
        Array(Set(scores.map(\.composer))).sorted()
    }
    
    
    init(interactor: Interactor = DataInteractor()) {
        self.interactor = interactor
        do {
            scores = try interactor.loadData()
        } catch {
            print(error)
            scores = []
        }
    }
    
    func deleteScore(index: IndexSet) {
        scores.remove(atOffsets: index)
    }
    
    func getScoreByID(id: Int) -> Score? {
        scores.first(where: { $0.id == id })
    }
    
    func getScoresFromComposer(composer: String) -> [Score] {
        scores.filter { score in
            score.composer == composer
        }
    }
    
    func updateScore(score: Score) {
        if let index = scores.firstIndex(where: { $0.id == score.id }) {
            scores[index] = score
        }
    }
}

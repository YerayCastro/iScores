//
//  ScoreModel.swift
//  iScores
//
//  Created by Yery Castro on 27/9/24.
//

import Foundation

struct Score: Codable, Identifiable, Hashable {
    let id: Int
    let title: String
    let composer: String
    let year: Int
    let length: Double
    let cover: String
    let tracks: [String]
}

extension Score {
    var lenghtForamted: String {
        "\(length.formatted(.number.precision(.integerAndFractionLength(integer: 2, fraction: 1)))) min."
    }
}

struct ScoreTracks: Identifiable {
    let id = UUID()
    var name: String
}

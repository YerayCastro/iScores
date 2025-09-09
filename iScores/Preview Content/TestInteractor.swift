//
//  TestInteractor.swift
//  iScores
//
//  Created by Yery Castro on 27/9/24.
//

import Foundation

struct TestInteractor: Interactor {
    let urlBundle = Bundle.main.url(forResource: "scoresdatatest", withExtension: "json")!
    let docURL = URL.documentsDirectory.appending(path: "scoresdatatest.json")
    
}

extension ScoresViewModel {
    static let preview = ScoresViewModel(interactor: TestInteractor())
}
extension Score {
    static let test = Score(id: 1,
                            title: "Star Wars",
                            composer: "John Williams",
                            year: 1977,
                            length: 70,
                            cover: "StarWars",
                            tracks: ["Main Title",
                                     "Imperial Attack",
                                     "Princess Leia's Theme",
                                     "The Desert and the Robot Auction",
                                     "Ben's Death and TIE Fighter Attack",
                                     "The Little People Work",
                                     "Rescue of the Princess",
                                     "Inner City",
                                     "Cantina Band",
                                     "The Land of the Sand People",
                                     "Mouse Robot and Blasting Off",
                                     "The Return Home",
                                     "The Walls Converge",
                                     "The Princess Appears",
                                     "The Last Battle",
                                     "The Throne Room and End Title"])
}

//
//  iScoresApp.swift
//  iScores
//
//  Created by Yery Castro on 27/9/24.
//

import SwiftUI

@main
struct iScoresApp: App {
    @StateObject var vm = ScoresViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}

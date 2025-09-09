//
//  ContentView.swift
//  iScores
//
//  Created by Yery Castro on 27/9/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: ScoresViewModel
    

    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.scores) { score in
                    NavigationLink(value: score) {
                        ScoreCell(score: score)
                    }
                }
                .onDelete(perform: vm.deleteScore)
            }
            .navigationTitle("iScores")
            .navigationDestination(for: Score.self) { score in
                IScoresDetailView(editVM: ScoresEditVM(score: score), score: score)
            }
        }
    }
}

#Preview {
        ContentView()
            .environmentObject(ScoresViewModel.preview)
}


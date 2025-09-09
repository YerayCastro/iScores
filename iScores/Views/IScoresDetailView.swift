//
//  IScoresDetail.swift
//  iScores
//
//  Created by Yery Castro on 28/9/24.
//

import SwiftUI


struct IScoresDetailView: View {
    @EnvironmentObject var vm: ScoresViewModel
    @ObservedObject var editVM: ScoresEditVM
    @Environment(\.dismiss) var dismiss
    let score: Score
    @State var  showEdit = false
    
    var body: some View {
            VStack {
                if let image = editVM.newCover {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .overlay(alignment: .bottomTrailing) {
                            Image(editVM.composer)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                } else {
                    CoverView(image: editVM.score.cover, composer: editVM.composer)
                }
                HStack {
                    
                    Spacer()
                    Button {
                        showEdit.toggle()
                    } label: {
                        Text("Edit Score")
                    }
                    .padding()
                }
                Form {
                    Section {
                        LabeledContent("Title", value: score.title)
                        LabeledContent("Composer", value: score.composer)
                        LabeledContent("Year", value: "\(score.year)")
                        LabeledContent("Length", value: score.lenghtForamted)
                    } header: {
                        Text("Score data")
                    }
                    Section {
                        ForEach(score.tracks, id: \.self) { score in
                            Text(score)
                        }
                    } header: {
                        Text("Score Tracks")
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .ignoresSafeArea()
            .fullScreenCover(isPresented: $showEdit, onDismiss: {
                dismiss()
            }) {
                NavigationStack {
                    IScoresDetailEditView(editVM: ScoresEditVM(score: score))
                }
            }
    }
}

#Preview {
    IScoresDetailView(editVM: ScoresEditVM(score: .test), score: .test)
        .environmentObject(ScoresViewModel.preview)
}


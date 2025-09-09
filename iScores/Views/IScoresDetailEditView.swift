//
//  IScoresDetailEditView.swift
//  iScores
//
//  Created by Yery Castro on 1/10/24.
//

import SwiftUI
import PhotosUI

struct IScoresDetailEditView: View {
    @EnvironmentObject var vm: ScoresViewModel
    @ObservedObject var editVM: ScoresEditVM
    @Environment(\.dismiss) var dismiss
    
    
    
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
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                }
                Spacer()
                PhotosPicker("Change Cover",
                             selection: $editVM.photo,
                             matching: .images)
                Spacer()
                Button {
                    if let score = editVM.validateScore() {
                        vm.updateScore(score: score)
                        dismiss()
                    }
                } label: {
                    Text("Save")
                }
                
            }
            .padding()
            Form {
                Section {
                    TextFieldView(label: "Title", text: $editVM.title)
                    Picker("Composer", selection: $editVM.composer) {
                        ForEach(vm.composers, id: \.self) { composer in
                            Text(composer)
                        }
                    }
                    VStack(alignment: .leading) {
                        Text("Year")
                            .font(.headline)
                        TextField("Year", value: $editVM.year, format: .number.precision(.integerLength(4)))
                    }
                    .textFieldStyle(.roundedBorder)
                    VStack(alignment: .leading) {
                        Text("Length")
                            .font(.headline)
                        TextField("Length", value: $editVM.length, format: .number.precision(.fractionLength(1)))
                            .keyboardType(.numberPad)
                    }
                    .textFieldStyle(.roundedBorder)
                } header: {
                    Text("Score data")
                }
                Section {
                    ForEach($editVM.tracks) { $track in
                        TextField("Enter the name of the trac", text: $track.name)
                    }
                    .onDelete(perform: editVM.deleteTrack)
                } header: {
                    Text("Score Tracks")
                }
            }
            
        }
        .ignoresSafeArea()
        .alert("Validation error", isPresented: $editVM.showAlert) {
            
        } message: {
            Text(editVM.msg)
        }

    }
}

#Preview {
    NavigationStack {
        IScoresDetailEditView(editVM: ScoresEditVM(score: .test))
            .environmentObject(ScoresViewModel.preview)
    }
}

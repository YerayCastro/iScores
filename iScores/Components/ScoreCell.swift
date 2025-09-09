//
//  CoverCardView.swift
//  iScores
//
//  Created by Yery Castro on 27/9/24.
//

import SwiftUI

struct ScoreCell: View {
    
    let score: Score
    var body: some View {
        HStack(alignment: .top) {
            if let new = ImageInteractor.shared.loadImage(id: score.id) {
                Image(uiImage: new)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } else {
                Image(score.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            Spacer()
            VStack(alignment: .leading) {
                Text(score.title)
                    .font(.headline)
                    .bold()
                Text(score.composer)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
        
    }
}

#Preview {
    ScoreCell(score: .test)
}

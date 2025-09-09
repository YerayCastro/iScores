//
//  CoverView.swift
//  iScores
//
//  Created by Yery Castro on 1/10/24.
//

import SwiftUI

struct CoverView: View {
    let image: String
    let composer: String
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .overlay(alignment: .bottomTrailing) {
                Image(composer)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
    }
}

#Preview {
    CoverView(image: "", composer: "")
}

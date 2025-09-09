//
//  TextFieldView.swift
//  iScores
//
//  Created by Yery Castro on 1/10/24.
//

import SwiftUI

struct TextFieldView: View {
    let label: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label.capitalized)
                .font(.headline)
            HStack {
                TextField("Enter the \(label.lowercased())", text: $text)
                Button {
                    text = ""
                } label: {
                    Image(systemName: "xmark")
                        .symbolVariant(.fill)
                        .symbolVariant(.circle)
                }
                .buttonStyle(.plain)
                .opacity(text.isEmpty ? 0.0 : 0.3)
            }
            .padding(10)
            .background {
                Color(white: 0.95)
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    TextFieldView(label: "Title", text: .constant(""))
}

//
//  Extensions.swift
//  iScores
//
//  Created by Yery Castro on 3/10/24.
//

import SwiftUI

extension UIImage {
    func resize(width: CGFloat) -> UIImage? {
        let scale = width / self.size.width
        let height = self.size.height * scale
        return self.preparingThumbnail(of: CGSize(width: width, height: height))
    }
}

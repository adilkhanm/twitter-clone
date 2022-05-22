//
//  RoundedShape.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 22.05.2022.
//

import Foundation
import UIKit
import SwiftUI

struct RoundedShape: Shape {
    var corners: UIRectCorner
    var cornerRadii: CGSize
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: cornerRadii)
        return Path(path.cgPath)
    }
}

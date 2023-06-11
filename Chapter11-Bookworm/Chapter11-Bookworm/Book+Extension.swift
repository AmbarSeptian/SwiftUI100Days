//
//  Book+Extension.swift
//  Chapter11-Bookworm
//
//  Created by ambar.septian on 10/06/23.
//

import Foundation
import SwiftUI

extension Book {
    var ratingColor: Color {
        switch rating {
        case 1:
            return .red
        case 2:
            return .orange
        case 3:
            return .yellow
        case 4:
            return .green.opacity(0.6)
        case 5:
            return .green
        default:
            return .red
        }
    }
}

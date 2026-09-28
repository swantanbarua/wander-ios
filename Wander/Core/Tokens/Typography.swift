//
//  Typography.swift
//  Wander
//
//  Created by Swantan Barua on 28/09/26.
//

import SwiftUI

enum TextRole: CaseIterable {
    
    case display
    case title1
    case title2
    case title3
    case bodyLg
    case body
    case bodyStrong
    case caption
    case overline
    
    // Point size at the default text setting
    var size: CGFloat {
        switch self {
        case .display:      32
        case .title1:       26
        case .title2:       22
        case .title3:       18
        case .bodyLg:       16
        case .body:         14
        case .bodyStrong:   14
        case .caption:      12
        case .overline:     11
        }
    }
    
    // Line height in points
    var lineHeight: CGFloat {
        switch self {
        case .display:      38
        case .title1:       32
        case .title2:       28
        case .title3:       24
        case .bodyLg:       24
        case .body:         20
        case .bodyStrong:   20
        case .caption:      16
        case .overline:     14
        }
    }
    
    // Font Weight
    var weight: Font.Weight {
        switch self {
        case .display:                                          .bold
        case .title1, .title2, .title3, .bodyStrong, .overline: .semibold
        case .bodyLg, .body, .caption:                          .regular
        }
    }
}

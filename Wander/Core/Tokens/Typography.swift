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
    
    // Apple text styles this role scales with (Dynamic Type)
    var textStyle: Font.TextStyle {
        switch self {
        case .display:              .largeTitle
        case .title1:               .title
        case .title2:               .title2
        case .title3:               .headline
        case .bodyLg:               .body
        case .body, .bodyStrong:    .subheadline
        case .caption:              .caption
        case .overline:             .caption2
        }
    }
    
    // Largest multiple of the default size this role may grow to
    var maxScale: CGFloat {
        switch self {
        case .display, .title1, .title2, .overline:             1.5
        case .title3, .bodyLg, .body, .bodyStrong, .caption:    2.0
        }
    }
    
    // Letter spacing in points
    var tracking: CGFloat {
        self == .overline ? 0.6 : 0
    }
    
    var isUppercase: Bool {
        self == .overline
    }
}

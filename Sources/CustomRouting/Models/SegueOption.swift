//
//  SegueOption.swift
//  ArchitectureBootcamp
//
//  Created by Dhiman Das on 18.10.25.
//

import SwiftUI

public enum SegueOption {
    case push, sheet, fullScreenCover
    
    var shouldAddNewNavigationView: Bool {
        switch self {
        case .push:
            return false
        case .sheet, .fullScreenCover:
            return true
        }
    }
}

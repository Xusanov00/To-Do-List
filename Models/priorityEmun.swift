//
//  File.swift
//  toDoList
//
//  Created by Ali on 22/11/22.
//

import Foundation
import UIKit

//MARK: - PriorityEnum
enum PriorityEnum: String {
    case high, medium, low, no
    
    func setPriorityColor() -> UIColor {
        switch self {
        case .high:
            return .systemRed
        case .medium:
            return .systemYellow
        case .low:
            return .systemGreen
        case .no:
            return .systemGray
        }
    }
}

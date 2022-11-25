//
//  UIView.swift
//  toDoList
//
//  Created by Ali on 18/11/22.
//
import Foundation
import UIKit

//MARK: - extension UIView
extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }set {
            return self.layer.cornerRadius = newValue
        }
    }
}

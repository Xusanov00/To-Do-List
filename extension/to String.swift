//
//  to String.swift
//  toDoList
//
//  Created by Ali on 24/11/22.
//
import Foundation
import UIKit

//MARK: - extension String
extension String {
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAtributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAtributes)
        return size.width
    }
    
    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAtributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAtributes)
        return size.height
    }
    
    func sizeOfString(usingFont font: UIFont) -> CGSize {
        let fontAtributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: fontAtributes)
        
    }
}

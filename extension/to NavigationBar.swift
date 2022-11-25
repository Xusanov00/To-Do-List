import Foundation
import UIKit

//MARK: - extension UINavigationBar
extension UINavigationBar {
    
    func update(backgroundColor: UIColor? = nil, titleColor: UIColor? = nil, font: UIFont) {
        
        if #available(iOS 15, *) {                        /*--------------    if iOS 15 is available for device    -----------------*/
            
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()    /*--------------    Navigation Bar Background let know for changing    -----------------*/
            
            if let backgroundColor = backgroundColor {    /*--------------    backgroundColor optional opened    -----------------*/
                appearance.backgroundColor = backgroundColor
            }
            if let titleColor = titleColor {
                appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor, NSAttributedString.Key.font: font]
            }
            
            standardAppearance = appearance
            scrollEdgeAppearance = appearance
            
        }else {
            
            barStyle = .blackTranslucent
            if let backgroundColor = backgroundColor {
                barTintColor = backgroundColor
            }
            if let titleColor = titleColor {
                titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor]
            }
        }
    }
    
}

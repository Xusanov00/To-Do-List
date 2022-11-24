//
//  ChoosePriorityVC.swift
//  toDoList
//
//  Created by Ali on 19/11/22.
//

import UIKit




class ChoosePriorityVC: UIViewController {
    
    var choosenPriority: ((PriorityEnum) -> Void)?
    
    
    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //MARK: - dismiss button (out of area) tapped
    @IBAction func dismissTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    
    //MARK: - preority buttons
    @IBAction func priorityTapped(_ sender: UIButton) {
        guard let choosenPriority = choosenPriority else {return}
        
        switch sender.tag {
        case 0: choosenPriority(.high)
        case 1: choosenPriority(.medium)
        case 2: choosenPriority(.low)
        case 3: choosenPriority(.no)
        default: choosenPriority(.no)
        }
        dismiss(animated: true)
    }
  
}

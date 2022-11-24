//
//  TaskTVC.swift
//  toDoList
//
//  Created by Ali on 18/11/22.
//

import UIKit

class TaskTVC: UITableViewCell {
    
    // for registering cell
    static func nib() -> UINib {
        UINib(nibName: "TaskTVC", bundle: nil)
    };static let id = "TaskTVC"
    
    // name of the task
    @IBOutlet weak var titleLbl: UILabel!
    
    //: text of the comment
    @IBOutlet weak var subTitleLbl: UILabel!
    
    // color of the preority
    @IBOutlet weak var priorityImg: UIImageView!
    
    @IBOutlet weak var backgroundV: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - update cell
    func updateCell(cell: TaskDM, groupType: GroupTypeEnum) {
        titleLbl.text = cell.title
        subTitleLbl.text = cell.subTitle
        
        priorityImg.tintColor = cell.priority.setPriorityColor()
        
        switch groupType {
        case .new:
            backgroundV.backgroundColor = .systemGray6
        case .archived:
            backgroundV.backgroundColor = #colorLiteral(red: 0.9809756875, green: 1, blue: 0.6088772416, alpha: 1)
        case .finished:
            backgroundV.backgroundColor = #colorLiteral(red: 0.6116511226, green: 1, blue: 0.680764854, alpha: 1)
        case .unFinished:
            return
        case .unArchived:
            return
        case .deleted:
            return
        }
    }
    
}

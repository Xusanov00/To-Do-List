//
//  Ex+UIViewCont.swift
//  toDoList
//
//  Created by Ali on 23/11/22.
//
import Foundation
import UIKit


//MARK: - extension UIViewController
extension UIViewController {
    
    func showAlert(groupType: GroupTypeEnum?, title: String?, message: String?, type: UIAlertController.Style, completion: @escaping ((GroupTypeEnum?)->Void)) {
        let alertVC = UIAlertController(title: "Choose what to do", message: "", preferredStyle: type)
        
        guard let groupType = groupType else {
            let  okBtn = UIAlertAction(title: "Ok", style: .default) { _ in
                completion(nil)
            }
            alertVC.addAction(okBtn)
            self.present(alertVC, animated: true)
            return
        }
        
        let  finishBtn = UIAlertAction(title: "Finish", style: .default) { _ in
            completion(.finished)
        }
        
        let  unFinishBtn = UIAlertAction(title: "UnFinish", style: .default) { _ in
            completion(.unFinished)
        }
        
        let  archiveBtn = UIAlertAction(title: "Archive", style: .default) { _ in
            completion(.archived)
        }
        
        let  unArchiveBtn = UIAlertAction(title: "UnArchive", style: .default) { _ in
            completion(.unArchived)
        }
        let  deleteBtn = UIAlertAction(title: "Delete", style: .destructive) { _ in
            completion(.deleted)
        }
        
        let  cencelBtn = UIAlertAction(title: "Cencel", style: .cancel) { _ in
            completion(nil)
        }
        
        switch groupType {
        case .new:
            alertVC.addAction(finishBtn)
            alertVC.addAction(archiveBtn)
        case .archived:
            alertVC.addAction(unArchiveBtn)
            alertVC.addAction(finishBtn)
        case .finished:
            alertVC.addAction(unFinishBtn)
            alertVC.addAction(archiveBtn)
        case .unFinished:
            return
        case .unArchived:
            return
        case .deleted:
            return
        }
        alertVC.addAction(deleteBtn)
        alertVC.addAction(cencelBtn)
        
        self.present(alertVC, animated: true)
    }
}

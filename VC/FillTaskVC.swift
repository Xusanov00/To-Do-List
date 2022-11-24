//
//  FillTaskVC.swift
//  toDoList
//
//  Created by Ali on 19/11/22.
//

import UIKit


class FillTaskVC: UIViewController {
    
    // title of task
    @IBOutlet weak var titleTF: UITextField!
    // subTitle of task
    @IBOutlet weak var descTxtV: UITextView!
    // priority of task
    @IBOutlet weak var preorityBtn: UIButton!
    // backView of task
    @IBOutlet weak var backView: UIView!
    
    
    // variable for clouser
    var newTask: TaskDM = TaskDM(title: "", subTitle: "", priority: .no)
    
    
    // clouser is created
    var addNewTask: ((TaskDM) -> Void)?
    
    
    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackView()
        descTxtV.layer.borderWidth = 1
        descTxtV.layer.borderColor = UIColor.systemGray5.cgColor
    }
    
    
    // setting BackView
    func setBackView() {
        backView.layer.borderWidth = 1
        backView.clipsToBounds = true
        backView.layer.borderColor = UIColor.green.cgColor
        backView.transform = .init(translationX: 0, y: 1000)
        self.view.backgroundColor = .clear
    }
    
    
    // view WillAppear
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut) {
            self.backView.transform = .identity
            self.view.backgroundColor = .gray.withAlphaComponent(0.2)
        }
        
    }
    
    
    //MARK: - dismiss button (out of view area) tapped
    @IBAction func dismissTapped(_ sender: UIButton) {
        dismissVC()
    }
    
    
    //MARK: - priority VC opening button
    @IBAction func preorityTapped(_ sender: UIButton) {
        let vc = ChoosePriorityVC(nibName: "ChoosePriorityVC", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        
        //saving data from clouser
        vc.choosenPriority = {[self] pri in
            newTask.priority = pri
            preorityBtn.setTitle(pri.rawValue.capitalized, for: .normal)
            preorityBtn.backgroundColor = pri.setPriorityColor()
        }
        present(vc, animated: true)
    }
    
    
    //MARK: - addTask button tapped
    @IBAction func addTaskTapped(_ sender: UIButton) {
        
        //equalizing task details to clouser's variable
        newTask.title = titleTF.text!
        newTask.subTitle = descTxtV.text!
        
        
        if !titleTF.text!.isEmpty {
            guard let addNewTask = addNewTask else { return }
            //clouser returning
            addNewTask(newTask)
            dismissVC()
        }else {
            showAlert(groupType: nil, title: "Please fill the title", message: nil, type: .alert, completion: { _ in
                return
            })
        }
    }
    
    
    //MARK: - animation function
    func dismissVC() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
            self.backView.transform = .init(translationX: 0, y: 1000)
            self.view.backgroundColor = .clear
        } completion: { _ in
            self.dismiss(animated: false)
        }
    }
    
}


//MARK: - extension of Alert function
extension FillTaskVC {
    
    func showAlert() {
        let alertVC = UIAlertController(title: "Pleace fill the task line", message: "", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "Ok", style: .default) { _ in
        }
        
        alertVC.addAction(okBtn)
        self.present(alertVC, animated: true)
    }
}

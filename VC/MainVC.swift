//
//  MainVC.swift
//  toDoList
//
//  Created by Ali on 18/11/22.
//

import UIKit

let cache = UserDefaults.standard

class MainVC: UIViewController {
    
    @IBOutlet weak var taskTable: UITableView!
    
    
    var groupTasks: [TaskGroupDM] = [
        TaskGroupDM(tasks: [], groupType: .new),
        TaskGroupDM(tasks: [], groupType: .archived),
        TaskGroupDM(tasks: [], groupType: .finished),
    ]
    
    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My To-Do List"
        registerTableView()
    }
    
    //MARK: - table view registration
    func registerTableView() {
        taskTable.delegate = self
        taskTable.dataSource = self
        //        taskTable.allowsSelection = false
        taskTable.separatorStyle = .none
        taskTable.register(TaskTVC.nib(), forCellReuseIdentifier: TaskTVC.id)
    }
    
    
    
    
    //MARK: - add task button
    @IBAction func addTask_Tapped(_ sender: UIButton) {
        let vc = FillTaskVC(nibName: "FillTaskVC", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        vc.addNewTask = {[self] task in
            groupTasks[0].tasks.append(task)
            taskTable.reloadData()
        }
        present(vc, animated: false)
    }
    
    
}

//MARK: - UITableViewDelegate
extension MainVC: UITableViewDelegate {
    
    // didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let group = groupTasks[indexPath.section]
        showAlert(groupType: group.groupType, title: "Choose what to do", message: nil, type: .actionSheet) { groupType in
            guard let groupType = groupType else { return }
            switch groupType {
            case .new:
                return
            case .archived:
                let archivedCell = self.groupTasks[indexPath.section].tasks.remove(at: indexPath.row)
                self.groupTasks[1].tasks.append(archivedCell)
            case .finished:
                let archivedCell = self.groupTasks[indexPath.section].tasks.remove(at: indexPath.row)
                self.groupTasks[2].tasks.append(archivedCell)
            case .unFinished:
                let archivedCell = self.groupTasks[indexPath.section].tasks.remove(at: indexPath.row)
                self.groupTasks[0].tasks.append(archivedCell)
            case .unArchived:
                let archivedCell = self.groupTasks[indexPath.section].tasks.remove(at: indexPath.row)
                self.groupTasks[0].tasks.append(archivedCell)
            case .deleted:
                self.groupTasks[indexPath.section].tasks.remove(at: indexPath.row)
            }
            self.taskTable.reloadData()
        }
        //        self.taskTable.reloadData()
    }
    
    //MARK: header of section
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // section view
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30))
        view.backgroundColor = .white
        // section title
        let title = groupTasks[section].groupType.rawValue.capitalized + " Tasks"
        // section label
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: title.widthOfString(usingFont: .boldSystemFont(ofSize: 17))+20, height: 24))
        // view for label
        let lblV = UIView(frame: CGRect(x: 0, y: 0, width: title.widthOfString(usingFont: .boldSystemFont(ofSize: 17))+40, height: 30))
        lblV.backgroundColor = .systemGray6
        lblV.layer.cornerRadius = 12
        view.addSubview(lblV)
        lblV.center = view.center
        lbl.text = title
        lbl.font = .systemFont(ofSize: 20)
        lbl.textColor = .green
        lbl.textAlignment = .center
        
        view.addSubview(lbl)
        lbl.center = view.center
        return view
    }
    
    
    // height of section header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let group = groupTasks[section]
        if group.tasks.isEmpty {
            return 0
        }else {
            return 30
        }
    }
}



//MARK: - UITableViewDataSource
extension MainVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        groupTasks.count
    }
    
    
    // numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groupTasks[section].tasks.count
    }
    
    
    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let rowCell = taskTable.dequeueReusableCell(withIdentifier: TaskTVC.id, for: indexPath) as? TaskTVC else { return UITableViewCell()}
        rowCell.updateCell(cell: groupTasks[indexPath.section].tasks[indexPath.row], groupType: groupTasks[indexPath.section].groupType)
        return rowCell
        
    }
    
    
    // trailing Swipe Action
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteBtn = UIContextualAction(style: .destructive, title: "Delete") {[self] _, _, _ in
            groupTasks[indexPath.section].tasks.remove(at: indexPath.row)
            taskTable.reloadData()
        }
        let configuration = UISwipeActionsConfiguration(actions: [deleteBtn])
        return configuration
    }
    
    
    // selecting cell func
    //    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
    //        let group = groupTasks[indexPath.section]
    //        showAlert(groupType: group.groupType, title: "Choose what to do", message: nil, type: .alert) { groupType in
    //            guard let groupType = groupType else { return }
    //            switch groupType {
    //            case .new:
    //                return
    //            case .archived:
    //                let archivedCell = self.groupTasks[indexPath.section].tasks.remove(at: indexPath.row)
    //                self.groupTasks[1].tasks.append(archivedCell)
    //            case .finished:
    //                let archivedCell = self.groupTasks[indexPath.section].tasks.remove(at: indexPath.row)
    //                self.groupTasks[2].tasks.append(archivedCell)
    //            case .unFinished:
    //                let archivedCell = self.groupTasks[indexPath.section].tasks.remove(at: indexPath.row)
    //                self.groupTasks[0].tasks.append(archivedCell)
    //            case .unArchived:
    //                let archivedCell = self.groupTasks[indexPath.section].tasks.remove(at: indexPath.row)
    //                self.groupTasks[0].tasks.append(archivedCell)
    //            case .deleted:
    //                self.groupTasks[indexPath.section].tasks.remove(at: indexPath.row)
    //            }
    //        }
    //        self.taskTable.reloadData()
    //        return UIContextMenuConfiguration()
    //    }
    
    
}


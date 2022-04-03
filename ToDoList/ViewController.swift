//
//  ViewController.swift
//  ToDoList
//
//  Created by 김인영 on 2022/04/02.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var tasks = [Task](){
        didSet {
            self.saveTasks()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.loadTasks()
    }

    @IBAction func editBtn(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func addBtn(_ sender: UIBarButtonItem) {
        let alert =  UIAlertController(title: "할 일 등록", message: nil, preferredStyle: .alert)
        // weak self 쓰는 이유
        // 클로저는 참조타입이기 때문에 강한 순환참조를 방지하기 위해서 , 상호참조의 경우 메모리 누수가 생길 수 있음
        let registerBtn = UIAlertAction(title: "등록", style: .default, handler: {[weak self]_ in
            guard let title = alert.textFields?[0].text else {return}
            let task = Task(title: title, done: false)
            self?.tasks.append(task)    //할 일 추가됨
            self?.tableView.reloadData()
        })
        let cancelBtn = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancelBtn)
        alert.addAction(registerBtn)
        alert.addTextField(configurationHandler: {textField in
            textField.placeholder = "할 일을 입력해주세요."})
        self.present(alert, animated: true, completion: nil)
    }
    
    func saveTasks(){
        let data = self.tasks.map{
            [
                "title" : $0.title,
                "done" : $0.done
            ]
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "tasks")
    }
    
    func loadTasks(){
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "tasks") as? [[String: Any]] else{ return }
        self.tasks = data.compactMap {
            guard let title = $0["title"] as? String else { return nil }
            guard let done = $0["done"] as? Bool else { return nil }
            return Task(title: title, done: done)
        }
    }
}


extension ViewController: UITableViewDataSource {
    //optional이 붙지않은 함수들을 구현해야함
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 각 세션에 표시할 행의 개수를 묻는 함수
        return self.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //반환할 셀
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let task = self.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        if task.done {
            cell.accessoryType = .checkmark
        } else{
            cell.accessoryType = .none
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var task = self.tasks[indexPath.row]
        task.done = !task.done
        self.tasks[indexPath.row] = task
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

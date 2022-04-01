//
//  CodePushViewController.swift
//  ScreenTransitionExample
//
//  Created by 김인영 on 2022/03/28.
//

import UIKit

protocol SendDataDelegate: AnyObject {
    func sendData(name: String)
}

class CodePushViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    weak var delegate: SendDataDelegate?
    //delegate 앞에는 "weak" var -> 안하면 메모리 누수의 위험
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.nameLabel.text = name
        }
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        self.delegate?.sendData(name: "Inyoung")
        self.navigationController?.popViewController(animated: true)
    }
}

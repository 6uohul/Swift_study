//
//  CodePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by 김인영 on 2022/03/29.
//

import UIKit

class CodePresentViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.nameLabel.text = name
        }

    }
    @IBAction func btnBack(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

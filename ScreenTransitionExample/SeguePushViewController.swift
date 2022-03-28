//
//  SeguePushViewController.swift
//  ScreenTransitionExample
//
//  Created by 김인영 on 2022/03/28.
//

import UIKit

class SeguePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func BtnBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}


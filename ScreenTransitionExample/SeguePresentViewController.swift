//
//  SeguePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by 김인영 on 2022/03/28.
//

import UIKit

class SeguePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func BtnBack(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

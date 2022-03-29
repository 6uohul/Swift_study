//
//  CodePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by 김인영 on 2022/03/29.
//

import UIKit

class CodePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func btnBack(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

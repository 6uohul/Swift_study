//
//  ViewController.swift
//  ScreenTransitionExample
//
//  Created by 김인영 on 2022/03/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func CodePushViewController(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "codePushViewController") else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}


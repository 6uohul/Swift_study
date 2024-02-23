//
//  EnumViewController.swift
//  GrammarStudy
//
//  Created by 김인영 on 2023/02/25.
//

import UIKit

class FitVC: UIViewController {
    
    func fit() {
        var a = 1
        var b = 1
        var c = 0
        
        for i in 0...19 {
            c = a + b
            a = b
            b = c
            print(c)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fit()
    }
}

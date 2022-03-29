//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by 김인영 on 2022/03/29.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var btnYellow: UIButton!
    @IBOutlet weak var btnPurple: UIButton!
    @IBOutlet weak var btnGreen: UIButton!
    @IBOutlet weak var btnBlack: UIButton!
    @IBOutlet weak var btnBlue: UIButton!
    @IBOutlet weak var btnOrange: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func tapTextColor(_ sender: UIButton) {
        if sender == self.btnYellow {
            self.changeTextColor(color: .yellow)
        } else if sender == self.btnPurple {
            self.changeTextColor(color: .purple)
        } else if sender == self.btnGreen {
            self.changeTextColor(color: .green)
        }
    }
   
    @IBAction func tapBackgroundColor(_ sender: UIButton) { 
        if sender == self.btnBlack {
            self.changeTextColor(color: .black)
        } else if sender == self.btnBlue {
            self.changeTextColor(color: .blue)
        } else if sender == self.btnOrange {
            self.changeTextColor(color: .orange)
        }
    }
    @IBAction func btnSave(_ sender: UIButton) {
    }
    
    private func changeTextColor(color: UIColor){
        self.btnYellow.alpha = color == UIColor.yellow ? 1 : 0.2
        self.btnPurple.alpha = color == UIColor.purple ? 1 : 0.2
        self.btnGreen.alpha = color == UIColor.green ? 1 : 0.2
    }
    
    private func changeBackgroundColor(color: UIColor){
        self.btnBlack.alpha = color == UIColor.black ? 1 : 0.2
        self.btnBlue.alpha = color == UIColor.blue ? 1 : 0.2
        self.btnOrange.alpha = color == UIColor.orange ? 1 : 0.2
    }
}

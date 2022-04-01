//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by 김인영 on 2022/03/29.
//

import UIKit

protocol LEDSettingDelegate: AnyObject{
    func changedSetting(text: String?, textcolor: UIColor, backgroundColor: UIColor)
}

class SettingViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var btnYellow: UIButton!
    @IBOutlet weak var btnPurple: UIButton!
    @IBOutlet weak var btnGreen: UIButton!
    @IBOutlet weak var btnBlack: UIButton!
    @IBOutlet weak var btnBlue: UIButton!
    @IBOutlet weak var btnOrange: UIButton!
    
    weak var delegate: LEDSettingDelegate?
    var textColor: UIColor = .yellow
    var backgroundColor: UIColor = .black
    var LEDText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView() //뷰에 초기화
    }
    
    private func configureView(){
        if let LEDText = LEDText {
            self.textField.text = LEDText
        }
        self.changeTextColor(color: self.textColor)
        self.changeBackgroundColor(color: self.backgroundColor)
    }
    
    @IBAction func tapTextColor(_ sender: UIButton) {
        if sender == self.btnYellow {
            self.changeTextColor(color: .yellow)
            self.textColor = .yellow
        } else if sender == self.btnPurple {
            self.changeTextColor(color: .purple)
            self.textColor = .yellow
        } else if sender == self.btnGreen {
            self.changeTextColor(color: .green)
            self.textColor = .green
        }
    }
   
    @IBAction func tapBackgroundColor(_ sender: UIButton) { 
        if sender == self.btnBlack {
            self.changeTextColor(color: .black)
            self.backgroundColor = .black
        } else if sender == self.btnBlue {
            self.changeTextColor(color: .blue)
            self.backgroundColor = .blue
        } else if sender == self.btnOrange {
            self.changeTextColor(color: .orange)
            self.backgroundColor = .orange
        }
    }
    @IBAction func btnSave(_ sender: UIButton) {
        self.delegate?.changedSetting(text: self.textField.text, textcolor: self.textColor, backgroundColor: self.backgroundColor)
        self.navigationController?.popViewController(animated: true)
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

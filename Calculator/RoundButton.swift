//
//  RoundButton.swift
//  Calculator
//
//  Created by 김인영 on 2022/04/01.
//

import UIKit

//라운드 버튼을 디자인
//@IBDesignable
class RoundButton: UIButton {
    //isRound 설정값을 변동시킬수 있도록 IBInspectable 추가함
   @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }
}

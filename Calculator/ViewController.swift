//
//  ViewController.swift
//  Calculator
//
//  Created by 김인영 on 2022/03/31.
//

import UIKit

enum Operation {
    case Add
    case Minus
    case Divide
    case Multiply
    case unknown
}

class ViewController: UIViewController {
    
    @IBOutlet weak var outputOutlet: UILabel!
    
    var displayNumber = ""
    var firstOperand = "" //피연산자
    var secondOperand = "" // 새롭게 입력된 값 (두번째 피연산자)
    var result = "" //결과값
    var currentOperation: Operation = .unknown
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func numberBtn(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if self.displayNumber.count < 9 {
            self.displayNumber += numberValue
            self.outputOutlet.text = self.displayNumber
        }
    }
    
    @IBAction func clearBtn(_ sender: UIButton) {
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperation = .unknown
        self.outputOutlet.text = "0"
    }
    
    @IBAction func dotBtn(_ sender: UIButton) {
        if self.displayNumber.count < 8, !self.displayNumber.contains(".") {
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            self.outputOutlet.text = self.displayNumber
        }
    }
    
    @IBAction func divideBtn(_ sender: UIButton) {
        self.operation(.Divide)
    }
    
    @IBAction func multiplyBtn(_ sender: UIButton) {
        self.operation(.Multiply)
    }
    
    @IBAction func minusBtn(_ sender: UIButton) {
        self.operation(.Minus)
    }
    
    @IBAction func plusBtn(_ sender: UIButton) {
        self.operation(.Add)
    }
    
    @IBAction func equalBtn(_ sender: UIButton) {
        self.operation(self.currentOperation)
    }
    func operation(_ operation: Operation){
        if self.currentOperation != .unknown {
            if !self.displayNumber.isEmpty {
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                
                guard let firstOperand = Double(self.firstOperand) else { return }
                guard let secondOperand =  Double(self.secondOperand) else {return}
                
                switch self.currentOperation {
                case .Add:
                    self.result = "\(firstOperand + secondOperand)"
                case .Minus:
                    self.result = "\(firstOperand - secondOperand)"
                case .Multiply:
                    self.result = "\(firstOperand * secondOperand)"
                case .Divide:
                    self.result = "\(firstOperand / secondOperand)"
                default:
                    break
                }
                
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = "\(Int(result))"
                }

                self.firstOperand = self.result
                self.outputOutlet.text = self.result
            }
            self.currentOperation = operation
        } else {
            self.firstOperand = self.displayNumber
            self.currentOperation = operation
            self.displayNumber = ""
        }
    }
}


//
//  ViewController.swift
//  GrammarStudy
//
//  Created by 김인영 on 2023/01/29.
//

import UIKit

class ArrayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        printResult0()
        printMultiply()
        printEven()
        printTwoLetters()
        printReduceAdd()
    }

    func printResult0() {
        let stringArray: [String] = ["1", "2", "3"]
        let intArray: [Int] = stringArray.map{Int($0)!}
        
        print(intArray, 0000000000)
    }
    
    func printMultiply() {
        
        // numbers의 각 요소에 9 곱하기

        let Numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        var multiplyArray: [Int] = []

        // map 사용해보자
        
        multiplyArray = Numbers.map { $0 * 9 }
        print(multiplyArray)
    }
    
    func printEven() {
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        var evenNumbers: [Int] = numbers.filter { $0 % 2 == 0 }
        print(evenNumbers)
    }
    
    // 이번엔 기존에 있는 String 배열 에서 2글자인 String만 추출하여 String 배열 을 반환
    
    func printTwoLetters() {
        let string = ["안녕하세요", "안녕", "Hi", "배고파", "응"]
        var twoLetters : [String] = string.filter { $0.count == 2 }
        print(twoLetters)
    }
    
    func printReduceAdd() {
        let intArray = [0,2,4,6,8,10]
        var result = intArray.reduce(0) {$0 + $1}
        print(result)
    }
    
    
}


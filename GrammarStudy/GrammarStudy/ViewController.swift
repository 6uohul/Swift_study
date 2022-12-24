//
//  ViewController.swift
//  GrammarStudy
//
//  Created by 김인영 on 2022/11/29.
//

import UIKit

//class Person {
//    var name: String = "person"
//    var age: Int = 0
//    var introduction: String {
//        return "이름:\(name), 나이:\(age)"
//    }
//    func speak() {
//        print("\(name) Speaking...")
//    }
//}
//
//class Student: Person {
//    var grade: String = "F"
//    func study() {
//        print("grade : \(grade)")
//    }
//}
//
//class UniversityStudent: Student {
//    var major: String = "major"
//}

struct Student {
    var name: String = "name"
    var grade: String = "F"
    var upgrade: String = "+"
    
    init(name: String, grade: String) {
        self.name = name
        self.grade = grade
        self.upgrade = grade + "+"
    }
}

class ViewController: UIViewController {
    
    let A: Student = Student(name: "A", grade: "A") // 사용자 정의 이니셜라이저만 사용 가능

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let A: Person = Person()
//        A.name = "A"
//        A.age = 22
//        print(A.introduction)
//        A.speak()
//
//        let B: Student = Student()
//        B.name = "B"
//        B.grade = "B"
//        print(B.introduction)
//        B.speak()
//        B.study()
//
//        let C: UniversityStudent = UniversityStudent()
//        C.name = "C"
//        C.grade = "C"
//        C.major = "Art"
//        print(C.introduction)
//        C.speak()
//        C.study()
    }
}


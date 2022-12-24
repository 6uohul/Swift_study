//
//  Person.swift
//  GrammarStudy
//
//  Created by 김인영 on 2022/11/29.
//

//import Foundation
//
//class Person {
//    var name: String
//    
//    init(name: String) {
//        self.name = "Person"
//        print("Person Init - 이름: \(name)")
//    }
//    
//    func PersonHello() {
//        print("안녕하세요 저는 사람입니다.")
//    }
//}
//
//class Student: Person {
//    var school: String
//    
//    init(school: String) {
//        self.school = "Hongik"
//        super.init(name: "Student")
//        
//        name = "Student"
//        
//        print("Student Init - 이름: \(name), 학교: \(school)")
//    }
//    
//    func StudentHello() {
//        print("안녕하세요 저는 학생입니다.")
//    }
//}
//
//class SOPT: Student {
//    var part: String
//    
//    init(part: String) {
//        self.part = "iOS"
//        super.init(school: "SOPT")
//        
//        name = "SOPT_iOS"
//        
//        print("Student Init - 이름: \(name), 학교: \(school)")
//    }
//    
//    func Hello() {
//        print("안녕하세요 저는 솝트사람입니다.")
//    }
//}

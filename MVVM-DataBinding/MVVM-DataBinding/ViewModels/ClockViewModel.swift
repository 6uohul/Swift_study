//
//  ClockViewModel.swift
//  MVVM-DataBinding
//
//  Created by 김인영 on 2024/02/23.
//

import Foundation

class ClockViewModel {
    
    var didChangeTime: ((ClockViewModel) -> Void)?

    var closureTime: String {
        didSet {
            didChangeTime?(self)
        }
    }
 
    init() {
        closureTime = Clock.currentTime()
    }
    
    // 5. 매 초마다 호출되면서 closureTime에 시간을 담아줌
    func checkTime() {
        closureTime = Clock.currentTime()
    }
}

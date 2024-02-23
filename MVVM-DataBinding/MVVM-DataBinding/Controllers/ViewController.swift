//
//  ViewController.swift
//  MVVM-DataBinding
//
//  Created by 김인영 on 2024/02/23.
//

import UIKit

import Combine
import SnapKit

class ViewController: UIViewController {
    
    private let viewModel = ClockViewModel()
    
    private var closureTimeLabel = UILabel()
    private var observableTimeLabel = UILabel()
    private var combineTimeLabel = UILabel()
    
    private var cancellable: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        startTimer()
        setBindings()
    }
    
    // 매 초마다 시간을 업데이트
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {[weak self] _ in
            self?.viewModel.checkTime()
        }
    }
    
    // 클로저의 동작을 담아 저장
    private func setBindings() {
        viewModel.didChangeTime = {[weak self] viewModel in
            self?.closureTimeLabel.text = viewModel.closureTime
        }
        
        viewModel.$combineTime
        .compactMap{String($0)}
        .assign(to: \.text, on: combineTimeLabel)
        .store(in: &cancellable)
        
    }
    
    private func setLayout() {
        view.addSubview(closureTimeLabel)
        view.addSubview(observableTimeLabel)
        view.addSubview(combineTimeLabel)
        
        closureTimeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
        }
        
        observableTimeLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        combineTimeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(100)
        }
    }
}

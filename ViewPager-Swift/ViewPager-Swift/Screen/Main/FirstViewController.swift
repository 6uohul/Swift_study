//
//  FirstViewController.swift
//  ViewPager-Swift
//
//  Created by 김인영 on 2022/12/28.
//

import UIKit

class FirstViewController: UIViewController {
    
    //dummy
    let BookDummy : [RecommendModel] = [
        RecommendModel(image: UIImage(named: "bookImage"), name: "개발잘하고싶으면읽기좋은책", writer: "천재개발자", recommendedTo: "인영이에게 추천받은 책", memo: "개발잘하고싶으면읽어보거라개발잘하고싶으면읽어보거라개발잘하고싶으면읽어보거라개발잘하고싶으면읽어보거라개발잘하고싶으면읽어보거라"),
        RecommendModel(image: UIImage(named: "bookImage"), name: "개발잘하고싶으면읽기좋은책", writer: "천재개발자", recommendedTo: "인영이에게 추천받은 책", memo: "개발잘하고싶으면읽어보거라개발잘하고싶으면읽어보거라개발잘하고싶으면읽어보거라개발잘하고싶으면읽어보거라개발잘하고싶으면읽어보거라"),
        RecommendModel(image: UIImage(named: "bookImage"), name: "개발잘하고싶으면읽기좋은책", writer: "천재개발자", recommendedTo: "인영이에게 추천받은 책", memo: "개발잘하고싶으면읽어보거라개발잘하고싶으면읽어보거라개발잘하고싶으면읽어보거라개발잘하고싶으면읽어보거라개발잘하고싶으면읽어보거라"),
        RecommendModel(image: UIImage(named: "bookImage"), name: "밝은 밤", writer: "최은영", recommendedTo: "인영이에게 추천받은 책", memo: "메모메모메모메모메모메모메모메모")
    ]

    lazy var tableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.showsVerticalScrollIndicator = true
        $0.isScrollEnabled = true
        $0.allowsMultipleSelection = false
        $0.separatorStyle = .none
        $0.delegate = self
        $0.dataSource = self
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        setLayout()
    }
}

extension FirstViewController {
    
    private func register() {
        tableView.register(BookTableViewCell.self, forCellReuseIdentifier: BookTableViewCell.identifier)
    }
    
    private func setLayout() {
        view.addSubviews(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension FirstViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BookDummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BookTableViewCell.identifier, for: indexPath) as? BookTableViewCell else { return UITableViewCell() }
        cell.dataBind(model: BookDummy[indexPath.item])
        return cell
    }
}

//
//  ViewController.swift
//  GenerateSayings
//
//  Created by 김인영 on 2022/03/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    let quotes = [
        Quote(contents: "삶이 있는 한 희망은 있다.", name: "키케로"),
        Quote(contents: "피할 수 없으면 즐겨라", name: "로버트 엘리엇"),
        Quote(contents: "언제나 현재에 집중할 수 있다면 행복할 것이다.", name: "파울로 코엘료"),
        Quote(contents: "진정으로 웃으려면 고통을 참아야 하며, 나아가 고통을 즐길 줄 알아야해", name: "찰리 채플린"),
        Quote(contents: "평생 살 것처럼 꿈을 꾸어라. 그리고 내일 죽을 것처럼 오늘을 살아라", name: "제임스 딘")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnCreateQuote(_ sender: Any) {
        let random = Int(arc4random_uniform(5))  //0~4사이의 난수를 랜덤하게 생성
        let quote = quotes[random]
        self.quoteLabel.text = quote.contents
        self.nameLabel.text = quote.name
    }
}


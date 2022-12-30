//
//  BookTableViewCell.swift
//  ViewPager-Swift
//
//  Created by 김인영 on 2022/12/30.
//

import UIKit
import Then
import SnapKit

class BookTableViewCell: UITableViewCell {
    
    static let identifier = "BookTableViewCell"
    
    private let bookImage = UIImageView()
    
    private let bookNameLabel = UILabel().then {
        $0.text = "개발잘하고싶으면읽기좋은책"
        $0.font = .systemFont(ofSize: 14, weight: .medium)
    }
    
    private let bookWriterLabel = UILabel().then {
        $0.text = "천재개발자"
        $0.font = .systemFont(ofSize: 14, weight: .medium)
    }
    
    private let bookRecommendToLabel = UILabel().then {
        $0.text = "누구에게 추천받았을과"
        $0.font = .systemFont(ofSize: 14, weight: .medium)
    }
    
    private let bookRecommendTextLabel = UILabel().then {
        $0.numberOfLines = 5
        $0.text = "개발잘하고싶으면읽어보거라"
        $0.font = .systemFont(ofSize: 14, weight: .medium)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // UITableViewCell을 상속받은 custom cell에서 layoutSubviews메소드 override

    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 10))
    }
}

extension BookTableViewCell {
    func setLayout() {
        contentView.addSubviews(bookImage, bookNameLabel, bookWriterLabel, bookRecommendToLabel, bookRecommendTextLabel)
        contentView.backgroundColor = .lightGray
        contentView.layer.cornerRadius = 10
        bookImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(9)
            $0.leading.equalToSuperview().offset(14)
        }
        
        bookNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(35)
            $0.leading.equalTo(bookImage.snp.trailing).offset(5)
        }
        
        bookWriterLabel.snp.makeConstraints {
            $0.top.equalTo(bookNameLabel.snp.bottom).offset(28)
            $0.leading.equalTo(bookNameLabel)
        }
        
        bookRecommendToLabel.snp.makeConstraints {
            $0.top.equalTo(bookWriterLabel.snp.bottom).offset(28)
            $0.leading.equalTo(bookNameLabel)
        }
        
        bookRecommendTextLabel.snp.makeConstraints {
            $0.top.equalTo(bookImage.snp.bottom).offset(5)
            $0.leading.width.equalToSuperview().inset(20)
        }
    }
    
    
    
    func dataBind(model: RecommendModel) {
        bookImage.image = model.image
        bookNameLabel.text = model.name
        bookWriterLabel.text = model.writer
        bookRecommendToLabel.text = model.recommendedTo
        bookRecommendTextLabel.text = model.memo
    }
}

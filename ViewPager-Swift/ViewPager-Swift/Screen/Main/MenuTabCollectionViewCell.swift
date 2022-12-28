//
//  MenuTabCollectionViewCell.swift
//  ViewPager-Swift
//
//  Created by 김인영 on 2022/12/24.
//

import UIKit
import Then
import SnapKit

class MenuTabCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MenuTabCollectionViewCell"
    
    override var isHighlighted: Bool {
        didSet {
            menuUnderLineView.backgroundColor = isSelected ? .darkGray : .lightGray
        }
    }
    
    override var isSelected: Bool {
        didSet {
            menuUnderLineView.backgroundColor = isSelected ? .darkGray : .lightGray
            UIView.animate(withDuration: 0.3,
                           delay: 0,
                           options: .curveEaseOut,
                           animations: {
                self.menuUnderLineView.layoutIfNeeded()
                self.menuUnderLineView.alpha = self.isSelected ? 1 : 0.1
            }, completion: nil)
        }
    }
    
    private let menuLabel = UILabel().then {
        $0.text = "book"
        $0.font = .systemFont(ofSize: 14, weight: .bold)
    }
    private let menuUnderLineView = UIView().then {
        $0.backgroundColor = .darkGray
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuTabCollectionViewCell {
    private func setLayout() {
        
        contentView.addSubviews(menuLabel, menuUnderLineView)
        menuLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        menuUnderLineView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(2)
        }
    }
}

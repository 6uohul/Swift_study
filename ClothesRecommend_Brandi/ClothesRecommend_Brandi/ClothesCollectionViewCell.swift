//
//  ClothesCollectionViewCell.swift
//  ClothesRecommend_Brandi
//
//  Created by 김인영 on 2022/10/19.
//

import UIKit
import SnapKit
import Then

//MARK: - ClothesCollectionViewCell

final class ClothesCollectionViewCell: UICollectionViewCell {
    
    // MARK: - identifier
    static let identifier = "ClothesCollectionViewCell"
    
    // MARK: - UI Components
    private let clothesContainerView = UIView()
    private let clothesImageView = UIImageView()
    private let titleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 10, weight: .thin)
    }
    private let brandLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    private let priceLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 15, weight: .semibold)
    }
    
    // MARK: - Life Cycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ClothesCollectionViewCell {
    
    //MARK: - Layout
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        [clothesContainerView, titleLabel, brandLabel, priceLabel].forEach {
            contentView.addSubview($0)
        }
        clothesContainerView.addSubview(clothesImageView)
        clothesContainerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(9)
            $0.height.equalTo(190)
        }
        
        clothesImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        brandLabel.snp.makeConstraints {
            $0.top.equalTo(clothesContainerView.snp.bottom).offset(8)
            $0.leading.equalTo(clothesContainerView).offset(4)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(brandLabel.snp.bottom).offset(4)
            $0.leading.equalTo(brandLabel)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(6)
            $0.leading.equalTo(titleLabel)
        }
        
    }
    
    //MARK: - dataBind
    
    func dataBind(model: ClothesModel) {
        titleLabel.text = model.title
        brandLabel.text = model.brand
        priceLabel.text = model.price
        clothesImageView.image = UIImage(named: model.clothesImage)
    }
}

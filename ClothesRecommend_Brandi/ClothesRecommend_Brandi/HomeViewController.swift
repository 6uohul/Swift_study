//
//  HomeViewController.swift
//  ClothesRecommend_Brandi
//
//  Created by 김인영 on 2022/10/19.

//  홈 화면

import UIKit
import SnapKit
import Then

class HomeViewController: UIViewController {

    // MARK: - UI Components
    private lazy var clothesCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = true
        
        return collectionView
    }()
    
    //MARK: - Variables
    var ClothesList : [ClothesModel] = [
        ClothesModel(clothesImage: "clothes_1", title: "썸머부클꽈배기배색가디건", brand: "알로항", price: "29,900원"),
        ClothesModel(clothesImage: "clothes_2", title: "멜로 크롭 니트 - 4 color", brand: "메이글", price: "20,000원"),
        ClothesModel(clothesImage: "clothes_3", title: "킬러 카고 와이드 데님 팬츠", brand: "완스몰", price: "32,900원")
    ]
    
    //MARK: - Constants
    final let ClothesInset: UIEdgeInsets = UIEdgeInsets(top: 55, left: 20, bottom: 10, right: 20)
    final let ClothesLineSpacing: CGFloat = 10
    final let ClothesInterItemSpacing: CGFloat = 21
    final let ClothesCellHeight: CGFloat = 200
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    

}

// MARK: - Extensions

extension HomeViewController {
    private func layout() {
        view.backgroundColor = .white
        view.addSubview(clothesCollectionView)
        clothesCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(28)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(calculateCellHeight())
            
        }
    
    }
    
    func calculateCellHeight() -> CGFloat {
        let count = CGFloat(ClothesList.count)
        let heightCount = count / 2 + count.truncatingRemainder(dividingBy: 2)
        return heightCount * ClothesCellHeight + (heightCount - 1) * ClothesLineSpacing + ClothesInset.top + ClothesInset.bottom
    }
}

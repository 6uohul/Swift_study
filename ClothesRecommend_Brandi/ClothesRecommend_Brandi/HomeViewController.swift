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
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    //브랜디 로고 라벨
    private let BrandiLabel : UILabel = {
        let label = UILabel()
        label.text = "Brandi"
        label.textColor = .black
        label.font = .systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    //검색 버튼
    private lazy var searchButton : UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(touchUpSearchButton))
        button.tintColor = .gray
        return button
    }()
    
    //장바구니 버튼
    
    
    //MARK: - Variables
    var ClothesList : [ClothesModel] = [
        ClothesModel(clothesImage: "clothes_1", title: "썸머부클꽈배기배색가디건", brand: "알로항", price: 29900),
        ClothesModel(clothesImage: "clothes_2", title: "멜로 크롭 니트 - 4 color", brand: "메이글", price: 20000),
        ClothesModel(clothesImage: "clothes_3", title: "킬러 카고 와이드 데님 팬츠", brand: "완스몰", price: 32900),
        ClothesModel(clothesImage: "clothes_4", title: "폴로랄프로렌 V넥 꽈배기 니트", brand: "폴로랄프로렌", price: 219000),
        ClothesModel(clothesImage: "clothes_5", title: "플라워 퍼프 랩 원피스", brand: "어썸", price: 67000),
        ClothesModel(clothesImage: "clothes_6", title: "캘빈클라인 로고 반팔 티셔츠", brand: "캘빈클라인", price: 95700)
    ]
    
    //MARK: - Constants
    final let ClothesInset: UIEdgeInsets = UIEdgeInsets(top: 30, left: 15, bottom: 10, right: 15)
    final let ClothesLineSpacing: CGFloat = 90
    final let ClothesInterItemSpacing: CGFloat = 0
    final let ClothesCellHeight: CGFloat = 360
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        register()
        setting()
    }
    
    //검색 버튼
    @objc
    private func touchUpSearchButton() {
        print("Search Clicked!")
    }

}

// MARK: - Extensions

extension HomeViewController {
    
    //MARK: - layout
    private func layout() {
        view.backgroundColor = .white
        view.addSubview(clothesCollectionView)
        clothesCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(calculateCellHeight())
        }
        view.addSubview(BrandiLabel)
//        BrandiLabel.snp.makeConstraints {
//            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(5)
//            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(5)
//        }
    }
    
    func calculateCellHeight() -> CGFloat {
        let count = CGFloat(ClothesList.count)
        let heightCount = count / 2 + count.truncatingRemainder(dividingBy: 2)
        return heightCount * ClothesCellHeight + (heightCount - 1) * ClothesLineSpacing + ClothesInset.top + ClothesInset.bottom
    }
    
    //MARK: - register
    private func register() {
        clothesCollectionView.register(ClothesCollectionViewCell.self, forCellWithReuseIdentifier: ClothesCollectionViewCell.identifier)
    }
    
    private func setting() {
        self.navigationItem.rightBarButtonItem = self.searchButton
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: BrandiLabel)
    }
    
}


extension HomeViewController: UICollectionViewDelegateFlowLayout {

        // cell 하나의 크기를 정해주는 함수에요. CGSize를 리턴합니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - ClothesInset.left - ClothesInset.right - ClothesInterItemSpacing
        return CGSize(width: doubleCellWidth / 2, height: 200)
    }
    
        // Layout 구현 흐름에서 줄 바꿈의 간격을 정해주는 함수에요.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return ClothesLineSpacing
    }
    
        // Layout 구현 흐름에서 줄 바꿈이 아닌 셀 간 간격을 정해주는 함수에요.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return ClothesInterItemSpacing
    }
    
        // CollectionView 섹션 하나 당의 Inset을 정해주는 함수에요.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return ClothesInset
    }
}

// MARK: -UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
        
        // cell 몇 개 만들래? 라고 물어봅니다,,,
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ClothesList.count
    }
    
        // 어떤 cell을 만들거니? 라고 물어보네요,,,
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let clothesCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ClothesCollectionViewCell.identifier, for: indexPath)
                as? ClothesCollectionViewCell else { return UICollectionViewCell() }
        clothesCell.dataBind(model: ClothesList[indexPath.item])
        return clothesCell
    }
}

//
//  dd.swift
//  ClothesRecommend_Brandi
//
//  Created by 김인영 on 2022/11/19.
//

import Foundation
import UIKit

extension Int {
    var adjusted: CGFloat {
        let ratio: CGFloat = CGFloat(UIScreen.main.bounds.width) / 375
        let ratioH: CGFloat = CGFloat(UIScreen.main.bounds.height) / 812
        return ratio <= ratioH ? CGFloat(self) * ratio : CGFloat(self) * ratioH
    }
}

extension Double {
    var adjusted: CGFloat {
        let ratio: CGFloat = CGFloat(UIScreen.main.bounds.width) / 375
        let ratioH: CGFloat = CGFloat(UIScreen.main.bounds.height) / 812
        return ratio <= ratioH ? CGFloat(self) * ratio : CGFloat(self) * ratioH
    }
}

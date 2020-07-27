//
//  MainListCell.swift
//  idusdev
//
//  Created by Hanamobile on 2020/07/25.
//  Copyright © 2020 kr.talq. All rights reserved.
//

import UIKit
import Cosmos
import Kingfisher

class MainListCell: UITableViewCell {

    // -------------------------------------------------------------
     // MARK: - Outlet Definition
     // -------------------------------------------------------------
     
     // MARK: - UIView
     @IBOutlet weak var viewMain: UIView!
     @IBOutlet weak var viewLine: UIView!
    
    // MARK: - UIImageView
    @IBOutlet weak var lbAppName: UILabel!
    @IBOutlet weak var lbAppCorp: UILabel!
    @IBOutlet weak var lbAppCategory: UILabel!
    @IBOutlet weak var lbAppPrice: UILabel!
    
    // MARK: - Star Rating
    @IBOutlet weak var starRating: CosmosView!
    @IBOutlet weak var imgMain: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
        contentView.backgroundColor = .back_gray_color
        // 셀 초기화시 라운드 및 테두리선 효과
        viewMain.setCustomView(isRound: true, radius: 5, isBorder: true, borderWidth: 1, borderColor: .line_gray_color)
        // 중간 선 색 초기화
        viewLine.backgroundColor = .line_gray_color
    }
    
    //Data에 따른 각 Cell 데이터 세팅
    func setDataToView(delegate:UIViewController?, data:Any?){
        
        if let info = data as? Appstore_Info{
            
            //메인 이미지 세팅
            if let url = URL.init(string: info.artworkUrl512 ?? ""){
                imgMain.kf.setImage(with: url)
            }
            
            //각 데이터 초기화
            lbAppName.text = info.trackCensoredName
            lbAppCorp.text = info.sellerName
            var categorys:String = ""
            info.genres?.forEach{ categorys += $0 }
            lbAppCategory.text = categorys
            lbAppPrice.text = info.formattedPrice
            
            //별점 화면 초기화
            starRating.rating = info.averageUserRatingForCurrentVersion ?? 0
             
        }
    }

}

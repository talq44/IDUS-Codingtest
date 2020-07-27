//
//  CategoryCell.swift
//  idusdev
//
//  Created by Hanamobile on 2020/07/25.
//  Copyright © 2020 kr.talq. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    // -------------------------------------------------------------
    // MARK: - Outlet Definition
    // -------------------------------------------------------------
    
    // MARK: - UIView
    @IBOutlet weak var viewCategory1: UIView!
    @IBOutlet weak var viewCategory2: UIView!
    
    @IBOutlet var viewLines:[UIView]!
    
    // MARK: - UILabel
    @IBOutlet weak var lbCategory1: UILabel!
    @IBOutlet weak var lbCategory2: UILabel!
    
    // -------------------------------------------------------------
    // MARK: - Outlet Array
    // -------------------------------------------------------------
    lazy var arrViewCategorys:[UIView] = [viewCategory1, viewCategory2]
    lazy var arrLbCategorys:[UILabel] = [lbCategory1, lbCategory2]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
        viewLines.forEach{ $0.backgroundColor = .line_gray_color}
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setDataToView(delegate:UIViewController?, data:Any?){
        //앱스토어 카테고리는 두 가지만 등록할수 있어 두가지에 대해서만 적용
        //혹시나 카테고리가 추후 더 등록할것을 대비해 2개까지만 허용
        arrViewCategorys.forEach{$0.isHidden = true}
        if let infos = data as? [String]{
            infos.enumerated().forEach{
                if $0.offset < 2{
                    arrLbCategorys[$0.offset].text = "#" + $0.element
                    arrViewCategorys[$0.offset].isHidden = false
                    arrViewCategorys[$0.offset].setCustomView(isRound: true, radius: 3, isBorder: true, borderWidth: 1, borderColor: .lightGray)
                }
            }
        }
    }

}

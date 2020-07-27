//
//  InfosDetailCell.swift
//  idusdev
//
//  Created by Hanamobile on 2020/07/26.
//  Copyright © 2020 kr.talq. All rights reserved.
//

import UIKit

class InfosDetailCell: UITableViewCell {
    
    // -------------------------------------------------------------
    // MARK: - Outlet Definition
    // -------------------------------------------------------------
    
    // MARK: - UILabel
    @IBOutlet weak var viewMain: UIView!
    // MARK: - UIView
    @IBOutlet weak var lbDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        viewMain.backgroundColor = .back_gray_color
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    /**
     - delegate : 부모 VC
     - data : 내용 String
     */
    func setDataToView(delegate:UIViewController? , data:Any?){
        if let info = data as? String{
            lbDescription.text = info
        }
    }

}

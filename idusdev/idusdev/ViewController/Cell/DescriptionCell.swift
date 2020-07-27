//
//  DescriptionCell.swift
//  idusdev
//
//  Created by Hanamobile on 2020/07/25.
//  Copyright © 2020 kr.talq. All rights reserved.
//

import UIKit

class DescriptionCell: UITableViewCell {
    // -------------------------------------------------------------
    // MARK: - Outlet Definition
    // -------------------------------------------------------------
    // MARK: - UILabel
    @IBOutlet weak var lbDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    /**
     - delegate : 부모VC
     - data : 내용 String
     */
    func setDataToView(delegate:UIViewController, data:Any?){
        if let info = data as? String{
            lbDescription.text = info
        }
    }
}

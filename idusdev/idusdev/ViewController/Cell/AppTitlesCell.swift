//
//  AppTitlesCell.swift
//  idusdev
//
//  Created by Hanamobile on 2020/07/25.
//  Copyright © 2020 kr.talq. All rights reserved.
//

import UIKit

class AppTitlesCell: UITableViewCell {
    // -------------------------------------------------------------
    // MARK: - Outlet Definition
    // -------------------------------------------------------------
    
    // MARK: - UIView
    @IBOutlet weak var viewBtnSpace: UIView!
    
    @IBOutlet var viewLines:[UIView]!
    // MARK: - UILabel
    @IBOutlet weak var lbAppName: UILabel!
    @IBOutlet weak var lbAppCorp: UILabel!
    @IBOutlet weak var lbAppPrice: UILabel!
    
    // -------------------------------------------------------------
    // MARK: - Value Definition
    // -------------------------------------------------------------
    
    var delegate:UIViewController?
    var appInfo:Appstore_Info?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        viewBtnSpace.setCustomView(isRound: true, radius: 5, isBorder: true, borderWidth: 1, borderColor: .line_gray_color)
        viewLines.forEach{ $0.backgroundColor = .line_gray_color}
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    /**
     - delegate : 부모 VC
     - data : Appstore_Info 형태
     */
    func setDataToView(delegate:UIViewController?, data:Any?){
        self.delegate = delegate
        
        if let info = data as? Appstore_Info{
            self.appInfo = info
            lbAppName.text = info.trackCensoredName
            lbAppCorp.text = info.sellerName
            lbAppPrice.text = info.formattedPrice
        }
    }

    @IBAction func selectBtnShowWeb(_ sender: Any) {
        //웹페이지 이동
        if let url = URL.init(string: self.appInfo?.trackViewUrl ?? ""){
            if UIApplication.shared.canOpenURL(url){
                UIApplication.shared.open(url, options:[ :], completionHandler: nil)
            }
        }
    }
    @IBAction func selectBtnShowShare(_ sender: Any) {
        //공유하기 이동
        if let vc = delegate{
            let activity = UIActivityViewController(activityItems: [self.appInfo?.trackViewUrl ?? ""], applicationActivities: nil)
            vc.present(activity, animated: true) {
                
            }
        }
    }
}

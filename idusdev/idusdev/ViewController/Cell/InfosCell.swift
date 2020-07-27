//
//  InfosCell.swift
//  idusdev
//
//  Created by Hanamobile on 2020/07/25.
//  Copyright © 2020 kr.talq. All rights reserved.
//

import UIKit

class InfosCell: UITableViewCell {

    // -------------------------------------------------------------
    // MARK: - Outlet Definition
    // -------------------------------------------------------------
    
    // MARK: - UIView
    @IBOutlet weak var viewLine: UIView!
    // MARK: - UILabel
    @IBOutlet weak var lbDesc: UILabel!
    @IBOutlet weak var lbContents: UILabel!
    
    // MARK: - UIImageView
    @IBOutlet weak var imgUnderArrow: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        viewLine.backgroundColor = .line_gray_color
    }
    
    /**
     - delegate : 부모 VC
     - type : CellType
     - isSelect : NewFunc type arrow를 위한 값
     - data : 내용 String
     */
    func setDataToView(delegate:UIViewController, type:CellType, isSelect:Bool = false, data:Any?){
        
        lbDesc.text = type.rawValue
        imgUnderArrow.isHidden = true
        
        if let info = data as? String{
            lbContents.text = info
            
            switch type {
            case .Size:
                lbContents.text = getSizeBiteString(info)
                break
            case .NewFunc:
                imgUnderArrow.isHidden = false
                imgUnderArrow.image = UIImage(named: isSelect ? "icon_arrow_up_gray" : "icon_arrow_down_gray")
            default:
                break
            }
        }
    }
    
    ///사이즈를 전환해 표현
    func getSizeBiteString(_ strValue:String) -> String{
        if let value = Double(strValue){
            if value < 1024{
                
                return String(format: "%.2f Byte", value)
            }else if value < pow(1024, 2){
                return String(format: "%.2f KB", (value / 1024))
            }else if value < pow(1024, 3){
                return String(format: "%.2f MB", (value / pow(1024, 2)))
            }else if value < pow(1024, 4){
                return String(format: "%.2f GB", (value / pow(1024, 3)))
            }else{
                return String(format: "%.2f TB", (value / pow(1024, 4)))
            }
        }else{
            return "알수없음"
        }
    }
}

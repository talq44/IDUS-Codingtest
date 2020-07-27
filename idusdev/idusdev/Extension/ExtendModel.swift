//
//  ExtendModel.swift
//  idusdev
//
//  Created by Hanamobile on 2020/07/25.
//  Copyright © 2020 kr.talq. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    class func initFromNib<T: UIView>(index : Int? = 0) -> T {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?[index!] as! T
    }
    func setCustomView(isRound:Bool = false, radius:CGFloat = 0, isBorder:Bool = false, borderWidth:CGFloat = 0, borderColor:UIColor! = nil){
        if radius > 0{
            self.clipsToBounds = true
            self.layer.cornerRadius = radius
        }
        if isBorder {
            layer.borderWidth = borderWidth
            if let color = borderColor{
                layer.borderColor = color.cgColor
            }
        }
        
    }
}
extension Encodable{
    func toJsonData() -> Data?{
        return try? JSONEncoder().encode(self)
    }
    func toJsonString() -> String? {
        if let data = self.toJsonData(){
            return String.init(data: data, encoding: .utf8)
        }
        return ""
    }
}

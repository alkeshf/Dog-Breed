//
//  UIImageView+extenstion.swift
//  Interview
//
//  Created by Alkesh Fudani on 12/10/20.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    internal func changeTintColor(color:UIColor){
        let image = self.image?.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
        self.image = image
    }
    
    func LoadImage(url:String) -> Void {
        
       if(url == ""){
           return
       }
       self.sd_imageIndicator = SDWebImageActivityIndicator.gray
       self.sd_setImage(with: URL(string: url), placeholderImage: nil, options: .highPriority, completed: { (img:UIImage?, error:Error?, type:SDImageCacheType, url:URL?) in
           self.image = img
       })
    }
    
   
}

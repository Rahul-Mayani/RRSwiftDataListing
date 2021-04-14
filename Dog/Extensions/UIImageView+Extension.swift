//
//  UIImageView+Extension.swift
//  Dog
//
//  Created by Rahul Mayani on 14/04/21.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func setKingfisherImageView(image: String?, placeholder: String = "") {
        var path = ""
        if let url = image {
            path = url
        }
                
        if placeholder.isEmpty {
            self.kf.indicatorType = .activity
            let indicator = self.kf.indicator?.view as? UIActivityIndicatorView
            //indicator?.style = .whiteLarge
            indicator?.color = R.color.blueColor()!
        }
        
        self.kf.setImage(
            with: URL(string: path),
            placeholder: UIImage(named: placeholder),
            options: [
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
}

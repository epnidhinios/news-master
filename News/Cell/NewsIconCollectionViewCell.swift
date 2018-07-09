//
//  NewsIconCollectionViewCell.swift
//  News
//
//  Created by Nidhin on 5/25/18.
//  Copyright © 2018 TCS_MX. All rights reserved.
//

import UIKit

class NewsIconCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "NewsIconCollectionViewCell"
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        //setUpUI()
    }
    
    func setUpUI(){
        
        setDynamicImageColorBackground()

        self.contentView.layer.cornerRadius = 10.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 1.5
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        
    }
    
    func setDynamicImageColorBackground(){
        
        DispatchQueue.main.async {
            if let dominantColor = self.imgView.image {
                UIView.animate(withDuration: 1.0, animations: {
                    self.contentView.backgroundColor = UIColor(patternImage: dominantColor)
                })
            }
        }
    }
}

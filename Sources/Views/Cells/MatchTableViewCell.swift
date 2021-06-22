//
//  File.swift
//  
//
//  Created by Kegham Karsian on 20/06/2021.
//

import Foundation
import UIKit

class MatchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var homeImgView UIImageView!
    @IBOutlet weak var awayImgView UIImageView!
    
    @IBOutlet weak var homelbl UILable!
    
    @IBOutlet weak var awaylbl UILable!
    
    @IBOutlet weak var locationlbl UILable!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            homeImgView.layer.cornerRadius = 35
            awayImgView.layer.cornerRadius = 35
        } else {
            homeImgView.magicallySetCornerRadius()
            awayImgView.magicallySetCornerRadius()
        }
    }
}

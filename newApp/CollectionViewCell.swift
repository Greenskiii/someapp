//
//  CollectionViewCell.swift
//  newApp
//
//  Created by Алексей Даневич on 21.09.2021.
//

import UIKit
import SDWebImage




class CollectionViewCell: UICollectionViewCell {
    
    

    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var gradientView: UIView!
    

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setGradientBackground(view: gradientView)
        self.typeLabel.textColor = .white
        self.costLabel.textColor = .white
        self.mainView.layer.cornerRadius = 8
        self.mainView.clipsToBounds = true
        self.mainView.backgroundColor = .gray


    }
    
    func configure(with pizza: Pizza){
        self.imageView.sd_setImage(with: URL(string: pizza.picture))
        self.typeLabel.text = pizza.type
        self.costLabel.text = "От \(pizza.smallCost) грн"
    }
    
    func setGradientBackground(view: UIView) {
        let colorTop =  UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.0).cgColor
        let colorBottom = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
        
        view.layer.insertSublayer(gradientLayer, at:0)
    }
}

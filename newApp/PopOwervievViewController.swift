//
//  PopViewController.swift
//  newApp
//
//  Created by Алексей Даневич on 27.09.2021.
//

import Foundation
import UIKit
import SDWebImage

class PopOwervievViewController: UIViewController {
    
    @IBOutlet weak var someView: UIView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var pizza: Pizza? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.sd_setImage(with: URL(string: pizza!.picture))
        self.overviewLabel.text = pizza?.overview
        self.imageView.layer.cornerRadius = 24
        self.someView.layer.cornerRadius = 24
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.75)

    }
    
    @IBAction func exitButton(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
}

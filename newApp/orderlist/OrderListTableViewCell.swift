//
//  OrderListTableViewCell.swift
//  newApp
//
//  Created by Алексей Даневич on 20.10.2021.
//

import UIKit

class OrderListTableViewCell: UITableViewCell {
    
    
    var order: OrderRealm? = nil
    
    @IBOutlet weak var pictureImageView: UIImageView!
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.countLabel.layer.cornerRadius = 8
        self.pictureImageView.layer.cornerRadius = 8
        
        
    }
    
    func configure(with order: OrderRealm){
        
        self.typeLabel.text = order.title
        self.pictureImageView.sd_setImage(with: URL(string: order.picture))
        self.sizeLabel.text = order.size
        self.costLabel.text = String(order.cost)
        self.countLabel.text = String(order.count)

        
    }
    @IBAction func addCount(_ sender: Any) {
        self.countLabel.text = "\(Int(self.countLabel.text!)! + 1)"
    }
    @IBAction func minusCount(_ sender: Any) {
        self.countLabel.text = "\(Int(self.countLabel.text!)! - 1)"
    }
    @IBAction func deletePressedButton(_ sender: Any) {
        
    }
}

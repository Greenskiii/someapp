//
//  TableViewCell.swift
//  newApp
//
//  Created by Алексей Даневич on 19.10.2021.
//

import UIKit

protocol MyCellDelegate: AnyObject {
    func orderButtonPressed(cell: TableViewCell)
}

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var pizzaTypeLabel: UILabel!
    @IBOutlet weak var ingradientsLabel: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    var pizza: Pizza? = nil
    weak var delegate: MyCellDelegate?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.mainView.clipsToBounds = true
        self.mainView.layer.cornerRadius = 8
        self.orderButton.layer.cornerRadius = 8
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    func configure(with pizza: Pizza){
        self.photoImageView.sd_setImage(with: URL(string: pizza.picture))
        self.pizzaTypeLabel.text = pizza.type
        self.costLabel.text = "От \(pizza.smallCost) грн"
        self.ingradientsLabel.text = pizza.ingredients
    }
    
    
    @IBAction func orderButtonPressed(_ sender: Any) {
        delegate?.orderButtonPressed(cell: self)
    }
    
}

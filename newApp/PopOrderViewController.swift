//
//  PopOrderViewController.swift
//  newApp
//
//  Created by Алексей Даневич on 28.09.2021.
//

import Foundation
import UIKit

class PopOrderViewController: UIViewController {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var someView: UIView!
    @IBOutlet weak var countStepper: UIStepper!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var ordButton: UIButton!
    @IBOutlet weak var pizzaCountLabel: UILabel!
    @IBOutlet weak var ingradientsLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    var pizza: Pizza? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ordButton.layer.cornerRadius = 16
        self.pizzaCountLabel.text = String(self.countStepper.value)
        self.someView.layer.cornerRadius = 24
        self.ordButton.layer.cornerRadius = 24
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.75)

        
    }
    
    @IBAction func countStepperPressed(_ sender: Any) {
        self.pizzaCountLabel.reloadInputViews()
    }
    
    @IBAction func orderButton(_ sender: Any) {
        
        
    }
    @IBAction func closeButton(_ sender: Any) {
        self.view.removeFromSuperview()
    }
}

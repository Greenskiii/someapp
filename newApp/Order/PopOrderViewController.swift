//
//  PopOrderViewController.swift
//  newApp
//
//  Created by Алексей Даневич on 28.09.2021.
//

import Foundation
import UIKit
import RealmSwift

class PopOrderViewController: UIViewController {
    
    @IBOutlet weak var pizzaSizeSegmentedController: UISegmentedControl!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var someView: UIView!
    @IBOutlet weak var countStepper: UIStepper!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var ordButton: UIButton!
    @IBOutlet weak var pizzaCountLabel: UILabel!
    @IBOutlet weak var ingradientsLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    
    
    var pizza: Pizza? = nil
    
    let realm = try! Realm()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeViewController))
        mainView.addGestureRecognizer(tapRecognizer)
        
        
        
        self.typeLabel.text = pizza?.type
        self.ingradientsLabel.text = pizza?.ingredients
        if let cost = pizza?.smallCost {
            self.costLabel.text = String(cost)
        }
        
        self.ordButton.layer.cornerRadius = 8
        self.someView.layer.cornerRadius = 24
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        
        
    }
    
    @objc private func closeViewController(sender: UITapGestureRecognizer){
        self.view.removeFromSuperview()
    }
    
    @IBAction func pizzaSizeAction(_ sender: Any) {
        
        let selectedIndex = self.pizzaSizeSegmentedController.selectedSegmentIndex
        switch selectedIndex {
        case 0:
            self.costLabel.text = String(Int(self.countStepper.value) * self.pizza!.smallCost)
        case 1:
            if let cost = self.pizza?.mediumСost{
                self.costLabel.text = String(Int(self.countStepper.value) * self.pizza!.mediumСost)
            }
        case 2:
            self.costLabel.text = String(Int(self.countStepper.value) * self.pizza!.largeCost)
        default:
            self.costLabel.text = ""

        }
        

    }
    
    @IBAction func countStepperPressed(_ sender: Any) {
        let selectedIndex = self.pizzaSizeSegmentedController.selectedSegmentIndex

        self.pizzaCountLabel.text = String(Int(self.countStepper.value))
        switch selectedIndex {
        case 0:
            self.costLabel.text = String(Int(self.countStepper.value) * self.pizza!.smallCost)
        case 1:
            self.costLabel.text = String(Int(self.countStepper.value) * self.pizza!.mediumСost)
        case 2:
            self.costLabel.text = String(Int(self.countStepper.value) * self.pizza!.largeCost)
        default:
            self.costLabel.text = ""

        }
    }
    
    @IBAction func orderButton(_ sender: Any) {
        
        let orderRealm = OrderRealm()

        orderRealm.title = self.pizza!.type
        orderRealm.count = Int(self.pizzaCountLabel.text!)!
        orderRealm.cost = Int(self.costLabel.text!)!
        let selectedIndex = self.pizzaSizeSegmentedController.selectedSegmentIndex
        switch selectedIndex {
        case 0:
            orderRealm.size = "Маленькая"
        case 1:
            orderRealm.size = "Cредняя"
        case 2:
            orderRealm.size = "Большая"
        default:
            orderRealm.size = ""
        }
        
        orderRealm.picture = self.pizza!.picture
                
        try! realm.write{
            self.realm.add(orderRealm)
        }
        
        self.view.removeFromSuperview()

        
        
    }
}

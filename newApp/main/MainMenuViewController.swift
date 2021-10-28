//
//  ViewController.swift
//  newApp
//
//  Created by Алексей Даневич on 21.09.2021.
//

import UIKit
import SDWebImage
import RealmSwift

class MainMenuViewController: UIViewController {
    
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var mainView: UIView!
    var food: Pizza? = nil
    
    var order: [OrderRealm] = []
    let realm = try? Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil),
                                forCellReuseIdentifier: "TableViewCell")
        self.orderButton.layer.cornerRadius = 8
        
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.order = self.getOrder()
        
        if order.count == 0 {
            self.orderButton.isHidden = true
        } else {
            self.orderButton.isHidden = false
        }
    }
    
    private func getOrder() -> [OrderRealm] {
        
        var orders = [OrderRealm]()
        guard let orderResults = realm?.objects(OrderRealm.self) else { return [] }
        for order in orderResults {
            orders.append(order)
        }
        return orders
    }
    
    
}





extension MainMenuViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Meals.pizzaList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.configure(with: Meals.pizzaList[indexPath.row])
        cell.delegate = self
        return cell
    }
}

extension MainMenuViewController: MyCellDelegate{
    func orderButtonPressed(cell: TableViewCell) {
        let indexPath = self.tableView.indexPath(for: cell)
        let meal = Meals.pizzaList[(indexPath?[1])!]
        
        
        let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopOrderViewController") as! PopOrderViewController
        popUpVC.pizza = meal
        
        self.food = meal
        self.addChild(popUpVC)
        popUpVC.view.frame = self.view.frame
        
        self.view.addSubview(popUpVC.view)
        
        popUpVC.didMove(toParent: self)
        
        
    }
    
    
}

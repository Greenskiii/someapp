//
//  saveViewController.swift
//  newApp
//
//  Created by Алексей Даневич on 20.10.2021.
//

import Foundation
import UIKit
import RealmSwift

class saveViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let realm = try? Realm()
    var order: [OrderRealm] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "OrderListTableViewCell", bundle: nil),
                                forCellReuseIdentifier: "OrderListTableViewCell")
        let deleteBarButtonItem = UIBarButtonItem(title: "delete", style: .done, target: self, action: #selector(deleteButtonpressed))
        self.navigationItem.rightBarButtonItem = deleteBarButtonItem
        
        
        
    }
    @objc func deleteButtonpressed(){
        self.order = []
        self.tableView.reloadData()
        
        try! realm?.write(){
            realm?.deleteAll()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.order = self.getOrder()
        self.tableView.reloadData()

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

extension saveViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.order.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderListTableViewCell") as? OrderListTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.configure(with: self.order[indexPath.row])
        return cell

    }


}

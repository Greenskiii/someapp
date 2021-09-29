//
//  ViewController.swift
//  newApp
//
//  Created by Алексей Даневич on 21.09.2021.
//

import UIKit
import SDWebImage

class MainMenuViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    var food: Pizza? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil),
                                     forCellWithReuseIdentifier: "CollectionViewCell")
        
    }


}

extension MainMenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Meals.pizzaList.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell {
            let meal = Meals.pizzaList[indexPath.row]
            cell.configure(with: meal)
            cell.orderButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
           

            return cell
        }
        
        
        return UICollectionViewCell()
    }
    @objc func buttonPressed(){
        let popOrVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopOrderViewController") as! PopOrderViewController
        
        
        self.addChild(popOrVC)
        popOrVC.view.frame = self.view.frame
        self.view.addSubview(popOrVC.view)
        
        popOrVC.didMove(toParent: self)

    }
}

extension MainMenuViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 166)
    }
}

extension MainMenuViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let meal = Meals.pizzaList[indexPath.row]
        
        
        let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopOwervievViewController") as! PopOwervievViewController
            popUpVC.pizza = meal

        self.food = meal
            self.addChild(popUpVC)
            popUpVC.view.frame = self.view.frame
        
            self.view.addSubview(popUpVC.view)
                    
            popUpVC.didMove(toParent: self)
        
        

    }
}




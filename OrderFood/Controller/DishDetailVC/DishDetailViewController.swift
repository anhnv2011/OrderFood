//
//  DishDetailViewController.swift
//  OrderFood
//
//  Created by MAC on 8/26/22.
//

import UIKit
import ProgressHUD

class DishDetailViewController: UIViewController {
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameField: UITextField!
    var dish: Dish!
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
    }
    
    func fetchData(){
        let url = URL(string: dish.image ?? "")
        dishImageView.kf.setImage(with: url)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
    }
    @IBAction func orderAction(_ sender: UIButton) {
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces),
              !name.isEmpty else {
            ProgressHUD.showError("Please enter your name")
            return
        }
        
        ProgressHUD.show("Placing Order...")
        APICaller.shared.placeOrder(dishId: dish.id ?? "", name: name) { (result) in
            switch result {
            case .success(_):
                ProgressHUD.showSuccess("Your order has been received. 👨🏼‍🍳")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
}

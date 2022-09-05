//
//  DishListTableViewCell.swift
//  OrderFood
//
//  Created by MAC on 8/26/22.
//

import UIKit
import Kingfisher
class DishListTableViewCell: UITableViewCell {
    static let identifier = "DishListTableViewCell"
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setup(dish: Dish) {
        let url = URL(string: dish.image ?? "")
        dishImageView.kf.setImage(with: url)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
    }
    
    func setup(order: Order) {
        let url = URL(string: order.dish?.image ?? "")
        dishImageView.kf.setImage(with: url)
        titleLbl.text = order.dish?.name
        descriptionLbl.text = order.name
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  DishLandscapeCollectionViewCell.swift
//  OrderFood
//
//  Created by MAC on 8/26/22.
//

import UIKit
import Kingfisher
class DishLandscapeCollectionViewCell: UICollectionViewCell {
    static let identifier = "DishLandscapeCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    
    func setup(dish: Dish) {
        let url = URL(string: dish.image ?? "")
        dishImageView.kf.setImage(with: url)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
    }
}

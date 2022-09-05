//
//  DishPortraitCollectionViewCell.swift
//  OrderFood
//
//  Created by MAC on 8/26/22.
//

import UIKit
import Kingfisher
class DishPortraitCollectionViewCell: UICollectionViewCell {
    static let identifier = "DishPortraitCollectionViewCell"
   
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func setup(dish: Dish) {
        titleLbl.text = dish.name
        let url = URL(string: dish.image ?? "")
        dishImageView.kf.setImage(with: url)
        caloriesLbl.text = dish.formattedCalories
        descriptionLbl.text = dish.description
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

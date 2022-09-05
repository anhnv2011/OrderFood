//
//  CatagoryCollectionViewCell.swift
//  OrderFood
//
//  Created by MAC on 8/26/22.
//

import UIKit
import Kingfisher
class CatagoryCollectionViewCell: UICollectionViewCell {

    static let identifier = "CatagoryCollectionViewCell"

    @IBOutlet weak var contenView: UIView!
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func setup(title: String, imageUrl: String) {
    
        categoryTitleLbl.text = title
        let url = URL(string: imageUrl)!
        categoryImageView.kf.setImage(with: url)
//        categoryImageView.load(url: url)
    }

}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

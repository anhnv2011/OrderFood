//
//  OnBroadingCollectionViewCell.swift
//  OrderFood
//
//  Created by MAC on 8/26/22.
//

import UIKit

class OnBroadingCollectionViewCell: UICollectionViewCell {
    static let identifier = "OnBroadingCollectionViewCell"
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
   
    func setupSlide(_ slide: OnboardingSlide){
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
}

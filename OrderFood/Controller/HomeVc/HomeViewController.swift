//
//  HomeViewController.swift
//  OrderFood
//
//  Created by MAC on 8/26/22.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    var categories: [DishCategory] = []
    var populars: [Dish] = []
    var specials: [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Order Food"
        setupNav()
        fetchData()

       // setupCollectionView()
    }

    func setupNav(){
        let listOrderButton = UIBarButtonItem(image: UIImage(systemName: "cart.circle.fill"), style: .plain, target: self, action: #selector(showListOrder))
        listOrderButton.tintColor = .red
        navigationItem.rightBarButtonItem = listOrderButton
        
    }
    func setupCollectionView(){
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        
        specialsCollectionView.delegate = self
        specialsCollectionView.dataSource = self
        
        categoryCollectionView.register(UINib(nibName: "CatagoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CatagoryCollectionViewCell.identifier)
        popularCollectionView.register(UINib(nibName: "DishPortraitCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        specialsCollectionView.register(UINib(nibName: "DishLandscapeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)
    }
    
    func fetchData(){
        ProgressHUD.show()

        APICaller.shared.fetchAllCategories { [weak self] (result) in
            switch result {
            case .success(let allDishes):
                ProgressHUD.dismiss()
                self?.categories = allDishes.categories ?? []
//                print(self?.categories)
                self?.populars = allDishes.populars ?? []
                self?.specials = allDishes.specials ?? []
                
                self?.categoryCollectionView.reloadData()
                self?.popularCollectionView.reloadData()
                self?.specialsCollectionView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
            self.setupCollectionView()
        
        
    }
    
    @objc func showListOrder(){
        print("ssss")
    }

}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            if categories.count > 0 {
                return categories.count
            }
           return 0
        case popularCollectionView:
            return populars.count
        case specialsCollectionView:
            return specials.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatagoryCollectionViewCell.identifier, for: indexPath) as! CatagoryCollectionViewCell
           
            let data = categories[indexPath.row]
            let title = data.name
            let url = data.image ?? ""
            cell.setup(title: title, imageUrl: url)
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
        case specialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifier, for: indexPath) as! DishLandscapeCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case categoryCollectionView:
            let width = (categoryCollectionView.bounds.width - 16) / 2.5 
            let height = (categoryCollectionView.bounds.height - 8) / 2
            return CGSize(width: width, height: height)
        case popularCollectionView:
            let width = (popularCollectionView.bounds.width - 32) / 2
            let height = (popularCollectionView.bounds.height - 16)
            return CGSize(width: width, height: height)
        case specialsCollectionView:
            let width = (specialsCollectionView.bounds.width - 40)
            let height = (specialsCollectionView.bounds.height)
            return CGSize(width: width, height: height)

        default:
            return CGSize(width: 0, height: 0)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
//            let controller = ListDishesViewController.instantiate()
//            controller.category = categories[indexPath.row]
//            navigationController?.pushViewController(controller, animated: true)
            let vc = ListDishesViewController()
            vc.category = categories[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
            
        } else {
            let vc = DishDetailViewController()
            vc.dish = collectionView == popularCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

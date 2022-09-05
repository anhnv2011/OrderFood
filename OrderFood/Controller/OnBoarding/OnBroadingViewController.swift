//
//  OnBroadingViewController.swift
//  OrderFood
//
//  Created by MAC on 8/26/22.
//

import UIKit

class OnBroadingViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let slides = [
        OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide2")),
        OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide1")),
        OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "slide3"))
    ]
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        setupCollectionView()
        pageControl.numberOfPages = slides.count
        
    }
    
    func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "OnBroadingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: OnBroadingCollectionViewCell.identifier)
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
    }


    @IBAction func buttonAction(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let vc = UINavigationController(rootViewController: HomeViewController())
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .coverVertical
            present(vc, animated: true, completion: nil)
        } else {
//            currentPage += 1
//            let indexPath = IndexPath(row: currentPage, section: 0)
//            print(indexPath)
//            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)

            currentPage += 1
            collectionView.isPagingEnabled = false

            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            collectionView.isPagingEnabled = true

        }
    }
}

extension OnBroadingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBroadingCollectionViewCell.identifier, for: indexPath) as! OnBroadingCollectionViewCell
        let slide = slides[indexPath.row]
//        print(slide)
        cell.setupSlide(slide)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = collectionView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}

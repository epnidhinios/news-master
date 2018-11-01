//
//  ViewController.swift
//  News
//
//  Created by Nidhin on 5/25/18.
//  Copyright © 2018 TCS_MX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    static let images = [UIImage(named: "Image01"),UIImage(named: "Image02"),UIImage(named: "Image03"),UIImage(named: "Image04"),UIImage(named: "Image05"),UIImage(named: "Image06"),UIImage(named: "Image07")]
    
    fileprivate let itemsPerRow: CGFloat = 1
    @IBOutlet weak var newshaderCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : UICollectionViewDataSource{
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return ViewController.images.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
    
        guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: NewsIconCollectionViewCell.reuseIdentifier, for: indexPath) as? NewsIconCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.imgView.image = ViewController.images[indexPath.row]
        
        cell.setUpUI()
        //Develop change
        return cell
        
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int{
        return 3
    }
}

extension ViewController : UICollectionViewDelegate{
    
    public func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath){
        UIView.animate(withDuration: 0.5) {
            if let cell = collectionView.cellForItem(at: indexPath)as? NewsIconCollectionViewCell {
                cell.transform = .init(scaleX: 0.95, y: 0.95)
            }
        }

    }
    
    public func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath){
        UIView.animate(withDuration: 0.5) {
            if let cell = collectionView.cellForItem(at: indexPath) as? NewsIconCollectionViewCell {
                cell.transform = .identity
            }
        }

    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("IndexPath : \(indexPath.row)")
    }
   
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = view.frame.width - 50
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

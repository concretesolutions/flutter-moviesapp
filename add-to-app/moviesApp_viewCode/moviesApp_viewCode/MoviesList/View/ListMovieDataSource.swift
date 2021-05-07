//
//  ListCardDataSource.swift
//  magic-bootcamp
//
//  Created by mateus.santos on 16/03/21.
//

import UIKit
import Kingfisher 
 
protocol DelegateSettingsCell:AnyObject {
    func setUpNumberSections() -> Int
    func setUpNumberItens(_ sectionReference:Int) -> Int
}

protocol DelegateViewCell:AnyObject {
    func setUpTextCell(cell: MovieCollectionViewCell, cellReference:Int, sectionReference:Int)
}

protocol DelegateImageCell:AnyObject {
    func setUpImageCell<T,M>(cellReference: T,sectionReference: M) -> String?
}

protocol DelegateIdCell:AnyObject {
    func setUpIdCell<T,M>(cellReference: T,sectionReference: M) -> String?
}

class ListMovieDataSource: NSObject, UICollectionViewDataSource {
    var imageView:UIImageView = UIImageView()
    weak var delegateSettings:DelegateSettingsCell?
    weak var delegateView: DelegateViewCell?
    weak var delegateImage: DelegateImageCell?
    weak var delegateId: DelegateIdCell?
    
    init(delegateSettings:DelegateSettingsCell,
         delegateView:DelegateViewCell,
         delegateImage:DelegateImageCell,
         delegateId: DelegateIdCell) {
        self.delegateSettings = delegateSettings
        self.delegateView = delegateView
        self.delegateImage = delegateImage
        self.delegateId = delegateId
    }
    
    init(delegateSettings:DelegateSettingsCell,
         delegateView:DelegateViewCell,
         delegateImage:DelegateImageCell) {
        self.delegateSettings = delegateSettings
        self.delegateView = delegateView
        self.delegateImage = delegateImage
    }
    
    init(delegateSettings:DelegateSettingsCell,
         delegateView:DelegateViewCell) {
        self.delegateSettings = delegateSettings
        self.delegateView = delegateView
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return delegateSettings?.setUpNumberSections() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegateSettings?.setUpNumberItens(section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.reuseIdentifierListCell, for: indexPath) as? MovieCollectionViewCell
        else { return UICollectionViewCell() }

        delegateView?.setUpTextCell(cell: cell, cellReference: indexPath.row, sectionReference: indexPath.section)

        guard let url = delegateImage?.setUpImageCell(cellReference: indexPath.row, sectionReference: indexPath.section) else { return cell }
        
        let string = "https://image.tmdb.org/t/p/w185/\(url)"
        let urlForKf = URL(string: string)

        cell.imageView.kf.setImage(with: urlForKf, placeholder: UIImage(), options: [.transition(.fade(0.5))])
        return cell
    }
    
}

//
//  ListCardViewBase.swift
//  magic-bootcamp
//
//  Created by mateus.santos on 16/03/21.
//

import UIKit
import Kingfisher



//Here should be the others UI Components
class ListMovieViewBase: UIView{
    
    let movieToFlutterButton:UIButton = {
        let button  = UIButton()
        button.setTitle("Favorites", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let layout:UICollectionViewFlowLayout = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 5, bottom: 52, right: 5)
        //width: 90, height: 125.66
        layout.itemSize = CGSize(width: 190, height: 200)
        return layout
    }()
    
    //Collection View
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.reuseIdentifierListCell)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    public var searchImage: UIImage?
    
    lazy var searchBar:UISearchBar = {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = .minimal
        //searchBar.isTranslucent = true
        searchBar.backgroundColor = .clear
        searchBar.barTintColor = .clear
        searchBar.tintColor = .white
        searchBar.searchTextField.layer.cornerRadius = 4
        searchBar.searchTextField.tintColor = .white
        searchBar.searchTextField.tokenBackgroundColor = .white
        searchBar.searchTextField.textColor = .white
        searchBar.searchTextField.layer.borderWidth = 2
        searchBar.searchTextField.placeholder = "Search For Cards"
        if let searchView = searchBar.searchTextField.leftView as? UIImageView {
            searchView.image = (searchImage ?? searchView.image)?.withRenderingMode(.alwaysTemplate)
            searchView.tintColor = .white
        }
        //rightView.image = UIImage(named: "Union")
        searchBar.searchTextField.layer.borderColor = UIColor.white.cgColor
        return searchBar
    }()
    
    init(){
        super.init(frame: .zero)
        setupViews()
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: ViewCodable
extension ListMovieViewBase: ViewCodable {
    
    func setupViewHierarchy() {
        self.addSubview(collectionView)
        self.addSubview(movieToFlutterButton)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            collectionView.widthAnchor.constraint(equalTo: self.widthAnchor),
            collectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.9),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.rightAnchor),
        ])
        
        NSLayoutConstraint.activate([
            movieToFlutterButton.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 0.4),
            movieToFlutterButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.08),
            movieToFlutterButton.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor,constant: 10),
            movieToFlutterButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
        
    }
    
}

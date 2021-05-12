//
//  CardCollectionViewCell.swift
//  magic-bootcamp
//
//  Created by mateus.santos on 16/03/21.
//

import UIKit
import data_plugin

class MovieCollectionViewCell:UICollectionViewCell {
    
    var isFavorite = false
    
    var index:Int?
    var id:Int = 0
    var title:String = ""
    var overview:String = ""
    var poster_path:String = ""
    var realease_date:String = ""
    
    let crud = CRUD()
    
    static let reuseIdentifierListCell = "listMovieCell"
    
    let imageView:UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let viewTitle:UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.alignment = .center
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let icon:UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(systemName: "heart")
        imageView.tintColor = .yellow
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleMovie:UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.text = "Error"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.layer.zPosition = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let firstTouch = touches.first
        let location = firstTouch?.location(in: self) ?? .zero
        
        let elementTouched = self.hitTest(location, with: event)
        
        if elementTouched == self.icon {
            if isFavorite == false {
                isFavorite = true
                
                let movie = MovieObject()
                movie.id = self.id
                movie.title = self.title
                movie.overview = self.overview
                movie.poster_path = self.poster_path
                movie.release_date = self.realease_date
                _ = crud.save(movie)
               
                
                
                //let result = crud.fetch()
                
                icon.image = UIImage(systemName: "heart.fill")
            }else{
                isFavorite = false
                
                //crud.delete(self.index ?? -1)
                
                icon.image = UIImage(systemName: "heart")
            }
        }
    }
}

extension MovieCollectionViewCell: ViewCodable {
    
    func setupViewHierarchy() {
        self.addSubview(imageView)
        self.addSubview(viewTitle)
        
        viewTitle.addArrangedSubview(titleMovie)
        viewTitle.addArrangedSubview(icon)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.imageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.imageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7),
        ])
        
        NSLayoutConstraint.activate([
            self.viewTitle.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.viewTitle.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.viewTitle.topAnchor.constraint(equalTo: self.imageView.bottomAnchor),
            self.viewTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
}

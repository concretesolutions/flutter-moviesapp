//
//  MoveDetail.swift
//  Runner
//
//  Created by mateus.santos on 03/05/21.
//

import UIKit

@available(iOS 13.0, *)
class MovieDetailView:UIView {
    
    var viewModel:MovieDetailViewModel?
    
    var movie:Movie?
    
    var isFavorite:Bool = false
    
    let separatorView1:UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let separatorView2:UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let separatorView3:UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageViewMovie:UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "homenAranha_poster")
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: Title
    
    let titleView:UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let favoriteIconMovie:UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(systemName: "heart")
        imageView.tintColor = .systemYellow
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleMovie:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textColor = .black
        label.text = self.movie?.title
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: Year

    lazy var yearMovie:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.text = self.movie?.releaseDate
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: Category

    lazy var categoryMovie:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .justified
        label.text = "Ação/Aventura"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: Sinopse

    lazy var sinopseMovie:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .justified
        label.text = self.movie?.overview
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   
    
    init(_ movie:Movie) {
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.viewModel = MovieDetailViewModel()
        self.movie = movie
        addHierarchy()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let firstTouch = touches.first
        let location = firstTouch?.location(in: self) ?? .zero
        
        let elementTouched = self.hitTest(location, with: event)
        
        if elementTouched == self.favoriteIconMovie {
            if isFavorite == false {
                isFavorite = true
                favoriteIconMovie.image = UIImage(systemName: "heart.fill")
            }else{
                isFavorite = false
                favoriteIconMovie.image = UIImage(systemName: "heart")
            }
        }
    }
}

//MARK:Add hierarchy
@available(iOS 13.0, *)
extension MovieDetailView{
    func addHierarchy(){
        self.addSubview(imageViewMovie)
        self.addSubview(titleView)
        self.addSubview(separatorView1)
        self.addSubview(yearMovie)
        self.addSubview(separatorView2)
        self.addSubview(categoryMovie)
        self.addSubview(separatorView3)
        self.addSubview(sinopseMovie)
        
        titleView.addArrangedSubview(titleMovie)
        titleView.addArrangedSubview(favoriteIconMovie)
    }
}

//MARK:Contraints
@available(iOS 13.0, *)
extension MovieDetailView{
    func addConstraints(){
        NSLayoutConstraint.activate([
            imageViewMovie.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            imageViewMovie.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            imageViewMovie.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            imageViewMovie.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4),
        ])
        
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: self.imageViewMovie.bottomAnchor, constant: 20),
            titleView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            separatorView1.widthAnchor.constraint(equalTo: self.widthAnchor),
            separatorView1.heightAnchor.constraint(equalToConstant: 1),
            separatorView1.topAnchor.constraint(equalTo: self.titleView.bottomAnchor,constant: 10),
            separatorView1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            yearMovie.topAnchor.constraint(equalTo: self.separatorView1.bottomAnchor, constant: 10),
            yearMovie.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            yearMovie.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            separatorView2.widthAnchor.constraint(equalTo: self.widthAnchor),
            separatorView2.heightAnchor.constraint(equalToConstant: 1),
            separatorView2.topAnchor.constraint(equalTo: self.yearMovie.bottomAnchor,constant: 10),
            separatorView2.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            categoryMovie.topAnchor.constraint(equalTo: self.separatorView2.bottomAnchor, constant: 10),
            categoryMovie.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            categoryMovie.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            separatorView3.widthAnchor.constraint(equalTo: self.widthAnchor),
            separatorView3.heightAnchor.constraint(equalToConstant: 1),
            separatorView3.topAnchor.constraint(equalTo: self.categoryMovie.bottomAnchor,constant: 10),
            separatorView3.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            sinopseMovie.topAnchor.constraint(equalTo: self.separatorView3.bottomAnchor, constant: 10),
            sinopseMovie.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            sinopseMovie.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
}

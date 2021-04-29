//
//  ListTableViewCell.swift
//  Runner
//
//  Created by mateus.santos on 27/04/21.
//

import UIKit

class ListTableViewCell:UITableViewCell {
    
    static var reusableIdentifier = "ListCellFavorite"
    
    let imageViewMovie:UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleMovie:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textColor = .black
        label.text = "ERROR"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sinopseMovie:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 8)
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .justified
        label.text = "ERROR"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let yearMovie:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.text = "ERROR"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Components
extension ListTableViewCell{
    func addComponents(){
        self.addSubview(imageViewMovie)
        self.addSubview(titleMovie)
        self.addSubview(sinopseMovie)
        self.addSubview(yearMovie)
        
       insertContraints()
    }
}

//MARK: Constraints
extension ListTableViewCell{
    func insertContraints(){
        NSLayoutConstraint.activate([
            imageViewMovie.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.3),
            imageViewMovie.topAnchor.constraint(equalTo: self.topAnchor),
            imageViewMovie.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageViewMovie.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            titleMovie.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.3),
            titleMovie.leadingAnchor.constraint(equalTo: self.imageViewMovie.trailingAnchor,constant: 10),
            titleMovie.topAnchor.constraint(equalTo: self.topAnchor),
        ])
        
        NSLayoutConstraint.activate([
            sinopseMovie.leadingAnchor.constraint(equalTo: self.imageViewMovie.trailingAnchor,constant: 10),
            sinopseMovie.topAnchor.constraint(equalTo: self.titleMovie.bottomAnchor),
            sinopseMovie.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            sinopseMovie.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            yearMovie.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.15),
            yearMovie.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -5),
        ])
    }
}

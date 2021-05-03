//
//  HelloWorldView.swift
//  Runner
//
//  Created by mateus.santos on 29/04/21.
//

import UIKit

class HelloWorldView:UIView {
    
    let label:UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .black
        label.text = "Olá mundo por iOS"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.addSubview(label)
        self.addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Constraints
extension HelloWorldView {
    func addConstraints(){
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalTo: self.widthAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
}

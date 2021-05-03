//
//  ListTableView.swift
//  Runner
//
//  Created by mateus.santos on 27/04/21.
//

import UIKit

class ListMoviesView:UIView {
    
    var viewModel:ViewModel?
    
    lazy var tableView:UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.reusableIdentifier)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    init(numberItens:Int,listMovie:[Movie]) {
        super.init(frame: .zero)
        self.viewModel = ViewModel(listMovie)
        self.addSubview(tableView)
        constraintsTableView()
    }
    
    init(frame:CGRect,numberItens:Int,listMovie:[Movie]) {
        super.init(frame: frame)
        self.viewModel = ViewModel(listMovie)
        self.addSubview(tableView)
        constraintsTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Constraint
extension ListMoviesView{
    func constraintsTableView(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

extension ListMoviesView:UITableViewDelegate {
    
}

extension ListMoviesView:UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.reusableIdentifier) as? ListTableViewCell else{
            return UITableViewCell()
        }
        
        viewModel?.configureCell(viewModel?.listMovie[indexPath.row] ?? MovieElement(), cell)
        
        return cell
    }
}

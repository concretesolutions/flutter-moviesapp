//
//  ViewController.swift
//  mateusRodrigues_moviesApp
//
//  Created by mateus.santos on 05/05/21.
//

import UIKit
import Flutter

class MoviesViewController: UIViewController{
    
    weak var coordinator:MainCoordinator?
    
    let viewBase = ListMovieViewBase()
    
    lazy var viewModel:MovieViewModel = {
        let viewModel = MovieViewModel(self)
        return viewModel
    }()
    
    lazy var dataSource:ListMovieDataSource = {
       let dataSource = ListMovieDataSource(delegateSettings: self, delegateView: self, delegateImage: self)
        return dataSource
    }()
    
    lazy var delegate:ListMovieDelegate = {
       let delegate = ListMovieDelegate(delegateAction: self)
        return delegate
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "Movies"
        navigationController?.navigationBar.isTranslucent = false

        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .yellow
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
           appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]

           navigationController?.navigationBar.tintColor = .black
           navigationController?.navigationBar.standardAppearance = appearance
           navigationController?.navigationBar.compactAppearance = appearance
           navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    override func loadView() {
        super.loadView()
        self.view = viewBase
    }
    
    override func viewDidLoad() {
        viewModel.fetch()
        addTrigerrs()
    }
}

//MARK: Triggers
extension MoviesViewController{
    
    func addTrigerrs(){
        viewBase.movieToFlutterButton.addTarget(self, action: #selector(showFlutter), for: .touchUpInside)
    }
    
    @objc func showFlutter(){
      let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
      let flutterViewController =
          FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        
        self.navigationController?.pushViewController(flutterViewController, animated: true)
    }
}

extension MoviesViewController:DelegateViewModel{
    func notifyViewController() {
        viewBase.collectionView.delegate = delegate
        viewBase.collectionView.dataSource = dataSource
        viewBase.collectionView.reloadData()
    }
}

extension MoviesViewController:DelegateAction{
    func didSelected() {
        
    }
}

extension MoviesViewController:DelegateSettingsCell{
    func setUpNumberSections() -> Int {
        return 1
    }
    
    func setUpNumberItens(_ sectionReference: Int) -> Int {
        return viewModel.numberOfItens()
    }
}

extension MoviesViewController:DelegateImageCell{
    func setUpImageCell<T, M>(cellReference: T, sectionReference: M) -> String? {
        let index = cellReference as? Int ?? 0
        return viewModel.getPathImage(index)
    }
}

extension MoviesViewController:DelegateViewCell{
    func setUpTextCell(cell: MovieCollectionViewCell, cellReference: Int, sectionReference: Int) {
        cell.titleMovie.text = viewModel.titleMovie(cellReference)
        viewModel.addDataCell(cell, cellReference)
    }
}

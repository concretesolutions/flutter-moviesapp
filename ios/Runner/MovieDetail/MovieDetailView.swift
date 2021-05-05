//
//  MovieDetailView.swift
//  Runner
//
//  Created by Matheus de Vasconcelos on 04/05/21.
//

import UIKit

internal class MovieDetailView: UIView {

    internal let movieCoverImageView: UIImageView
    internal let movieTitleLabel: UILabel
    internal let movieDescriptionLabel: UILabel
    internal lazy var imageDownloader: ImageDownloader = ImageDownloader()

    internal override init(frame: CGRect) {
        movieCoverImageView = UIImageView()
        movieTitleLabel = UILabel()
        movieDescriptionLabel = UILabel()
        super.init(frame: frame)
        setupViews()
        bind(movie: Movie(title: "asda", description: "sasdads", coverURL: URL(string: "https://upload.wikimedia.org/wikipedia/pt/9/9b/Avengers_Endgame.jpg")!))
    }

    @available(*, unavailable)
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    internal func bind(movie: Movie) {
        imageDownloader.download(url: movie.coverURL) { [weak self] (result) in
            if case .success(let image) = result {
                self?.movieCoverImageView.image = image
            }
        }
        movieTitleLabel.text = movie.title
        movieDescriptionLabel.text = movie.description
    }

    internal func setupViews() {
        buildViews()
        buildConstraints()
        configViews()
    }

    internal func buildViews() {
        addSubview(movieCoverImageView)
        addSubview(movieTitleLabel)
        addSubview(movieDescriptionLabel)
    }

    internal func buildConstraints() {
        [
            movieCoverImageView,
            movieTitleLabel,
            movieDescriptionLabel
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            movieCoverImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            movieCoverImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            movieCoverImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            movieCoverImageView.heightAnchor.constraint(equalToConstant: 500),

            movieTitleLabel.topAnchor.constraint(equalTo: movieCoverImageView.bottomAnchor, constant: 16),
            movieTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            movieTitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),

            movieDescriptionLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 16),
            movieDescriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            movieDescriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
        ])
    }

    internal func configViews() {
        backgroundColor = .white
        movieTitleLabel.numberOfLines = 0
        movieTitleLabel.font = .systemFont(ofSize: 24, weight: .medium)
        movieDescriptionLabel.numberOfLines = 0
        movieDescriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
    }

}

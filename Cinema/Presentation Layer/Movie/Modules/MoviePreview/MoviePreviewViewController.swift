//
//  MoviePreviewViewController.swift
//  Cinema
//
//  Created Ibrahim Abdul Aziz on 06/06/2022.
//  Copyright © 2022 Ibrahim Abdul Aziz, Co. Ltd. All rights reserved.
//

import UIKit

class MoviePreviewViewController: UIViewController {

    // MARK: - Properties
    var interactor: MoviePreviewInteractorProtocol?
    var router: MoviePreviewRouterProtocol?
    private let id: Int
    private let dataMovieView = DataMovieView(frame: .zero)
    
    
    // MARK: - Initializers
    init(id: Int) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - View controller lifecycle methods
extension MoviePreviewViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        applyConstraints()
        interactor?.showMovie(with: id)
    }
    
    private func setupViews() {
        view.addSubview(dataMovieView)
    }
    
}

// MARK: - IBActions
extension MoviePreviewViewController {

}

// MARK: - Selectors
extension MoviePreviewViewController {

}

// MARK: - Private Methods
extension MoviePreviewViewController {
    private func configureView(with viewModel: DisplayedPreviewMovieViewModel) {
        dataMovieView.previewImageView.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(viewModel.posterURL ?? "" )"))
        dataMovieView.titleLabel.text = viewModel.titleName ?? ""
        dataMovieView.voteAverageLabel.text = "IMDb \(viewModel.voteAverage ?? 0.0)"
        dataMovieView.adultLabel.text = updateAdultLabelTaxt()
        dataMovieView.overviewLabel.text = viewModel.overview
        dataMovieView.languageLabel.text = viewModel.originalLanguage
        func updateAdultLabelTaxt() -> String {
            viewModel.adult == true ?  "+16" :  "-16"
        }
    }
    
}

// MARK: - Protocal
extension MoviePreviewViewController: MoviePreviewViewProtocol {
    func didFetchPreviewMovieSuccessfully(viewModel: DisplayedPreviewMovieViewModel) {
        configureView(with: viewModel)
    }
    
    func didFailFetchPreviewMovie(error: NetworkError) {
        print(error)
    }
}


// MARK: - Setup Constraints

extension MoviePreviewViewController {
    private func applyConstraints() {

        let dataMovieViewConstraints = [
            dataMovieView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            dataMovieView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            dataMovieView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            dataMovieView.topAnchor.constraint(equalTo: self.view.topAnchor)
        ]

        NSLayoutConstraint.activate(dataMovieViewConstraints)
    }
}

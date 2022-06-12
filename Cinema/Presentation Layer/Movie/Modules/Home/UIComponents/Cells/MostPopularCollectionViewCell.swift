//
//  MostPopularCollectionViewCell.swift
//  Cinema
//
//  Created by Ibrahim Abdul Aziz on 24/05/2022.
//

import UIKit
import SDWebImage

class MostPopularCollectionViewCell: UICollectionViewCell {
    
// MARK: - Cell life cycle methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

    }
    
    private func setupSubViews() {
        self.addSubview(posterImageView)
        self.addSubview(titleLabel)
        self.addSubview(voteAverageLabel)
    }
    
    // MARK: - Properties
    static let identifier = "MostPopularCollectionViewCell"

    // wllSet: before the data was assigned.
    var dataSource: DisplayedPopularMovieViewModel? {
        willSet {
            configureMostPopularCell(with: newValue!)
        }
    }
    
    
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.layer.cornerRadius = 12
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)

        return label
    }()
    
    
    let voteAverageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.layer.cornerRadius = 12
        label.backgroundColor = .systemYellow
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 8, weight: .bold)
        label.textColor = .black

        return label
    }()
    
    public func configureMostPopularCell(with viewModel: DisplayedPopularMovieViewModel) {
        posterImageView.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(viewModel.posterURL ?? "" )"))
        titleLabel.text = viewModel.titleName ?? ""
        voteAverageLabel.text = "IMDb \(viewModel.voteAverage ?? 0.0)"
    }
}

//MARK: - Setup constraints
extension MostPopularCollectionViewCell {
    
    private func applyConstraints() {
        let posterImageViewConstraints = [
            posterImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            posterImageView.topAnchor.constraint(equalTo: self.topAnchor),
            posterImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            posterImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ]
        
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: posterImageView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: voteAverageLabel.leadingAnchor, constant: 8),
            titleLabel.widthAnchor.constraint(equalToConstant: posterImageView.bounds.height / 3),
            titleLabel.bottomAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: -10)
        ]
        
        let voteAverageLabelConstraints = [
            voteAverageLabel.leadingAnchor.constraint(equalTo: posterImageView.centerXAnchor, constant: 80),
            voteAverageLabel.trailingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: -16),
            voteAverageLabel.widthAnchor.constraint(equalToConstant: posterImageView.bounds.height / 3),
            voteAverageLabel.bottomAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: -10),
            voteAverageLabel.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        NSLayoutConstraint.activate(posterImageViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(voteAverageLabelConstraints)
    }
}

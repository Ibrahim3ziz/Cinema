//
//  UpcomingCollectionViewCell.swift
//  Cinema
//
//  Created by Ibrahim Abdul Aziz on 01/06/2022.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {

// MARK: - Cell life cycle methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(posterImageView)
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    // MARK: - Properties
    static let identifier = "UpcomingCollectionViewCell"

    var dataSource: DisplayedUpcomingViewModel? {
        willSet {
            configureUpcomingCell(with: newValue!)
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

    
    public func configureUpcomingCell(with viewModel: DisplayedUpcomingViewModel) {
        posterImageView.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(viewModel.posterURL ?? "")"))
    }

}


//MARK: - Setup constraints
extension UpcomingCollectionViewCell {
    private func applyConstraints() {
        let posterImageViewConstraints = [
            posterImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            posterImageView.topAnchor.constraint(equalTo: self.topAnchor),
            posterImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(posterImageViewConstraints)
    }
}

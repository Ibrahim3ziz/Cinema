//
//  CategoryCollectionViewCell.swift
//  Cinema
//
//  Created by Ibrahim Abdul Aziz on 30/05/2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
//MARK: -  View life cycle methods
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
        self.addSubview(customView)
        self.addSubview(categoryImageView)
        self.addSubview(titleLabel)
    }
    
// MARK: - Properties
    static let identifier = "CategoryCollectionViewCell"

    let customView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 0.8
        view.layer.borderColor = UIColor.white.cgColor
        view.backgroundColor = .clear
        view.layer.opacity = 0.5
        view.layer.shadowOpacity = 0.5
        
        return view
    }()
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .white
        
        return label
    }()
    

    let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .white
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 40).isActive = true

        return imageView
    }()
    

    
//    public func configureCategoryCelll(index: Int) -> CategoryCell {
//        switch index {
//            case CategoryEnum.generes.rawValue:
//                return CategoryCell(category: .generes)
//            case CategoryEnum.tvSeries.rawValue:
//                return CategoryCell.init(category: .tvSeries)
//            case CategoryEnum.movies.rawValue:
//                return CategoryCell(category: .movies)
//            case CategoryEnum.inTheatre.rawValue:
//                return CategoryCell(category: .inTheatre)
//        default:
//            return CategoryCell(category: .tvSeries)
//            }
//        }
    
    
    public func configureCategoryCell(index: Int) {
        switch index {
            case CategoryEnum.generes.rawValue:
                self.categoryImageView.image = UIImage(systemName: "square.grid.2x2")
                self.titleLabel.text = "Generes"
            case CategoryEnum.tvSeries.rawValue:
                self.categoryImageView.image = UIImage(systemName: "tv")
                self.titleLabel.text = "TV Series"
            case CategoryEnum.movies.rawValue:
                self.categoryImageView.image = UIImage(systemName: "film")
                self.titleLabel.text = "Movies"
            case CategoryEnum.inTheatre.rawValue:
                self.categoryImageView.image = UIImage(systemName: "house")
                self.titleLabel.text = "In Theatre"
            default:
                self.categoryImageView.image = UIImage(systemName: "questionmark")
                self.titleLabel.text = "Unkown"
            }
        }
}


//MARK: - Setup constraints
extension CategoryCollectionViewCell {
    
    private func applyConstraints() {
        let customViewConstrainst = [
            customView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            customView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            customView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            customView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
        ]
        
        let categoryImageViewConstraints = [
            categoryImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            categoryImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ]
        
        let titleLabelConstraints = [
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 16)

        ]
                
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(categoryImageViewConstraints)
        NSLayoutConstraint.activate(customViewConstrainst)
    }
}

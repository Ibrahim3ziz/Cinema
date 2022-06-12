//
//  DataMovieView.swift
//  Cinema
//
//  Created by Ibrahim Abdul Aziz on 06/06/2022.
//

import UIKit

class DataMovieView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        setupSubViews()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupSubViews()
    }
    
    private func setupSubViews() {
        self.addSubview(previewImageView)
        self.addSubview(gradientLayer)
        self.addSubview(dataStackView)
        self.addSubview(titleLabel)
        self.addSubview(overviewLabel)
    }
    
    let backgroundGradient: GradientBackground = {
        let background = GradientBackground(frame: .zero)
        background.layer.cornerRadius = 16
        background.layer.masksToBounds = true
        return background
    }()

    
    let previewImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    
    let adultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemBlue
        label.clipsToBounds = true
        label.layer.cornerRadius = 12
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)

        return label
    }()
    
    
    let voteAverageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.layer.cornerRadius = 12
        label.backgroundColor = .systemYellow
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .black

        return label
    }()
    
    let languageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.layer.cornerRadius = 12
        label.backgroundColor = .systemBlue
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .white

        return label
    }()
    
    let overviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .justified
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.numberOfLines = 0
        label.textColor = .white

        return label
    }()
    
    let gradientLayer = GradientBackground(frame: .zero)
    
    lazy var dataStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = .fillEqually
        
        stackView.alignment = .fill
        stackView.spacing = 10
        
        stackView.addArrangedSubview(languageLabel)
        stackView.addArrangedSubview(adultLabel)
        stackView.addArrangedSubview(voteAverageLabel)
        
        self.addSubview(stackView)
                
        return stackView
        
    }()

}


extension DataMovieView {
    private func applyConstraints() {
        let previewImageViewConstrinats = [
            previewImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            previewImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            previewImageView.topAnchor.constraint(equalTo: self.topAnchor),
            previewImageView.bottomAnchor.constraint(equalTo: self.centerYAnchor)
        ]
        
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            titleLabel.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: dataStackView.topAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 80)
        ]
        
        let stackViewConstrints = [
            dataStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            dataStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            dataStackView.heightAnchor.constraint(equalToConstant: 28),
        ]
        
        let overviewConstraints = [
            overviewLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            overviewLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            overviewLabel.topAnchor.constraint(equalTo: self.dataStackView.bottomAnchor, constant: 20),
        ]
        
        let gradientLayerConstrints = [
            gradientLayer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            gradientLayer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            gradientLayer.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            gradientLayer.topAnchor.constraint(equalTo: self.centerYAnchor, constant: -28)
        ]
        
        NSLayoutConstraint.activate(previewImageViewConstrinats)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(stackViewConstrints)
        NSLayoutConstraint.activate(overviewConstraints)
        NSLayoutConstraint.activate(gradientLayerConstrints)
    }
}



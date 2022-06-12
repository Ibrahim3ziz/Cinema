//
//  SearchView.swift
//  Cinema
//
//  Created by Ibrahim Abdul Aziz on 17/05/2022.
//

import UIKit

class SearchView: UIView {
    
// MARK: - View life cycle methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private let searchTextField: UISearchTextField = {
        let searchBar = UISearchTextField()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Search"
        searchBar.font = .systemFont(ofSize: 24)
        searchBar.backgroundColor = .clear
        searchBar.layer.cornerRadius = 15
        searchBar.layer.borderWidth = 0.2
        searchBar.layer.borderColor = UIColor.white.cgColor
        searchBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        searchBar.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
                
        return searchBar
    }()
    
    
    private let searchRecorderButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let micImage = UIImage(systemName: "mic", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24))
        let whiteMicImage = micImage?.withTintColor(UIColor.lightGray, renderingMode: .alwaysOriginal)
        button.setImage(whiteMicImage, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        return button
    }()
    
    
   lazy var stackView: UIStackView = {
       let stackView = UIStackView()
       stackView.translatesAutoresizingMaskIntoConstraints = false

       stackView.axis = NSLayoutConstraint.Axis.horizontal
       stackView.distribution = .fillProportionally
       
       stackView.alignment = .center
       stackView.spacing = -40
       
       stackView.addArrangedSubview(searchTextField)
       stackView.addArrangedSubview(searchRecorderButton)
       
       self.addSubview(stackView)
       stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
       stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
       
       return stackView
    }()


    
    
}


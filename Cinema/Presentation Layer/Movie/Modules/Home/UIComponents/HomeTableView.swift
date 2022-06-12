//
//  HomeTableView.swift
//  Cinema
//
//  Created by Ibrahim Abdul Aziz on 23/05/2022.
//

import UIKit

class HomeTableView: UITableView {
    
    // MARK: - TableView life cycle methods
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        translatesAutoresizingMaskIntoConstraints = false
        register(MostPopularTableViewCell.self, forCellReuseIdentifier: MostPopularTableViewCell.identifier)
        register(CellTwoTableViewCell.self, forCellReuseIdentifier: CellTwoTableViewCell.identifier)
        register(CellThreeTableViewCell.self, forCellReuseIdentifier: CellThreeTableViewCell.identifier)
        allowsSelection = false
        backgroundColor = .clear
        separatorStyle = .none
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

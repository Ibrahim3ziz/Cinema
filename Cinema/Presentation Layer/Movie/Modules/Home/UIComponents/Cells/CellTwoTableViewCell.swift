//
//  CellTwoTableViewCell.swift
//  Cinema
//
//  Created by Ibrahim Abdul Aziz on 24/05/2022.
//
import UIKit


class CellTwoTableViewCell: UITableViewCell {
    
// MARK: - Cell life cycle methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        contentView.addSubview(collectionView)
        assignDelegates()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func assignDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
// MARK: - Properties
    static let identifier = "CellTwoTableViewCell"
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 4 - 16), height: (UIScreen.main.bounds.height / 6 - 16) )
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    

}



// MARK: - UITableViewCell DataSource & Delegate
extension CellTwoTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configureCategoryCell(index: indexPath.item)
        return cell
        
    }
    
    
}


//MARK: - Setup constraints
extension CellTwoTableViewCell {
    
    private func applyConstraints() {
        let collectionViewConstraints = [
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            collectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            collectionView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ]
        NSLayoutConstraint.activate(collectionViewConstraints)
    }
}

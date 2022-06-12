//
//  MostPopularTableViewCell.swift
//  Cinema
//
//  Created by Ibrahim Abdul Aziz on 23/05/2022.
//

import UIKit

protocol CollectionViewTableViewCellDelegate: AnyObject {
    func didSelectCell(cell: UITableViewCell, indexPath: IndexPath, with id: Int)
}

protocol CollectionViewTableViewReachedLastItemDelegate: AnyObject {
    func reachedLastCell(_ reached: Bool)
}

class MostPopularTableViewCell: UITableViewCell {

//MARK: - Cell life cycle methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionView)
        applyConstraints()
        assignDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {

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
    
    
//MARK: - Properties
    static let identifier = "MostPopularTableViewCell"
    
    weak var delegate: CollectionViewTableViewCellDelegate?
    weak var lastItemDelegat: CollectionViewTableViewReachedLastItemDelegate?
    
    var viewModel: [DisplayedPopularMovieViewModel]? {
        didSet {
            collectionView.reloadData()
        }
    }
        
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: (UIScreen.main.bounds.height / 5 - 40))
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MostPopularCollectionViewCell.self, forCellWithReuseIdentifier: MostPopularCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
//        collectionView.isPagingEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
        
    }()

}

// MARK: - UITableViewCell DataSource & Delegate
extension MostPopularTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return viewModel?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MostPopularCollectionViewCell.identifier, for: indexPath) as? MostPopularCollectionViewCell else { return UICollectionViewCell() }
        
        cell.dataSource = viewModel?[indexPath.row]
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectCell(cell: self, indexPath: indexPath, with: viewModel?[indexPath.item].id ?? 0)
    }
  
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == viewModel!.count - 1 {
            lastItemDelegat?.reachedLastCell(true)
            print("Done")
        }
    }

    
}

//MARK: - Setup constraints
extension MostPopularTableViewCell {
    
    private func applyConstraints() {
        let collectionViewConstraints = [
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -16),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ]
        NSLayoutConstraint.activate(collectionViewConstraints)
    }
}

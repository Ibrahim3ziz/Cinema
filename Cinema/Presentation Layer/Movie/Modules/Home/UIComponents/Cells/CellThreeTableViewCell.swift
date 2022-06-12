//
//  CellThreeTableViewCell.swift
//  Cinema
//
//  Created by Ibrahim Abdul Aziz on 01/06/2022.
//

import UIKit



class CellThreeTableViewCell: UITableViewCell {

//MARK: - Cell life cycle methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        contentView.addSubview(collectionView)
        applyConstraints()
        assignDelegates()
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
    
    
//MARK: - Properties
    static let identifier = "CellThreeTableViewCell"
    weak var delegate: CollectionViewTableViewCellDelegate?
    
    var viewModel: [DisplayedUpcomingViewModel]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 3), height: (UIScreen.main.bounds.height / 3 - 50))
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UpcomingCollectionViewCell.self, forCellWithReuseIdentifier: UpcomingCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()

}



// MARK: - UITableViewCell DataSource & Delegate
extension CellThreeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.identifier, for: indexPath) as? UpcomingCollectionViewCell else { return UICollectionViewCell() }
        cell.dataSource = viewModel?[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectCell(cell: self, indexPath: indexPath, with: viewModel?[indexPath.item].id ?? 0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == viewModel!.count - 1 {
            print("Done")
        }
    }
    
}


//MARK: - Setup constraints
extension CellThreeTableViewCell {
    
    private func applyConstraints() {
        let collectionViewConstraints = [
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ]
        NSLayoutConstraint.activate(collectionViewConstraints)
    }
}

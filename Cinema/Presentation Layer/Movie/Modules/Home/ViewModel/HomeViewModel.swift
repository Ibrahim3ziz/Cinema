//
//  HomeViewModel.swift
//  Cinema
//
//  Created by Ibrahim Abdul Aziz on 06/06/2022.
//

import Foundation
import UIKit

class HomeViewModel {
    
    init () { }

    private(set) public var sectionTitles: [String] = ["Most Popular", "", "Upcoming Releases"]
    
    private(set) public var numberOfRowsInSection: Int = 1
    
    private(set) public var heightForHeaderInSection: CGFloat = 20
    
    
    func heightForRowAt(view: UIView, indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return view.bounds.height / 5
        case 1:
            return view.bounds.height / 6
        case 2:
            return view.bounds.height / 3
        default:
            return 50
        }
    }
    
    func willDisplayHeaderView(view: UIView) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        header.textLabel?.textColor = UIColor.white
    }
    
    func cellForRowAt(tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        guard let cellOne = tableView.dequeueReusableCell(withIdentifier: MostPopularTableViewCell.identifier) as? MostPopularTableViewCell else { return UITableViewCell() }
        guard let cellTwo = tableView.dequeueReusableCell(withIdentifier: CellTwoTableViewCell.identifier) as? CellTwoTableViewCell else { return UITableViewCell() }
        guard let cellThree = tableView.dequeueReusableCell(withIdentifier: CellThreeTableViewCell.identifier) as? CellThreeTableViewCell else { return UITableViewCell() }

        switch indexPath.section {
        case SectionsEnum.popular.rawValue:
//            cellOne.viewModel = self.mostPopularViewModels.popularMovies

            return cellOne
        case SectionsEnum.category.rawValue:

            return cellTwo
        case SectionsEnum.upcomingReleases.rawValue:
//            cellThree.viewModel = self.upcomingViewModels.upcomingMovies

            return cellThree
        default:
            return cellOne
        }
    }
    
}

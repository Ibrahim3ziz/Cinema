//
//  HomeViewController.swift
//  Cinema
//
//  Created Ibrahim Abdul Aziz on 17/05/2022.
//  Copyright © 2022 Ibrahim Abdul Aziz, Co. Ltd. All rights reserved.
//

import UIKit




class HomeViewController: UIViewController {


    // MARK: - Properties
    private let homeViewModel = HomeViewModel()
    private let mostPopularViewModels = PopularMovieViewModel()
    private let upcomingViewModels = UpcomingViewModel()
    
    private let gradientBackground = GradientBackground(frame: .zero)
    private let searchView = SearchView(frame: .zero)
    private let homeTableView = HomeTableView(frame: .zero)
    
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    
    private var tempPage = 1

    // MARK: - Computed Variables

}

// MARK: - View controller lifecycle methods
extension HomeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        applyConstraints()
        assignDelegates()
        interactor?.getMostPopularMovies(page: tempPage)
        interactor?.getUpcomingMovies(page: 1)

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupSubViews()
        applyConstraints()
    }
    
    private func setupSubViews() {
        view.addSubview(gradientBackground)
        view.addSubview(searchView)
        view.addSubview(homeTableView)
    }
    
    private func assignDelegates() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }

    
}

// MARK: - IBActions
extension HomeViewController {

}

// MARK: - Selectors
extension HomeViewController {

}

// MARK: - Private Methods
extension HomeViewController {
    
    private func applyConstraints() {
        let gradientBackgroundConstraints = [
            gradientBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientBackground.topAnchor.constraint(equalTo: view.topAnchor),
            gradientBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        let searchViewConstraints = [
            searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            searchView.heightAnchor.constraint(equalToConstant: 26)
        ]
        
        let homeTableViewConstraints = [
            homeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeTableView.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 30),
            homeTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]

        NSLayoutConstraint.activate(gradientBackgroundConstraints)
        NSLayoutConstraint.activate(searchViewConstraints)
        NSLayoutConstraint.activate(homeTableViewConstraints)
        
    }

}

// MARK: - Protocol
extension HomeViewController: HomeViewProtocol {
    
  
    func didObtainedMostPopularMovie(id: Int) {
        router?.routeToPreviewMovieViewController(with: id)
    }
    
    func didFailObtainMostPopularMove(message: NetworkError) {
        print(message)
    }
    
    
    func didFetchMostPopularMoviesSuccessfully(viewModel: [DisplayedPopularMovieViewModel]) {
        mostPopularViewModels.set(popularMovies: viewModel)
        homeTableView.reloadData()
    }
        
    func didFailFetchingMostPopularMovies(message: NetworkError) {
        print(message.errorDescription!)
    }
    

    func didFetchUpcomingMoviesSuccessfully(viewModel: [DisplayedUpcomingViewModel]) {
        upcomingViewModels.set(upcomingMovies: viewModel)
    }

    
    func didFailFetchingUpcomingMovies(message: NetworkError) {
        print(message.errorDescription!)
    }
    
    
}


// MARK: - UITableView DataSource & Delegate
extension  HomeViewController: UITableViewDataSource, UITableViewDelegate {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        homeViewModel.numberOfRowsInSection
    }    


    func numberOfSections(in tableView: UITableView) -> Int {
        homeViewModel.sectionTitles.count
    }

    //MARK: - Need Enhancement!!!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cellOne = tableView.dequeueReusableCell(withIdentifier: MostPopularTableViewCell.identifier) as? MostPopularTableViewCell else { return UITableViewCell() }
        guard let cellTwo = tableView.dequeueReusableCell(withIdentifier: CellTwoTableViewCell.identifier) as? CellTwoTableViewCell else { return UITableViewCell() }
        guard let cellThree = tableView.dequeueReusableCell(withIdentifier: CellThreeTableViewCell.identifier) as? CellThreeTableViewCell else { return UITableViewCell() }
        
        switch indexPath.section {
        case SectionsEnum.popular.rawValue:
            cellOne.viewModel = self.mostPopularViewModels.popularMovies
            cellOne.delegate = self
            cellOne.lastItemDelegat = self
            return cellOne
        case SectionsEnum.category.rawValue:

            return cellTwo
        case SectionsEnum.upcomingReleases.rawValue:
            cellThree.viewModel = self.upcomingViewModels.upcomingMovies
            cellThree.delegate = self
            return cellThree
        default:
            return cellOne
        }
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        homeViewModel.heightForRowAt(view: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        homeViewModel.sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        homeViewModel.heightForHeaderInSection
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        homeViewModel.willDisplayHeaderView(view: view)
    }
    
     
}

extension HomeViewController: CollectionViewTableViewCellDelegate {
    
    func didSelectCell(cell: UITableViewCell, indexPath: IndexPath, with id: Int) {
        router?.routeToPreviewMovieViewController(with: id)
    }

}


extension HomeViewController: CollectionViewTableViewReachedLastItemDelegate {
    func reachedLastCell(_ reached: Bool) {
        if reached == true {
            print("I reached the last")
            tempPage += 1
            interactor?.getMostPopularMovies(page: tempPage)

        }
    }
    
    
}


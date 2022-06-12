//
//  HomeRouter.swift
//  Cinema
//
//  Created Ibrahim Abdul Aziz on 17/05/2022.
//  Copyright © 2022 Ibrahim Abdul Aziz, Co. Ltd. All rights reserved.
//

import UIKit

class HomeRouter {

    private weak var viewController: UIViewController?

    private init () {}

    private init(with viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func initModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = HomeViewController(nibName: nil, bundle: nil)
        let interactor = HomeInteractor()
        let router = HomeRouter(with: view)
        let presenter = HomePresenter(interface: view)

        view.interactor = interactor
        interactor.repoInterface = RepoImplentation()
        view.router = router
        interactor.presenter = presenter
        
        return view
    }
}

// MARK: - Protocal
extension HomeRouter: HomeRouterProtocol {

    func routeToPreviewMovieViewController(with id: Int) {
        let controller = MoviePreviewRouter.initModule(id: id)
        viewController?.navigationController?.pushViewController(controller, animated: true)
    }
}


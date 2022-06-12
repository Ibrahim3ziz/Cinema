//
//  MoviePreviewRouter.swift
//  Cinema
//
//  Created Ibrahim Abdul Aziz on 06/06/2022.
//  Copyright © 2022 Ibrahim Abdul Aziz, Co. Ltd. All rights reserved.
//

import UIKit

class MoviePreviewRouter {

    private weak var viewController: UIViewController?

    private init () {}

    private init(with viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func initModule(id: Int) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = MoviePreviewViewController(id: id)
        let interactor = MoviePreviewInteractor()
        let router = MoviePreviewRouter(with: view)
        let presenter = MoviePreviewPresenter(interface: view)

        view.interactor = interactor
        interactor.repoInterface = RepoImplementation()
        view.router = router
        interactor.presenter = presenter
        
        return view
    }
}

// MARK: - Protocal
extension MoviePreviewRouter: MoviePreviewRouterProtocol {
    
}

//
//  FavoriteRouter.swift
//  Cinema
//
//  Created Ibrahim Abdul Aziz on 17/05/2022.
//  Copyright © 2022 Ibrahim Abdul Aziz, Co. Ltd. All rights reserved.
//

import UIKit

class FavoriteRouter {

    private weak var viewController: UIViewController?

    private init () {}

    private init(with viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func initModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = FavoriteViewController(nibName: nil, bundle: nil)
        let interactor = FavoriteInteractor()
        let router = FavoriteRouter(with: view)
        let presenter = FavoritePresenter(interface: view)

        view.interactor = interactor
        view.router = router
        interactor.presenter = presenter
        
        return view
    }
}

// MARK: - Protocal
extension FavoriteRouter: FavoriteRouterProtocol {

}

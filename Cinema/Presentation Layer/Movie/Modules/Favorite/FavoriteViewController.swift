//
//  FavoriteViewController.swift
//  Cinema
//
//  Created Ibrahim Abdul Aziz on 17/05/2022.
//  Copyright © 2022 Ibrahim Abdul Aziz, Co. Ltd. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    // MARK: - Properties
    var interactor: FavoriteInteractorProtocol?
    var router: FavoriteRouterProtocol?

    // MARK: - Computed Variables

    // MARK: - IBOutlets

}

// MARK: - View controller lifecycle methods
extension FavoriteViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .green
    }
}

// MARK: - IBActions
extension FavoriteViewController {

}

// MARK: - Selectors
extension FavoriteViewController {

}

// MARK: - Private Methods
extension FavoriteViewController {

}

// MARK: - Protocal
extension FavoriteViewController: FavoriteViewProtocol {

}

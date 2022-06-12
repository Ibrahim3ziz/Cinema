//
//  FavoritePresenter.swift
//  Cinema
//
//  Created Ibrahim Abdul Aziz on 17/05/2022.
//  Copyright © 2022 Ibrahim Abdul Aziz, Co. Ltd. All rights reserved.
//

import Foundation

class FavoritePresenter {

     weak var view: FavoriteViewProtocol?
   
    init(interface: FavoriteViewProtocol) {
        self.view = interface
    }

}

// MARK: - Protocol
extension FavoritePresenter: FavoritePresenterProtocol {

}

// MARK: - Private Methods
extension FavoritePresenter {
    
}


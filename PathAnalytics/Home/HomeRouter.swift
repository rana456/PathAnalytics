//
//  HomeRouter.swift
//  PathAnalytics
//
//  Created by Ramu Naidu Tumpala on 5/25/20.
//  Copyright © 2020 Ramu Naidu Tumpala. All rights reserved.
//

import UIKit

class HomeRouter: HomeRouting {
    
    static func make(url: String) -> UIViewController? {
        let board = UIStoryboard(name: "Home", bundle: nil)
        guard let vc = board.instantiateInitialViewController() as? HomeViewController else { return nil }
        guard let urlRequest = URL(string: url) else { return nil }
        let presenter = HomePresenter(url: urlRequest)
        
        vc.presenter = presenter
        presenter.view = vc

        return vc
    }
}

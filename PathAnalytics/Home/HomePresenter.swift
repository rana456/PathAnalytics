//
//  HomePresenter.swift
//  PathAnalytics
//
//  Created by Ramu Naidu Tumpala on 5/25/20.
//  Copyright © 2020 Ramu Naidu Tumpala. All rights reserved.
//

import Foundation

class HomePresenter: HomePresenting {
    weak var view: HomeDisplaying?
    var url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func viewLoaded() {
        view?.setupUI()
        view?.reload()
    }
}

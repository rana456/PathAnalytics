//
//  HomeContract.swift
//  PathAnalytics
//
//  Created by Ramu Naidu Tumpala on 5/25/20.
//  Copyright © 2020 Ramu Naidu Tumpala. All rights reserved.
//

import UIKit

protocol HomeDisplaying: class {
    var presenter: HomePresenting! { get set }

    func setupUI()
    func reload()
}

protocol HomePresenting: class {
    var view: HomeDisplaying? { get set } // weak
    var url: URL { get set }

    func viewLoaded()
}

protocol HomeRouting: class {
    static func make(url: String) -> UIViewController?
}

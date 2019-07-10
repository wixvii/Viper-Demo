//
//  NewsDetailRouter.swift
//  ViperDemoProject
//
//  Created Yildirim Atcioglu on 10.07.2019.
//  Copyright © 2019 Yildirim Atcioglu. All rights reserved.
//
//

import UIKit

class NewsDetailRouter: NewsDetailRouterProtocol {

    weak var viewController: UIViewController?

    static func createModule(with newsDetail:NewsModel) -> UIViewController {
        let view = NewsDetailViewController(nibName: "NewsDetailViewController", bundle: nil)
        let interactor = NewsDetailInteractor()
        let router = NewsDetailRouter()
        let presenter = NewsDetailPresenter(view: view, interactor: interactor, router: router, newsDetail: newsDetail)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}

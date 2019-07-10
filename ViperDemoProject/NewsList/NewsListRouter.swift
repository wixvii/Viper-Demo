//
//  NewsListRouter.swift
//  ViperDemoProject
//
//  Created Yildirim Atcioglu on 9.07.2019.
//  Copyright © 2019 Yildirim Atcioglu. All rights reserved.
//
//

import UIKit

class NewsListRouter: NewsListRouterProtocol {

     var navigationController: UINavigationController?

    static func createModule() -> UIViewController {
        let view = NewsListViewController(nibName: "NewsListViewController", bundle: nil)
        let interactor = NewsListInteractor()
        let router = NewsListRouter()
        let navigation = UINavigationController(rootViewController: view)
        let presenter = NewsListPresenter(view: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.navigationController = navigation
        
        return navigation
    }
    
    func routeToDetail(with news: NewsModel) {
        let detail = NewsDetailRouter.createModule(with: news)
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
}

//
//  NewsDetailPresenter.swift
//  ViperDemoProject
//
//  Created Yildirim Atcioglu on 10.07.2019.
//  Copyright © 2019 Yildirim Atcioglu. All rights reserved.
//
//

import UIKit

class NewsDetailPresenter: NewsDetailPresenterProtocol {

    weak private var view: NewsDetailViewProtocol?
    var interactor: NewsDetailInteractorProtocol?
    private let router: NewsDetailRouterProtocol
    
    var newsDetail:NewsModel

    init(view: NewsDetailViewProtocol, interactor: NewsDetailInteractorProtocol?, router: NewsDetailRouterProtocol,newsDetail:NewsModel) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.newsDetail = newsDetail
    }
    
    
    func starLoading() {
        self.view?.loadNews(with: self.newsDetail)
    }

}

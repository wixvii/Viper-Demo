//
//  NewsListPresenter.swift
//  ViperDemoProject
//
//  Created Yildirim Atcioglu on 9.07.2019.
//  Copyright © 2019 Yildirim Atcioglu. All rights reserved.
//
//

import UIKit

class NewsListPresenter: NewsListPresenterProtocol {
  
    weak private var view: NewsListViewProtocol?
    var interactor: NewsListInteractorProtocol?
    private let router: NewsListRouterProtocol
    
    
    
    var newsList : NewsListModel?

    init(view: NewsListViewProtocol, interactor: NewsListInteractorProtocol?, router: NewsListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    
    func startLoading() {
        interactor?.fetchNews()
    }
    
    func newsFetched(newsList: NewsListModel) {
        self.newsList = newsList
        self.view?.showNews()
    }
    
    func newsFetched(with error: String) {
        self.view?.showError(error: error)
    }
    
    func getNewsCount() -> Int {
        return self.newsList?.articles.count ?? 0
    }
    
    func getNewsItem(at index: IndexPath) -> NewsModel {
        return self.newsList!.articles[index.row]
    }
    func selectNews(at index: IndexPath) {
        let newsDetail = self.newsList?.articles[index.row]
        self.router.routeToDetail(with: newsDetail!)
    }
    
    

}

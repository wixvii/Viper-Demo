//
//  NewsListProtocols.swift
//  ViperDemoProject
//
//  Created Yildirim Atcioglu on 9.07.2019.
//  Copyright © 2019 Yildirim Atcioglu. All rights reserved.
//
//

import Foundation

//MARK: Router -
protocol NewsListRouterProtocol: class {
    func routeToDetail(with news:NewsModel)
}
//MARK: Presenter -
protocol NewsListPresenterProtocol: class {
    
    //interactor
    func newsFetched(newsList:NewsListModel)
    func newsFetched(with error:String)
    
    // view
    func startLoading()
    func getNewsCount() -> Int
    func getNewsItem(at index:IndexPath)-> NewsModel
    func selectNews(at index:IndexPath)
}

//MARK: Interactor -
protocol NewsListInteractorProtocol: class {
  var presenter: NewsListPresenterProtocol?  { get set }
    func fetchNews()
}

//MARK: View -
protocol NewsListViewProtocol: class {
    var presenter: NewsListPresenterProtocol?  { get set }
    
    func showNews()
    func showError(error:String)
}

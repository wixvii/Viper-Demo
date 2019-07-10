//
//  NewsDetailProtocols.swift
//  ViperDemoProject
//
//  Created Yildirim Atcioglu on 10.07.2019.
//  Copyright © 2019 Yildirim Atcioglu. All rights reserved.
//
//

import Foundation

//MARK: Router -
protocol NewsDetailRouterProtocol: class {

}
//MARK: Presenter -
protocol NewsDetailPresenterProtocol: class {

    func starLoading()
}

//MARK: Interactor -
protocol NewsDetailInteractorProtocol: class {

    var presenter: NewsDetailPresenterProtocol?  { get set }
}

//MARK: View -
protocol NewsDetailViewProtocol: class {
    var presenter: NewsDetailPresenterProtocol?  { get set }
    
    func loadNews(with detail:NewsModel)
}

//
//  NewsListInteractor.swift
//  ViperDemoProject
//
//  Created Yildirim Atcioglu on 9.07.2019.
//  Copyright © 2019 Yildirim Atcioglu. All rights reserved.
//
//

import UIKit

class NewsListInteractor: NewsListInteractorProtocol {
    func fetchNews() {
        let urlString = "https://newsapi.org/v2/everything?q=bitcoin" + "&apiKey=" + "a6e7fdb1b2b54440a898fd2645196eb3"
        let url = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let data = data
            {
                do{
//                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    let decoder : JSONDecoder = JSONDecoder()
                    let news = try decoder.decode( NewsListModel.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.presenter?.newsFetched(newsList: news)
                    }
                }catch
                {
                    print("error")
                    DispatchQueue.main.async
                    {
                        self.presenter?.newsFetched(with: "Decoding error")
                    }
                }
            }
            
        }
        task.resume()
    }
    

    weak var presenter: NewsListPresenterProtocol?
}

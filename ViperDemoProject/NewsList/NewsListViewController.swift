//
//  NewsListViewController.swift
//  ViperDemoProject
//
//  Created Yildirim Atcioglu on 9.07.2019.
//  Copyright © 2019 Yildirim Atcioglu. All rights reserved.
//
//

import UIKit

class NewsListViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    
    var presenter: NewsListPresenterProtocol?

	override func viewDidLoad() {
        self.tableView.register(UINib(nibName: "NewsListCell", bundle: nil), forCellReuseIdentifier: "NewsListCell")
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.title = "News"
        
        presenter?.startLoading()
    }

}

extension NewsListViewController : NewsListViewProtocol
{
    func showNews() {
        self.tableView.reloadData()
    }
    
    func showError(error: String) {
        let alert = UIAlertController(title: "title", message: error, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}


extension NewsListViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.getNewsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsListCell", for: indexPath) as! NewsListCell
        let cellData = self.presenter?.getNewsItem(at: indexPath)
        cell.newsTitleLabel.text = cellData?.title
        cell.newsDateLabel.text = cellData?.publishedAt
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.selectNews(at: indexPath)
    }
    
}

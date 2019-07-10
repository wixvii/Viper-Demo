//
//  NewsDetailViewController.swift
//  ViperDemoProject
//
//  Created Yildirim Atcioglu on 10.07.2019.
//  Copyright © 2019 Yildirim Atcioglu. All rights reserved.
//
//

import UIKit

class NewsDetailViewController: UIViewController, NewsDetailViewProtocol {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
	var presenter: NewsDetailPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.starLoading()
    }
    
    
    func loadNews(with detail: NewsModel) {
        self.titleLabel.text = detail.title
        self.descriptionTextView.text = detail.description
    }

}

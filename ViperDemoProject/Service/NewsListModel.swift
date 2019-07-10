//
//  NewsListModel.swift
//  ViperDemoProject
//
//  Created by Yildirim Atcioglu on 9.07.2019.
//  Copyright © 2019 Yildirim Atcioglu. All rights reserved.
//

import Foundation


class NewsListModel : Codable {
    var status : String?
    var articles : [NewsModel] = []
}

class NewsModel : Codable {
    var title : String?
    var publishedAt : String?
    var description : String?
}

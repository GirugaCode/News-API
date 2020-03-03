//
//  File.swift
//  News-API-Take-Home
//
//  Created by Ryan Nguyen on 3/2/20.
//  Copyright © 2020 Danh Phu Nguyen. All rights reserved.
//

import UIKit

struct ArticleModel: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let content: String?
    
}

struct Source: Decodable {
    let id: String?
    let name: String?
    
}

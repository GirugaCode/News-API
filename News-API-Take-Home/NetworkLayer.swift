//
//  NetworkLayer.swift
//  News-API-Take-Home
//
//  Created by Ryan Nguyen on 3/2/20.
//  Copyright © 2020 Danh Phu Nguyen. All rights reserved.
//

import Foundation

class NetworkLayer {
    public static let shared = NetworkLayer()
    
    func fetchNews(category: String, completionHandler: @escaping(_ articleModel: ArticleModel) -> ()) {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=\(category)&apiKey=0ed8913cd0a04025a4b65f00a14e591b")!
        
        let session = URLSession.shared.dataTask(with: url) {(data, res, err) in
            if err != nil {
                print("Error while creating session", err!)
                return
            }
            if let response = res as? HTTPURLResponse, let data = data {
                if response.statusCode == 200  && response.mimeType == "application/json"{
                    print("Success: \(response.statusCode)")
                    let articleModel = try? JSONDecoder().decode(ArticleModel.self, from: data)
                    DispatchQueue.main.async {
                        completionHandler(articleModel!)
                    }
                }
            }
        }
        session.resume()
    }
    
    
}

//
//  NewsPageViewController.swift
//  News-API-Take-Home
//
//  Created by Ryan Nguyen on 3/2/20.
//  Copyright © 2020 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class NewsPageViewController: UITableViewController {
    
    var newsTitle: String?
    let cellId = "cellId"
    var articles: [Article]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = newsTitle
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(NewsCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! NewsCell
        let currentNewsCell = articles[indexPath.row]
        cell.newsTextView.text = currentNewsCell.title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    

}

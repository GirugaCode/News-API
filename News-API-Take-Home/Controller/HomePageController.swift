//
//  HomePageController.swift
//  News-API-Take-Home
//
//  Created by Ryan Nguyen on 1/28/20.
//  Copyright © 2020 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class HomePageController: UICollectionViewController {
    
    var categories = ["General", "Entertainment", "Health", "Science", "Technology", "Sports"]
    
    let cellId = "cellId"
    
    let searchBar: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupCollectionView()
    }
    
    private func setupSearchBar() {
        
        navigationItem.title = "News Stand"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchBar
    
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        
        cell.categoryLabel.text = categories[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NetworkLayer.shared.fetchNews(category: categories[indexPath.row]) { (articleModel) in
            let newsPageVC = NewsPageViewController()
            newsPageVC.articles = articleModel.articles
            self.navigationController?.pushViewController(newsPageVC, animated: true)
        }
    }
}

extension HomePageController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
}

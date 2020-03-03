//
//  CategoryCell.swift
//  News-API-Take-Home
//
//  Created by Ryan Nguyen on 1/29/20.
//  Copyright © 2020 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        layer.cornerRadius = 25
        addSubview(categoryLabel)
        
        NSLayoutConstraint.activate([
            categoryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            categoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}

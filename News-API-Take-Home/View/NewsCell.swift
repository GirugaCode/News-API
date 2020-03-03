//
//  NewsCell.swift
//  News-API-Take-Home
//
//  Created by Ryan Nguyen on 3/2/20.
//  Copyright © 2020 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    let newsTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.isSelectable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let thumbNail: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCells()
    }
    
    private func setupCells() {
        addSubview(newsTextView)
        addSubview(thumbNail)
        
        NSLayoutConstraint.activate([
            newsTextView.topAnchor.constraint(equalTo: topAnchor),
            newsTextView.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsTextView.trailingAnchor.constraint(equalTo: thumbNail.leadingAnchor, constant: 8),
            newsTextView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            thumbNail.topAnchor.constraint(equalTo: topAnchor),
            thumbNail.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8),
            thumbNail.widthAnchor.constraint(equalToConstant: 180),
            thumbNail.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

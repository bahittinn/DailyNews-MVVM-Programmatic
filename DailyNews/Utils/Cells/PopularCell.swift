//
//  PopularCell.swift
//  DailyNews
//
//  Created by Bahittin on 30.10.2023.
//

import UIKit

final class PopularCell: UITableViewCell {
    static let reuseID = "PopularCell"
    
    //MARK: - Variables
    
    private let newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "denemeimage")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - Constraints
    
    func configureUI() {
        configureImageViewConstraints()
    }
    
    func configureImageViewConstraints() {
        addSubview(newsImageView)
        
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsImageView.widthAnchor.constraint(equalToConstant: 64),
            newsImageView.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
    
    func configureNewsTitleContraints() {
        
    }
}

//
//  TrendingCell.swift
//  DailyNews
//
//  Created by Bahittin on 30.10.2023.
//

import UIKit

final class TrendingCell: UICollectionViewCell {
    static let reuseID = "TrendingCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let trendingNewsLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "denemeimage")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    func configure() {
        addSubview(newsImageView)
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: topAnchor),
            newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            newsImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

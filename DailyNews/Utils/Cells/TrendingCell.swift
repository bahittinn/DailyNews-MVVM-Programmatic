//
//  TrendingCell.swift
//  DailyNews
//
//  Created by Bahittin on 30.10.2023.
//

import UIKit
import Kingfisher

final class TrendingCell: UICollectionViewCell {
    static let reuseID = "TrendingCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - VARIABLES
    private let trendingNewsLabel: UILabel = {
        let label = UILabel()
        label.text = "Trending News"
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .lightGray
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        return label
    }()
    
    private let newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.alpha = 0.9
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let newsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 3
        return label
    }()
    
    private let detailButton: UIButton = {
        let button = UIButton()
        button.setTitle("Learn More →", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - CONSTRAINTS
    
    func configureUI() {
        configureImageViewConstraints()
        configureTrendingNewsLabelConstraints()
        configureNewsTitleLableConstraints()
        configureDetailButton()
    }
    
    func configureImageViewConstraints() {
        addSubview(newsImageView)
        
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: topAnchor),
            newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            newsImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func configureTrendingNewsLabelConstraints() {
        addSubview(trendingNewsLabel)
        
        NSLayoutConstraint.activate([
            trendingNewsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            trendingNewsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            trendingNewsLabel.widthAnchor.constraint(equalToConstant: 120),
            trendingNewsLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    func configureNewsTitleLableConstraints() {
        addSubview(newsTitleLabel)
        
        NSLayoutConstraint.activate([
            newsTitleLabel.topAnchor.constraint(equalTo: trendingNewsLabel.bottomAnchor, constant: 40),
            newsTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            newsTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    func configureDetailButton() {
        addSubview(detailButton)
        
        NSLayoutConstraint.activate([
            detailButton.topAnchor.constraint(equalTo: newsTitleLabel.bottomAnchor, constant: 10),
            detailButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            detailButton.widthAnchor.constraint(equalToConstant: 150),
            detailButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    //MARK: - Set UI
    
    func makeCell(with title: String, imageURL: URL) {
        DispatchQueue.main.async {
            self.newsTitleLabel.text = title
            self.newsImageView.kf.setImage(with: imageURL)
        }
    }
    
    override func prepareForReuse() {
        newsTitleLabel.text = nil
        newsImageView.image = nil
    }
}

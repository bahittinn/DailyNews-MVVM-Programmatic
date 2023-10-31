//
//  PopularCell.swift
//  DailyNews
//
//  Created by Bahittin on 30.10.2023.
//

import UIKit
import Kingfisher

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
    
    private let newsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Flight Data Suggests China Eastern Plane Deliberately Crashed"
        label.font = .boldSystemFont(ofSize: 14)
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let newsFromLabel: UILabel = {
        let label = UILabel()
        label.text = "By BBC News"
        label.font = .systemFont(ofSize: 13)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let readTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "⚇ 1 min read"
        label.font = .systemFont(ofSize: 13)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Constraints
    
    func configureUI() {
        configureImageViewConstraints()
        configureNewsTitleContraints()
        configureFromLabelConstraints()
        configureReadTimeLabelConstraints()
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
        addSubview(newsTitleLabel)
        
        NSLayoutConstraint.activate([
            newsTitleLabel.topAnchor.constraint(equalTo: newsImageView.topAnchor, constant: 5),
            newsTitleLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 15),
            newsTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    func configureFromLabelConstraints() {
        addSubview(newsFromLabel)
        
        NSLayoutConstraint.activate([
            newsFromLabel.topAnchor.constraint(equalTo: newsTitleLabel.bottomAnchor, constant: 10),
            newsFromLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 15),
        ])
    }
    
    func configureReadTimeLabelConstraints() {
        addSubview(readTimeLabel)
        
        NSLayoutConstraint.activate([
            readTimeLabel.topAnchor.constraint(equalTo: newsTitleLabel.bottomAnchor, constant: 10),
            readTimeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
        ])
    }
    
    func makeCell(title: String, imageURL: URL, postedBy: String) {
        DispatchQueue.main.async {
            self.newsImageView.kf.setImage(with: imageURL)
            self.newsFromLabel.text = postedBy
            self.newsTitleLabel.text = title
        }
    }
    
    override func prepareForReuse() {
        newsImageView.image = nil
        newsFromLabel.text  = nil
        newsTitleLabel.text = nil
    }
}

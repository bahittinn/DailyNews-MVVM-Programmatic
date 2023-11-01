//
//  NewsImage.swift
//  DailyNews
//
//  Created by Bahittin on 1.11.2023.
//

import UIKit

final class NewsImage: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        alpha = 0.9
        layer.cornerRadius = 10
        layer.masksToBounds = true
        contentMode = .scaleToFill
        translatesAutoresizingMaskIntoConstraints = false
    }
}

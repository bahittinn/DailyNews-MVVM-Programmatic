//
//  NewsContrainerView.swift
//  DailyNews
//
//  Created by Bahittin on 3.11.2023.
//

import UIKit

final class NewsContainerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
    }
}

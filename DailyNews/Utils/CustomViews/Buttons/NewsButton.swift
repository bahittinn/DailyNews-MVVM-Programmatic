//
//  NewsButton.swift
//  DailyNews
//
//  Created by Bahittin on 3.11.2023.
//

import UIKit

final class NewsButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius    = 10
        backgroundColor = .red
        setTitleColor(.white, for: .normal)
        setTitle("OK", for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
}

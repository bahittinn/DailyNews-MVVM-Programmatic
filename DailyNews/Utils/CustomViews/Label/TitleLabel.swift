//
//  TitleLabel.swift
//  DailyNews
//
//  Created by Bahittin on 1.11.2023.
//

import UIKit

final class TitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure(fontSize: 14)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(fontSize: CGFloat) {
        font = .boldSystemFont(ofSize: fontSize)
        numberOfLines = 0
        translatesAutoresizingMaskIntoConstraints = false
    }
}

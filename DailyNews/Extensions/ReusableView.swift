//
//  ReusableView.swift
//  DailyNews
//
//  Created by Bahittin on 30.09.2023.
//

import UIKit

class SectionHeaderReusableView: UICollectionReusableView {
    
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Başlık etiketi oluşturun ve ayarlayın
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18) // Başlık fontunu ayarlayabilirsiniz
        titleLabel.textColor = UIColor.black // Başlık rengini ayarlayabilirsiniz
        addSubview(titleLabel)
        
        // Başlık etiketinin yerleşimini ayarlayın
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16), // Sol kenara boşluk ekleyebilirsiniz
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor) // Dikey hizalamayı ayarlayabilirsiniz
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

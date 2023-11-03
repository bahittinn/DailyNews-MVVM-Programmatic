//
//  ViewController+Ext.swift
//  DailyNews
//
//  Created by Bahittin on 3.11.2023.
//

import UIKit

extension UIViewController {
    func showAlertMainThread(with title: String) {
        DispatchQueue.main.async {
            let alertVC = NewsAlertVC(alertTitle: title)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle   = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}

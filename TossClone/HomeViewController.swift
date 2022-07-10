//
//  HomeViewController.swift
//  TossClone
//
//  Created by 김남건 on 2022/07/10.
//

import UIKit

class HomeViewController: UIViewController {
    let logoButton: UIButton = {
        let logoImage = UIImage(named: "Logo")
        let button = UIButton()

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(logoImage, for: .normal)

        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 123),
            button.heightAnchor.constraint(equalToConstant: 44)
        ])

        return button
    }()

    let chatButton: UIButton = {
        let chatImageConfig = UIImage.SymbolConfiguration(pointSize: 24)
        let chatImage = UIImage(systemName: "message.fill", withConfiguration: chatImageConfig)
        let button = UIButton()
        button.tintColor = .systemGray

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(chatImage, for: .normal)

        return button
    }()

    let notificationButton: UIButton = {
        let notificationImageConfig = UIImage.SymbolConfiguration(pointSize: 24)
        let notificationImage = UIImage(systemName: "bell.fill", withConfiguration: notificationImageConfig)
        let button = UIButton()
        button.tintColor = .systemGray

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(notificationImage, for: .normal)

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
}

extension HomeViewController {
    private func layout() {

    }
}

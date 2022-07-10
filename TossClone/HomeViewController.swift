//
//  HomeViewController.swift
//  TossClone
//
//  Created by 김남건 on 2022/07/10.
//

import UIKit

extension UIButton {
    static func withSystemImage(systemName: String, fontSize: CGFloat) -> UIButton {
        let imageConfig = UIImage.SymbolConfiguration(pointSize: fontSize)
        let image = UIImage(systemName: systemName, withConfiguration: imageConfig)

        let button = UIButton()
        button.tintColor = .systemGray

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)

        return button
    }
}

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

    let chatButton = UIButton.withSystemImage(systemName: "message.fill", fontSize: 24)
    let notificationButton = UIButton.withSystemImage(systemName: "bell.fill", fontSize: 24)

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
}

extension HomeViewController {
    private func layout() {

    }
}

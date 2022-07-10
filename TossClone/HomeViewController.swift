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

    let chatButton = UIButton.withSystemImage(systemName: "message.fill", fontSize: 22)
    let notificationButton = UIButton.withSystemImage(systemName: "bell.fill", fontSize: 22)

    var navigationBar: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
}

extension HomeViewController {
    private func layout() {
        constructNavigationBar()
    }

    private func constructNavigationBar() {
        navigationBar = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 91))
        navigationBar.addSubview(logoButton)

        NSLayoutConstraint.activate([
            logoButton.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            logoButton.leadingAnchor.constraint(equalToSystemSpacingAfter: navigationBar.leadingAnchor, multiplier: 1)
        ])

        let buttonsStack = UIStackView()
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        buttonsStack.axis = .horizontal
        buttonsStack.spacing = 29

        buttonsStack.addArrangedSubview(chatButton)
        buttonsStack.addArrangedSubview(notificationButton)

        navigationBar.addSubview(buttonsStack)

        NSLayoutConstraint.activate([
            navigationBar.trailingAnchor.constraint(equalToSystemSpacingAfter: buttonsStack.trailingAnchor, multiplier: 26 / 8),
            navigationBar.bottomAnchor.constraint(equalToSystemSpacingBelow: buttonsStack.bottomAnchor, multiplier: 11 / 8)
        ])
        view.addSubview(navigationBar)
    }
}

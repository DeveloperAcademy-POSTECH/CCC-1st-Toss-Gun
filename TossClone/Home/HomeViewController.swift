//
//  HomeViewController.swift
//  TossClone
//
//  Created by 김남건 on 2022/07/04.
//

import UIKit

class HomeViewController: UIViewController {
    let homeView = HomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

// MARK: - Overall style and layout
extension HomeViewController {
    private func style() {
        homeView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray4
    }

    private func layout() {
        view.addSubview(homeView)

        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: homeView.trailingAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        _ = getNavigationBar()
    }
}

// MARK: - Navigation Bar
extension HomeViewController {
    private func getNavigationBar() -> UIView {
        let navigationBar = UIView()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.backgroundColor = UIColor.systemGray4.withAlphaComponent(0.5)

        view.addSubview(navigationBar)

        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.topAnchor),
            navigationBar.bottomAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 91 / 8),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        return navigationBar
    }

    private func getLogoButton() -> UIButton {
        let image = UIImage(named: "TossLogo")
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 123, height: 44))
        button.setImage(image, for: .normal)
        button.contentMode = .scaleAspectFit

        return button
    }

    private func getChatButton() -> UIButton {
        let image = UIImage(systemName: "message.fill")
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 21, height: 22))
        button.setImage(image, for: .normal)
        button.contentMode = .scaleAspectFit
        button.tintColor = .systemGray

        return button
    }

    private func getNotificationButton() -> UIButton {
        let image = UIImage(systemName: "bell.fill")
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 19, height: 22))
        button.setImage(image, for: .normal)
        button.contentMode = .scaleAspectFit
        button.tintColor = .systemGray

        return button
    }
}

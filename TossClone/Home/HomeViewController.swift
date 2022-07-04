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

        let itemsStack = getStackView()
        navigationBar.addSubview(itemsStack)

        NSLayoutConstraint.activate([
            itemsStack.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 47 / 8),
            itemsStack.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            itemsStack.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: itemsStack.trailingAnchor, multiplier: 26 / 8)
        ])

        return navigationBar
    }

    private func getLogoButton() -> UIButton {
        let image = UIImage(named: "TossLogo")
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.contentMode = .scaleAspectFit

        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 123),
            button.heightAnchor.constraint(equalToConstant: 44)
        ])

        return button
    }

    private func getChatButton() -> UIButton {
        let image = UIImage(systemName: "message.fill")
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.contentMode = .scaleAspectFit
        button.tintColor = .systemGray

        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 21),
            button.heightAnchor.constraint(equalToConstant: 22)
        ])

        return button
    }

    private func getNotificationButton() -> UIButton {
        let image = UIImage(systemName: "bell.fill")
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.contentMode = .scaleAspectFit
        button.tintColor = .systemGray

        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 19),
            button.heightAnchor.constraint(equalToConstant: 22)
        ])

        return button
    }

    private func getStackView() -> UIStackView {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 29

        let logoButton = getLogoButton()
        let chatButton = getChatButton()
        let notificationButton = getNotificationButton()

        let spacer = UIView()
        spacer.translatesAutoresizingMaskIntoConstraints = false
        let spacerWidth = view.frame.width - logoButton.frame.width - chatButton.frame.width - notificationButton.frame.width - 34 - stack.spacing * 3

        NSLayoutConstraint.activate([
            spacer.widthAnchor.constraint(equalToConstant: spacerWidth)
        ])

        stack.addArrangedSubview(logoButton)
        stack.addArrangedSubview(spacer)
        stack.addArrangedSubview(chatButton)
        stack.addArrangedSubview(notificationButton)

        return stack
    }
}

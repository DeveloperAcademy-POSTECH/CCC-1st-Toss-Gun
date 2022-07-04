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

extension HomeViewController {
    private func style() {
        homeView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func layout() {
        view.addSubview(homeView)

        NSLayoutConstraint.activate([
            homeView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: homeView.trailingAnchor)
        ])
    }
}

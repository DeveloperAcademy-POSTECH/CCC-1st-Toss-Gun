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
    }
}

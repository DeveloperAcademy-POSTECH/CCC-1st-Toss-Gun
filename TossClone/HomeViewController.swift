//
//  HomeViewController.swift
//  TossClone
//
//  Created by 김남건 on 2022/07/10.
//

import UIKit

class HomeViewController: UIViewController {
    let contentWidth = UIScreen.main.bounds.width - 30
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
    let tossBankButton = UIButton.ofSectionHeader(sectionName: "토스뱅크", isAlone: true)
    var scrollView: UIScrollView!
    var sectionsStack: UIStackView!
    let assetSectionHeaderButton = UIButton.ofSectionHeader(sectionName: "자산", isAlone: false)
    var assetsSectionStack: UIStackView!

    let normalAccounts = [
        Account(bank: .toss, name: "토스뱅크 계좌", balance: 2, isWithdrawable: true),
        Account(bank: .kakao, name: "카카오뱅크 계좌", balance: 10000, isWithdrawable: true),
        Account(bank: .kbBank, name: "저축 * 주택청약종합저축", balance: 200000, isWithdrawable: false)
    ]

    let etcAccounts = [
        Account(bank: .toss, name: "투자 * 토스증권", balance: 0, isWithdrawable: true),
        Account(bank: .toss, name: "포인트, 머니 2개", balance: 3000, isWithdrawable: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(named: "TossTertiary")
        layout()
    }
}

extension HomeViewController {
    private func layout() {
        constructNavigationBar()
        constructContents()
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

    private func constructContents() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        constructSections()
    }

    private func constructSections() {
        sectionsStack = UIStackView()
        sectionsStack.translatesAutoresizingMaskIntoConstraints = false
        sectionsStack.axis = .vertical
        sectionsStack.spacing = 11

        scrollView.addSubview(sectionsStack)
        NSLayoutConstraint.activate([
            sectionsStack.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 16),
            sectionsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        addTossBankButton()
        addAssetsSection()
    }
}

// MARK: - Assets Section
extension HomeViewController {
    private func addTossBankButton() {
        sectionsStack.addArrangedSubview(tossBankButton)
        tossBankButton.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
    }

    private func addAssetsSection() {
        assetsSectionStack = UIStackView()
        assetsSectionStack.translatesAutoresizingMaskIntoConstraints = false
        assetsSectionStack.backgroundColor = .systemBackground
        assetsSectionStack.axis = .vertical
        assetsSectionStack.spacing = 0
        assetsSectionStack.layer.cornerRadius = 25
        assetsSectionStack.clipsToBounds = true

        sectionsStack.addArrangedSubview(assetsSectionStack)
        assetsSectionStack.addArrangedSubview(assetSectionHeaderButton)

        assetSectionHeaderButton.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true

        addNormalAccounts()
        addDividerView()
        addEtcAccounts()
        addBottomPaddingViewToAssets()
    }

    private func addNormalAccounts() {
        for account in normalAccounts {
            let accountView = RowContentView(account: account)
            assetsSectionStack.addArrangedSubview(accountView)

            accountView.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
        }
    }

    private func addDividerView() {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        assetsSectionStack.addArrangedSubview(container)

        NSLayoutConstraint.activate([
            container.widthAnchor.constraint(equalToConstant: contentWidth),
            container.heightAnchor.constraint(equalToConstant: 29)
        ])

        let divider = UIView()
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = UIColor(named: "TossBackground")
        container.addSubview(divider)

        NSLayoutConstraint.activate([
            divider.widthAnchor.constraint(equalTo: container.widthAnchor, constant: -50),
            divider.heightAnchor.constraint(equalToConstant: 1),
            divider.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            divider.centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])
    }

    private func addEtcAccounts() {
        for account in etcAccounts {
            let accountView = RowContentView(account: account)
            assetsSectionStack.addArrangedSubview(accountView)

            accountView.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
        }
    }

    private func addBottomPaddingViewToAssets() {
        let bottomPaddingView = UIView()
        bottomPaddingView.translatesAutoresizingMaskIntoConstraints = false

        assetsSectionStack.addArrangedSubview(bottomPaddingView)

        bottomPaddingView.heightAnchor.constraint(equalToConstant: 26).isActive = true
    }
}

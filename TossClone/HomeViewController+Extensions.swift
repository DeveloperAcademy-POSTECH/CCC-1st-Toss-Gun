//
//  HomeViewController+Extensions.swift
//  TossClone
//
//  Created by 김남건 on 2022/07/13.
//

import UIKit

// MARK: - Common
extension HomeViewController {
    func addDividerView(to stackView: UIStackView) {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(container)

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
}

// MARK: - Assets Section
extension HomeViewController {
    func addTossBankButton() {
        sectionsStack.addArrangedSubview(tossBankButton)
        tossBankButton.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
    }

    func addAssetsSection() {
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
        addDividerView(to: assetsSectionStack)
        addEtcAccounts()
        addBottomPaddingViewToAssets()
    }

    func addNormalAccounts() {
        for account in normalAccounts {
            let accountView = RowContentView(account: account)
            assetsSectionStack.addArrangedSubview(accountView)

            accountView.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
        }
    }

    func addEtcAccounts() {
        for account in etcAccounts {
            let accountView = RowContentView(account: account)
            assetsSectionStack.addArrangedSubview(accountView)

            accountView.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
        }
    }

    func addBottomPaddingViewToAssets() {
        let bottomPaddingView = UIView()
        bottomPaddingView.translatesAutoresizingMaskIntoConstraints = false

        assetsSectionStack.addArrangedSubview(bottomPaddingView)

        bottomPaddingView.heightAnchor.constraint(equalToConstant: 26).isActive = true
    }
}

// MARK: - Consumption Section
extension HomeViewController {
    func addConsumptionSection() {
        consumptionSectionStack = UIStackView()
        consumptionSectionStack.translatesAutoresizingMaskIntoConstraints = false
        consumptionSectionStack.axis = .vertical
        consumptionSectionStack.spacing = 0
        consumptionSectionStack.backgroundColor = .white
        consumptionSectionStack.layer.cornerRadius = 25
        consumptionSectionStack.clipsToBounds = true

        sectionsStack.addArrangedSubview(consumptionSectionStack)
        consumptionSectionStack.addArrangedSubview(consumptionSectionHeaderButton)

        assetSectionHeaderButton.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
        let usedContent = ConsumptionContent(name: "이번 달 쓴 금액", consumed: 90000, hasLog: true)
        consumptionSectionStack.addArrangedSubview(RowContentView(account: usedContent))

        let cardDebtContent = ConsumptionContent(name: "7월 20일 낼 카드값", consumed: 10000, hasLog: false)
        consumptionSectionStack.addArrangedSubview(RowContentView(account: cardDebtContent))
    }
}

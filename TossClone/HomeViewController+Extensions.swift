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
            let accountView = RowContentView(content: account)
            assetsSectionStack.addArrangedSubview(accountView)

            accountView.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
        }
    }

    func addEtcAccounts() {
        for account in etcAccounts {
            let accountView = RowContentView(content: account)
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
        consumptionSectionStack.addArrangedSubview(RowContentView(content: usedContent))

        let cardDebtContent = ConsumptionContent(name: "7월 20일 낼 카드값", consumed: 10000, hasLog: false)
        consumptionSectionStack.addArrangedSubview(RowContentView(content: cardDebtContent))
    }
}

// MARK: - Etc Section
extension HomeViewController {
    func addEtcSection() {
        let contentStack = UIStackView()
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        contentStack.axis = .horizontal
        contentStack.spacing = 12

        contentStack.addArrangedSubview(generateBottomSquare(subTitle: "1분 만에", mainTitle: "신용점수\n올리기"))
        contentStack.addArrangedSubview(generateBottomSquare(subTitle: "안전하게", mainTitle: "신용점수\n보기"))
        contentStack.addArrangedSubview(generateBottomSquare(subTitle: "최근", mainTitle: "내 차 시세\n조회"))
        contentStack.addArrangedSubview(generateBottomSquare(subTitle: "인기", mainTitle: "더보기"))

        let scrollView = UIScrollView()
        scrollView.addSubview(contentStack)
        scrollView.contentSize = CGSize(width: 572, height: 158)

        NSLayoutConstraint.activate([
            contentStack.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentStack.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor)
        ])

        sectionsStack.addArrangedSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.widthAnchor.constraint(equalTo: sectionsStack.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: contentStack.heightAnchor)
        ])
    }

    func generateBottomSquare(subTitle: String, mainTitle: String) -> UIView {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        container.layer.cornerRadius = 25
        container.clipsToBounds = true

        NSLayoutConstraint.activate([
            container.widthAnchor.constraint(equalToConstant: 134),
            container.heightAnchor.constraint(equalToConstant: 158)
        ])

        let subTitleLabel = UILabel()
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        subTitleLabel.textColor = .gray
        subTitleLabel.text = subTitle

        container.addSubview(subTitleLabel)

        let mainTitleLabel = UILabel()
        mainTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        mainTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        mainTitleLabel.text = mainTitle
        mainTitleLabel.numberOfLines = 2

        container.addSubview(mainTitleLabel)

        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 24),
            subTitleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 21),
            mainTitleLabel.leadingAnchor.constraint(equalTo: subTitleLabel.leadingAnchor),
            mainTitleLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 12)
        ])

        let imageView = UIImageView(image: UIImage(named: "card"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit

        container.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 32),
            imageView.heightAnchor.constraint(equalToConstant: 29),
            imageView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -19),
            imageView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -22)
        ])

        return container
    }
}

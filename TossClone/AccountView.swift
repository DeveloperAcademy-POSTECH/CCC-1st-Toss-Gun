//
//  Account.swift
//  TossClone
//
//  Created by 김남건 on 2022/07/11.
//

import Foundation
import UIKit

extension Int {
    func toFormattedString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal

        return formatter.string(from: NSNumber(value: self))!
    }
}

enum Bank: String {
    case card, ibk, kakao, kbBank, toss

    var logoImageView: UIImageView {
        let image = UIImage(named: self.rawValue)
        let logoImageView = UIImageView(image: image)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.contentMode = .scaleAspectFit

        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: 41),
            logoImageView.heightAnchor.constraint(equalToConstant: 41)
        ])
        return logoImageView
    }
}

struct Account {
    let bank: Bank
    let name: String
    let balance: Int
    let isWithdrawable: Bool
}

class AccountView: UIView {
    var account: Account
    var logoImageView: UIImageView!

    init(account: Account) {
        self.account = account
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 78).isActive = true

        configureSubviews()
    }

    private func configureSubviews() {
        let logoImageView = account.bank.logoImageView
        addSubview(logoImageView)

        NSLayoutConstraint.activate([
            logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25)
        ])

        let labelsStack = UIStackView()
        labelsStack.translatesAutoresizingMaskIntoConstraints = false
        labelsStack.axis = .vertical
        labelsStack.spacing = 8

        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        nameLabel.textColor = UIColor(named: "TossDarkGray")
        nameLabel.text = account.name
        labelsStack.addArrangedSubview(nameLabel)

        let balanceLabel = UILabel()
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        balanceLabel.text = "\(account.balance.toFormattedString()) 원"
        labelsStack.addArrangedSubview(balanceLabel)

        addSubview(labelsStack)

        NSLayoutConstraint.activate([
            labelsStack.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 15),
            labelsStack.topAnchor.constraint(equalTo: logoImageView.topAnchor, constant: 1)
        ])

        if account.isWithdrawable {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = UIColor(named: "TossTertiary")
            button.setTitle("송금", for: .normal)
            button.setTitleColor(UIColor(named: "TossDarkGray"), for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
            button.layer.cornerRadius = 5
            button.clipsToBounds = true
            addSubview(button)

            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: 53),
                button.heightAnchor.constraint(equalToConstant: 32),
                button.centerYAnchor.constraint(equalTo: centerYAnchor),
                trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: 25)
            ])
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

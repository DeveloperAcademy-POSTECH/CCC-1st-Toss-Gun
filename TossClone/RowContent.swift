//
//  RowContent.swift
//  TossClone
//
//  Created by 김남건 on 2022/07/13.
//

import UIKit

protocol RowContent {
    var logoImageString: String { get }
    var name: String { get }
    var value: Int { get }
    var buttonTitle: String? { get }
}

extension RowContent {
    var logoImageView: UIImageView {
        let image = UIImage(named: logoImageString)
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

enum Bank: String {
    case ibk, kakao, kbBank, toss
}

struct Account: RowContent {
    let bank: Bank
    let name: String
    let balance: Int
    let isWithdrawable: Bool

    var logoImageString: String {
        bank.rawValue
    }

    var value: Int {
        balance
    }

    var buttonTitle: String? {
        isWithdrawable ? "송금" : nil
    }
}

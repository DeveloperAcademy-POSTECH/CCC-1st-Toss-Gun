//
//  UIButton+Extensions.swift
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
        button.tintColor = UIColor(named: "TossSecondary")

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)

        return button
    }

    static func ofSectionHeader(sectionName: String, isAlone: Bool) -> UIButton {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = sectionName
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        container.addSubview(label)

        let imageConfig = UIImage.SymbolConfiguration(pointSize: 12)
        let chevronImage = UIImage(systemName: "chevron.right", withConfiguration: imageConfig)
        let chevronImageView = UIImageView(image: chevronImage)
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(chevronImageView)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: container.topAnchor, constant: 27),
            label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 25),
            container.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: isAlone ? 27 : 15),
            chevronImageView.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            container.trailingAnchor.constraint(equalTo: chevronImageView.trailingAnchor, constant: 25)
        ])

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .systemGray
        button.backgroundColor = UIColor(named: "TossGroupedBackground")
        button.layer.cornerRadius = isAlone ? 25 : 0
        button.clipsToBounds = true
        button.addSubview(container)

        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: button.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: button.trailingAnchor),
            container.topAnchor.constraint(equalTo: button.topAnchor),
            container.bottomAnchor.constraint(equalTo: button.bottomAnchor)
        ])

        return button
    }
}

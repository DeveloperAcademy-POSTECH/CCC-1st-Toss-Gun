//
//  HomeView.swift
//  TossClone
//
//  Created by 김남건 on 2022/07/04.
//

import UIKit

class HomeView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        // style과 layout을 분리하여 작성
        style()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(corder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        // default size 설정
        return CGSize(width: 200, height: 200)
    }
}

extension HomeView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .orange // 존재 확인을 위해 backgroundColor 설정
    }

    func layout() {

    }
}

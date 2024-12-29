//
//  NSPlainButton.swift
//  Pods
//
//  Created by Нурсултан Кабулов on 29.12.2024.

import UIKit

public class NSPlainButton: UIButton {

	public init() {
		super.init(frame: .zero)
		style()
	}

	required init?(coder: NSCoder) {
		fatalError("init coder: has not been implemented")
	}
}

extension NSPlainButton {

	func style() {
		setTitleColor(.label, for: .normal)
		titleLabel?.font = .preferredFont(forTextStyle: .caption1)
	}
}

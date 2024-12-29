//
//  NSSecondaryButton.swift
//  Pods
//
//  Created by Нурсултан Кабулов on 29.12.2024.

import UIKit

public class NSSecondaryButton: UIButton {

	enum Spacing {
		static let border: CGFloat = 1
		static let cornerRadius: CGFloat = 5
		static let height: CGFloat = 42
	}

	public init() {
		super.init(frame: .zero)
		style()
	}

	required init?(coder: NSCoder) {
		fatalError("init coder: has not been implemented")
	}
}

extension NSSecondaryButton {

	func style() {
		setTitleColor(.label, for: .normal)
		titleLabel?.font = .preferredFont(forTextStyle: .headline)
		backgroundColor = .systemBackground
		layer.cornerRadius = Spacing.cornerRadius
		layer.borderWidth = Spacing.border
		heightAnchor.constraint(equalToConstant: Spacing.height).isActive = true
	}
}

extension NSSecondaryButton {
	public func setTitle(title: String) {
		self.setTitle(title, for: .normal)
	}
}

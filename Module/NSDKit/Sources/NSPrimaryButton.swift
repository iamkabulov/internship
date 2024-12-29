//
//  NSPrimaryButton.swift
//  Pods
//
//  Created by Нурсултан Кабулов on 29.12.2024.
//

import UIKit

public class NSPrimaryButton: UIButton {

	enum Spacing {
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

extension NSPrimaryButton {

	func style() {
		translatesAutoresizingMaskIntoConstraints = false
		setTitleColor(.systemBackground, for: .normal)
		titleLabel?.font = .preferredFont(forTextStyle: .headline)
		backgroundColor = .systemPink
		layer.cornerRadius = Spacing.cornerRadius
		heightAnchor.constraint(equalToConstant: Spacing.height).isActive = true
	}
}

extension NSPrimaryButton {
	public func setTitle(title: String) {
		self.setTitle(title, for: .normal)
	}
}

//
//  PaywallView 2.swift
//  intern
//
//  Created by Нурсултан Кабулов on 27.12.2024.
//

import UIKit

final class FeaturesView: UIView {

	enum Spacing {
		static let cornerRadius: CGFloat = 5
		static let small: CGFloat = 12
		static let medium: CGFloat = 16
		static let large: CGFloat = 24
	}

	let vStackView = UIStackView()

	override init(frame: CGRect) {
		super.init(frame: frame)
		style()
		layout()
	}

	required init?(coder: NSCoder) {
		fatalError("init coder: has not been implemented")
	}
}

extension FeaturesView {

	func style() {
		translatesAutoresizingMaskIntoConstraints = false
		backgroundColor = .secondarySystemBackground
		layer.cornerRadius = Spacing.cornerRadius
		clipsToBounds = true

		vStackView.translatesAutoresizingMaskIntoConstraints = false
		vStackView.axis = .vertical
		vStackView.spacing = Spacing.small
		vStackView.clipsToBounds = true
	}

	func layout() {
		addSubview(vStackView)

		//MARK: Stack
		NSLayoutConstraint.activate([
			vStackView.topAnchor
				.constraint(equalTo: topAnchor, constant: Spacing.medium),
			vStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.medium),
			vStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacing.medium),
			vStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Spacing.medium)
		])
	}
}

extension FeaturesView {
	func setup(_ features: [Feature]) {
		features.forEach { feature in
			let iconLabelView = IconLabelView()
			iconLabelView.configure(title: feature.title, iconName: feature.iconName)
			vStackView.addArrangedSubview(iconLabelView)
		}
	}
}

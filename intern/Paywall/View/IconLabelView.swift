//
//  IconLabelView.swift
//  intern
//
//  Created by Нурсултан Кабулов on 27.12.2024.
//

import UIKit

final class IconLabelView: UIView {

	enum Spacing {
		static let small: CGFloat = 8
		static let medium: CGFloat = 16
		static let large: CGFloat = 24
		static let width: CGFloat = 21
		static let height: CGFloat = 22
	}
	
	let hStackView = UIStackView()

	let titleLabel = UILabel()
	let iconImageView = UIImageView()


	override init(frame: CGRect) {
		super.init(frame: frame)
		style()
		layout()
	}

	required init?(coder: NSCoder) {
		fatalError("init coder: has not been implemented")
	}
}

extension IconLabelView {

	func style() {
		translatesAutoresizingMaskIntoConstraints = false
		clipsToBounds = true

		hStackView.translatesAutoresizingMaskIntoConstraints = false
		hStackView.axis = .horizontal
		hStackView.alignment = .center
		hStackView.spacing = Spacing.small
		hStackView.distribution = .fill

		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.font = .preferredFont(forTextStyle: .subheadline)
		titleLabel.textColor = .label

		iconImageView.translatesAutoresizingMaskIntoConstraints = false
		iconImageView.tintColor = .label
	}

	func layout() {

		hStackView.addArrangedSubview(iconImageView)
		hStackView.addArrangedSubview(titleLabel)


		addSubview(hStackView)

		//MARK: Stack
		NSLayoutConstraint.activate([
			hStackView.topAnchor.constraint(equalTo: topAnchor),
			hStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
			hStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
			hStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])

		//MARK: Icon and title
		NSLayoutConstraint.activate([
			iconImageView.widthAnchor.constraint(equalToConstant: Spacing.width),
			iconImageView.heightAnchor.constraint(equalToConstant: Spacing.height)
		])
	}

	func configure(title: String, iconName: String) {
		self.titleLabel.text = title
		self.iconImageView.image = UIImage(systemName: iconName)
	}
}

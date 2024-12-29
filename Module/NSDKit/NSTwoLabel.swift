//
//  NSTwoLabel.swift
//  Pods
//
//  Created by Нурсултан Кабулов on 29.12.2024.
//

import UIKit

public class NSTwoLabel: UIView {

	enum Spacing {
		static let cornerRadius: CGFloat = 5
		static let small: CGFloat = 12
		static let medium: CGFloat = 16
		static let large: CGFloat = 24
	}

	let stackView = UIStackView()
	let titleLabel = UILabel()
	let subtitleLabel = UILabel()

	override init(frame: CGRect) {
		super.init(frame: frame)
		style()
		layout()
	}

	required init?(coder: NSCoder) {
		fatalError("init coder: has not been implemented")
	}
}

extension NSTwoLabel {

	func style() {
		translatesAutoresizingMaskIntoConstraints = false
		backgroundColor = .systemBackground
		layer.cornerRadius = Spacing.cornerRadius
		clipsToBounds = true

		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.alignment = .center
		stackView.spacing = Spacing.small
		stackView.distribution = .fill

		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.font = .preferredFont(forTextStyle: .largeTitle)
		titleLabel.textColor = .label

		subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
		subtitleLabel.font = .preferredFont(forTextStyle: .body)
		subtitleLabel.numberOfLines = 0
		subtitleLabel.textColor = .secondaryLabel
	}

	func layout() {
		stackView.addArrangedSubview(titleLabel)
		stackView.addArrangedSubview(subtitleLabel)

		addSubview(stackView)
		//MARK: Stack
		NSLayoutConstraint.activate([
			stackView.topAnchor
				.constraint(equalTo: topAnchor),
			stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
			stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
			stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])

		//MARK: Title and sub
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: stackView.topAnchor),
			titleLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor,constant: Spacing.medium),
			titleLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -Spacing.medium),
			subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Spacing.small),
			subtitleLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor,constant: Spacing.medium),
			subtitleLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -Spacing.medium),
		])
	}
}

extension NSTwoLabel {
	public func setup(title: String, description: String) {
		titleLabel.text = title
		subtitleLabel.text = description
	}
}

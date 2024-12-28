//
//  PaywallView.swift
//  intern
//
//  Created by Нурсултан Кабулов on 26.12.2024.
//
import UIKit

public protocol PaywallViewProtocol: AnyObject {
	var isLoading: Bool { get set }
	func setup(_ offer: Offer)
}

public class PaywallView: UIView {

	var presenter: PaywallPresenter?

	enum Spacing {
		static let border: CGFloat = 1
		static let cornerRadius: CGFloat = 5
		static let small: CGFloat = 8
		static let medium: CGFloat = 16
		static let large: CGFloat = 24
		static let buttonHeigth: CGFloat = 42
		static let inset: CGFloat = 90
		static let width: CGFloat = 256
		static let height: CGFloat = 256
	}

	let stackView = UIStackView()
	let logoImageView = UIImageView()
	let titleLabel = UILabel()
	let subtitleLabel = UILabel()

	let featureCard = FeaturesView()
	let monthlyButton = UIButton(type: .custom)
	let annualButton = UIButton(type: .custom)
	let tryFreeButton = UIButton(type: .custom)

	let loadingIndicator = UIActivityIndicatorView()


	override init(frame: CGRect) {
		super.init(frame: frame)
		style()
		layout()
	}

	required init?(coder: NSCoder) {
		fatalError("init coder: has not been implemented")
	}
}

extension PaywallView {

	func style() {
		translatesAutoresizingMaskIntoConstraints = false
		backgroundColor = .systemBackground
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

		logoImageView.translatesAutoresizingMaskIntoConstraints = false
		logoImageView.image = UIImage(named: "logo")

		featureCard.translatesAutoresizingMaskIntoConstraints = false

		monthlyButton.translatesAutoresizingMaskIntoConstraints = false
		monthlyButton.setTitleColor(.label, for: .normal)
		monthlyButton.titleLabel?.font = .preferredFont(forTextStyle: .headline)
		monthlyButton.backgroundColor = .systemBackground
		monthlyButton.layer.cornerRadius = Spacing.cornerRadius
		monthlyButton.layer.borderWidth = Spacing.border
		monthlyButton.addTarget(self, action: #selector(tryFree), for: .touchUpInside)

		annualButton.translatesAutoresizingMaskIntoConstraints = false
		annualButton.setTitleColor(.systemBackground, for: .normal)
		annualButton.titleLabel?.font = .preferredFont(forTextStyle: .headline)
		annualButton.backgroundColor = .systemPink
		annualButton.layer.cornerRadius = Spacing.cornerRadius
		annualButton.addTarget(self, action: #selector(tryFree), for: .touchUpInside)

		tryFreeButton.translatesAutoresizingMaskIntoConstraints = false
		tryFreeButton.setTitle("Try free", for: .normal)
		tryFreeButton.setTitleColor(.label, for: .normal)
		tryFreeButton.titleLabel?.font = .preferredFont(forTextStyle: .caption1)
		tryFreeButton.addTarget(self, action: #selector(tryFree), for: .touchUpInside)

		loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
	}

	func layout() {
		stackView.addSubview(titleLabel)
		stackView.addSubview(subtitleLabel)

		addSubview(logoImageView)
		addSubview(stackView)
		addSubview(featureCard)
		addSubview(monthlyButton)
		addSubview(annualButton)
		addSubview(tryFreeButton)
		addSubview(loadingIndicator)

		//MARK: Logo
		NSLayoutConstraint.activate([
			logoImageView.topAnchor
				.constraint(equalTo: topAnchor, constant: Spacing.inset),
			logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
			logoImageView.widthAnchor.constraint(equalToConstant: Spacing.width),
			logoImageView.heightAnchor.constraint(equalToConstant: Spacing.height)
		])

		//MARK: Stack
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: Spacing.small),
			stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
			stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
			stackView.heightAnchor.constraint(equalToConstant: 104)
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

		//MARK: Stack2
		NSLayoutConstraint.activate([
			featureCard.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: Spacing.medium),
			featureCard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.medium),
			featureCard.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacing.medium),
		])

		//MARK: MonthlyButton
		NSLayoutConstraint.activate([
			monthlyButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.medium),
			monthlyButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacing.medium),
			monthlyButton.heightAnchor.constraint(equalToConstant: Spacing.buttonHeigth),
			monthlyButton.bottomAnchor
				.constraint(equalTo: annualButton.topAnchor, constant: -Spacing.medium),
		])

		//MARK: AnnualButton
		NSLayoutConstraint.activate([
			annualButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.medium),
			annualButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacing.medium),
			annualButton.heightAnchor.constraint(equalToConstant: Spacing.buttonHeigth),
			annualButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Spacing.large),
		])

		//MARK: AnnualButton
		NSLayoutConstraint.activate([
			tryFreeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Spacing.small),
			tryFreeButton.trailingAnchor
				.constraint(equalTo: trailingAnchor, constant: -Spacing.medium),
		])

		NSLayoutConstraint.activate([
			loadingIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
			loadingIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
		])
	}

	@objc private func tryFree() {
		presenter?.tryFree()
	}
}

extension PaywallView {
	public func setup(_ offer: Offer) {
		titleLabel.text = offer.offerTitle
		subtitleLabel.text = offer.offerDescription
		monthlyButton.setTitle("$\(offer.monthlyPrice) 1 Month", for: .normal)
		annualButton.setTitle("\(offer.annualPrice) 1 Year", for: .normal)
		featureCard.setup(offer.features)
	}

	public func isLoaded(_ value: Bool) {
		if value {
			loadingIndicator.stopAnimating()
			loadingIndicator.isHidden = true
			logoImageView.isHidden = false
			tryFreeButton.isHidden = false
			featureCard.isHidden = false
			monthlyButton.isHidden = false
			annualButton.isHidden = false
		} else {
			loadingIndicator.startAnimating()
			loadingIndicator.isHidden = false
			logoImageView.isHidden = true
			tryFreeButton.isHidden = true
			featureCard.isHidden = true
			monthlyButton.isHidden = true
			annualButton.isHidden = true
		}
	}
}

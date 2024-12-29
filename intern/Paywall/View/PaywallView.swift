//
//  PaywallView.swift
//  intern
//
//  Created by Нурсултан Кабулов on 26.12.2024.
//
import UIKit
import NSDKit

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
		static let large: CGFloat = 32
		static let buttonHeigth: CGFloat = 42
		static let inset: CGFloat = 90
		static let width: CGFloat = 256
		static let height: CGFloat = 256
	}

	let loadingIndicator = UIActivityIndicatorView()
	let logoImageView = UIImageView()
	let twoLabel = NSTwoLabel()
	let featureCard = NSFeaturesCard()
	let monthlyButton = NSSecondaryButton()
	let annualButton = NSPrimaryButton()
	let tryFreeButton = NSPlainButton()

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

		twoLabel.translatesAutoresizingMaskIntoConstraints = false

		logoImageView.translatesAutoresizingMaskIntoConstraints = false
		logoImageView.image = UIImage(named: "logo")

		featureCard.translatesAutoresizingMaskIntoConstraints = false

		monthlyButton.translatesAutoresizingMaskIntoConstraints = false
		monthlyButton.addTarget(self, action: #selector(tryFree), for: .touchUpInside)

		annualButton.translatesAutoresizingMaskIntoConstraints = false
		annualButton.addTarget(self, action: #selector(tryFree), for: .touchUpInside)

		tryFreeButton.translatesAutoresizingMaskIntoConstraints = false
		tryFreeButton.setTitle("Try free", for: .normal)
		tryFreeButton.addTarget(self, action: #selector(tryFree), for: .touchUpInside)

		loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
	}

	func layout() {
		addSubview(logoImageView)
		addSubview(twoLabel)
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

		//MARK: TwoLabel
		NSLayoutConstraint.activate([
			twoLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: Spacing.small),
			twoLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
			twoLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
		])

		//MARK: FeatureCard
		NSLayoutConstraint.activate([
			featureCard.topAnchor.constraint(equalTo: twoLabel.bottomAnchor, constant: Spacing.medium),
			featureCard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.medium),
			featureCard.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacing.medium),
		])

		//MARK: MonthlyButton
		NSLayoutConstraint.activate([
			monthlyButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.medium),
			monthlyButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacing.medium),
			monthlyButton.bottomAnchor
				.constraint(equalTo: annualButton.topAnchor, constant: -Spacing.medium),
		])

		//MARK: AnnualButton
		NSLayoutConstraint.activate([
			annualButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.medium),
			annualButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacing.medium),
			annualButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Spacing.large),
		])

		//MARK: Try free
		NSLayoutConstraint.activate([
			tryFreeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Spacing.small),
			tryFreeButton.trailingAnchor
				.constraint(equalTo: trailingAnchor, constant: -Spacing.medium),
		])

		//MARK: LoadingIndicator
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
		twoLabel.setup(title: offer.offerTitle, description: offer.offerDescription)

		monthlyButton.setTitle(title: "$\(offer.monthlyPrice) 1 Month")
		annualButton.setTitle(title: "\(offer.annualPrice) 1 Year")

		offer.features.forEach { feature in
			featureCard.setup(title: feature.title, iconName: feature.iconName)
		}
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

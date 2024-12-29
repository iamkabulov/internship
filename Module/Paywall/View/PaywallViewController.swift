//
//  PaywallViewController.swift
//  intern
//
//  Created by Нурсултан Кабулов on 26.12.2024.
//

import UIKit
import Domain

public class PaywallViewController: UIViewController {

	var paywallView = PaywallView()
	let presenter: PaywallPresenter?
	private var _isLoading = false

	public init(presenter: PaywallPresenter) {
		self.presenter = presenter
		paywallView.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}

	public override func viewDidLoad() {
		super.viewDidLoad()
		style()
		layout()
		presenter?.fetchPaywallOffer()
		// Do any additional setup after loading the view.
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension PaywallViewController {
	private func style() {

		paywallView.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .systemBackground
	}

	private func layout() {
		view.addSubview(paywallView)
		NSLayoutConstraint.activate([
			paywallView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			paywallView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			paywallView.topAnchor.constraint(equalTo: view.topAnchor),
			paywallView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
		])
	}
}

extension PaywallViewController: PaywallViewProtocol {
	public var isLoading: Bool {
		get {
			return self._isLoading
		}
		set {
			paywallView.isLoaded(_isLoading)
			self._isLoading = newValue
		}
	}

	public func setup(_ offer: Offer) {
		paywallView.setup(offer)
	}
}

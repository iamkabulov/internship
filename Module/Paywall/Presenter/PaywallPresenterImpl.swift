//
//  PaywallPresenter.swift
//  intern
//
//  Created by Нурсултан Кабулов on 27.12.2024.
//
import UIKit
import Domain

public protocol PaywallNavigationDelegate: AnyObject {
	func tryFree()
}

public class PaywallPresenterImpl: PaywallPresenter {

	public weak var view: PaywallViewProtocol?
	public weak var navigation: PaywallNavigationDelegate?
	private let provider: PaywallProviderProtocol

	public init(dependency: PaywallDependency) {
		self.provider = dependency.provider
		self.navigation = dependency.paywallNavigation
	}

	public func tryFree() {
		navigation?.tryFree()
	}


	public func fetchPaywallOffer() {
		self.view?.isLoading = true
		provider.fetchOffer { [weak self] result in
			guard let self else { return }
			switch result {
			case .success(let offer):
				self.view?.isLoading = false
				self.view?.setup(offer)
			case .failure:
				print("Error fetching paywall offer")
			}
		}
	}

}


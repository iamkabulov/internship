//
//  Coordinator.swift
//  intern
//
//  Created by Нурсултан Кабулов on 27.12.2024.
//


import UIKit

protocol Coordinator {
	var parentCoordinator: Coordinator? { get set }
	var childCoordinator: [Coordinator] { get set }

	func start()
}

class AppCoodinator: Coordinator {

	class Dependency {
		let paywallProvider: PaywallProviderImpl
		let paywallModuleFactory: PaywallModuleFactory

		init(paywallProvider: PaywallProviderImpl,
			 paywallModuleFactory: PaywallModuleFactory) {
			self.paywallProvider = paywallProvider
			self.paywallModuleFactory = paywallModuleFactory
		}
	}

	var parentCoordinator: Coordinator?
	var childCoordinator = [Coordinator]()

	private let dependency: Dependency
	private let window: UIWindow

	init(window: UIWindow, dependency: Dependency) {
		self.window = window
		self.dependency = dependency
	}

	func start() {
		showPaywall()
	}

	func showPaywall() {
		let paywallDependency = PaywallDependency(
			provider: dependency.paywallProvider,
			paywallNavigation: self
		)
		let paywallViewController = dependency.paywallModuleFactory.createView(
			dependency: paywallDependency
		)
		window.rootViewController = paywallViewController
	}
}

extension AppCoodinator: PaywallNavigationDelegate {
	func tryFree() {
		showEmptyScreen()
	}

	func showEmptyScreen() {
		let vc = LoginViewController()
		window.rootViewController = vc
	}
}

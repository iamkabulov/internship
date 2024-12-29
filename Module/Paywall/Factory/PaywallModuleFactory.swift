//
//  PaywallModuleFactory.swift
//  intern
//
//  Created by Нурсултан Кабулов on 27.12.2024.
//


import UIKit

public class PaywallModuleFactory {
    public init() {}
    public func createView(dependency: PaywallDependency) -> UIViewController {
		let presenter = PaywallPresenterImpl(dependency: dependency)
		let viewController = PaywallViewController(presenter: presenter)
        presenter.view = viewController
		presenter.navigation = dependency.paywallNavigation
        return viewController
    }
}

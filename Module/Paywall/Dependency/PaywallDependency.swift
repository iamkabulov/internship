//
//  PaywallDependency.swift
//  intern
//
//  Created by Нурсултан Кабулов on 27.12.2024.
//
import Domain

public struct PaywallDependency {
	public let provider: PaywallProviderProtocol
    public let paywallNavigation: PaywallNavigationDelegate

	public init(
		provider: PaywallProviderProtocol,
		paywallNavigation: PaywallNavigationDelegate
	) {
        self.provider = provider
        self.paywallNavigation = paywallNavigation
    }
}

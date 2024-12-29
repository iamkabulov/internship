//
//  PaywallDependency.swift
//  intern
//
//  Created by Нурсултан Кабулов on 27.12.2024.
//
import Configuration

public struct PaywallDependency {
    public let provider: PaywallProviderImpl
    public let paywallNavigation: PaywallNavigationDelegate

    public init(provider: PaywallProviderImpl, paywallNavigation: PaywallNavigationDelegate) {
        self.provider = provider
        self.paywallNavigation = paywallNavigation
    }
}

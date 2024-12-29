//
//  PaywallProviderProtocol.swift
//  intern
//
//  Created by Нурсултан Кабулов on 28.12.2024.
//


public protocol PaywallProviderProtocol {
	func fetchOffer(completion: @escaping (Result<Offer, Error>) -> Void)
}

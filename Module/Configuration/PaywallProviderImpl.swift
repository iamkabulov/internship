//
//  PaywallProvider.swift
//  intern
//
//  Created by Нурсултан Кабулов on 27.12.2024.
//
import Domain

public class PaywallProviderImpl {
	public let storage: Storage

	public init(storage: Storage) {
		self.storage = storage
	}
}

extension PaywallProviderImpl: PaywallProviderProtocol {
	public func fetchOffer(completion: @escaping (Result<Offer, Error>) -> Void) {
		DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			completion(.success(self.storage.getOfferFromStorage()))
		}
	}
}

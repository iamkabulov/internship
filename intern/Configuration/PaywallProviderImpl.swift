//
//  PaywallProvider.swift
//  intern
//
//  Created by Нурсултан Кабулов on 27.12.2024.
//
import Foundation

public class PaywallProviderImpl {
	private let storage: Storage

	public init(storage: Storage) {
		self.storage = storage
	}
}

extension PaywallProviderImpl: PaywallProviderProtocol {
	public func fetchOffer(completion: @escaping (Result<Offer, Error>) -> Void) {
		DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
			completion(.success(self.storage.getOfferFromStorage()))
		}
	}
}

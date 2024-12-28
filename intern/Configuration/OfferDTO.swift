//
//  OfferDTO.swift
//  intern
//
//  Created by Нурсултан Кабулов on 29.12.2024.
//

import Foundation

struct OfferDTO: Codable {
	public let id: Int
	public let offerTitle: String
	public let offerDescription: String
	public let monthlyPrice: Double
	public let annualPrice: Double
	public let features: [FeatureDTO]

	public init(offerTitle: String,
				offerDescription: String,
				monthlyPrice: Double,
				annualPrice: Double,
				features: [FeatureDTO])
	{
		self.id = UUID().hashValue
		self.monthlyPrice = monthlyPrice
		self.annualPrice = annualPrice
		self.features = features
		self.offerTitle = offerTitle
		self.offerDescription = offerDescription
	}
}

public struct FeatureDTO: Codable {
	let title: String
	let iconName: String
}

//
//  Offer.swift
//  intern
//
//  Created by Нурсултан Кабулов on 28.12.2024.
//

import Foundation

public struct Offer {
	public let offerTitle: String
	public let offerDescription: String
	public let monthlyPrice: Double
	public let annualPrice: Double
	public let features: [Feature]

	public init(offerTitle: String,
				offerDescription: String,
				monthlyPrice: Double,
				annualPrice: Double,
				features: [Feature])
	{
		self.monthlyPrice = monthlyPrice
		self.annualPrice = annualPrice
		self.features = features
		self.offerTitle = offerTitle
		self.offerDescription = offerDescription
	}
}

public struct Feature {
	public let title: String
	public let iconName: String

	public init(title: String,
				iconName: String) {
		self.title = title
		self.iconName = iconName
	}
}

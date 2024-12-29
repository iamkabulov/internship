//
//  Mocks.swift
//  intern
//
//  Created by Нурсултан Кабулов on 28.12.2024.
//
import Domain

public struct Storage {

	public init() { }
	
	func getOfferFromStorage() -> Offer {
		let DTO = OfferDTO.getOffer()
		return Offer(offerTitle: DTO.offerTitle,
					 offerDescription: DTO.offerDescription,
					 monthlyPrice: DTO.monthlyPrice,
					 annualPrice: DTO.annualPrice,
					 features: DTO.features.map {
												Feature(title: $0.title, iconName: $0.iconName)
			}
		)
	}
}

extension OfferDTO {
	static func getOffer() -> OfferDTO {
		return OfferDTO(offerTitle: "Get Textify Premium!",
					 offerDescription: "Enjoy these benefits when you upgrade to the Premium plan.",
					 monthlyPrice: 9.99,
					 annualPrice: 98.99,
					 features: FeatureDTO.getFeature())
	}
}

extension FeatureDTO {
	static func getFeature() -> [FeatureDTO] {
		return [
			FeatureDTO(title: "Real-Time Transcription", iconName: "waveform"),
			FeatureDTO(title: "Offline Transcription", iconName: "network.slash"),
			FeatureDTO(title: "Multilingual Support", iconName: "person.badge.shield.checkmark"),
			FeatureDTO(title: "Punctuation and Formatting", iconName: "character.cursor.ibeam"),
			FeatureDTO(title: "Export Options", iconName: "square.and.arrow.up")
		]
	}
}

enum BadRequest: Error {
	case somethingWentWrong
}


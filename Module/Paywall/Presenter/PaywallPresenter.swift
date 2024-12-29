//
//  PaywallPresenter.swift
//  intern
//
//  Created by Нурсултан Кабулов on 28.12.2024.
//


public protocol PaywallPresenter {
	var view: PaywallViewProtocol? { get set }
	func fetchPaywallOffer()
	func tryFree()
}

//
//  AuthenticationManager.swift
//  intern
//
//  Created by Нурсултан Кабулов on 26.12.2024.
//
import Foundation
import FirebaseAuth

struct AuthDataResultModel {
	let uid: String
	let email: String?
	let photoUrl: String?

	init(user: User) {
		self.uid = user.uid
		self.email = user.email
		self.photoUrl = user.photoURL?.absoluteString
	}
}

final class AuthenticationManager {

	static let shared = AuthenticationManager()

	private init() {}

	func createUser(with email: String, password: String) async throws -> AuthDataResultModel {
		let authDataResult = try await FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password)
		return AuthDataResultModel(user: authDataResult.user)
	}
}

//
//  AuthenticationManager.swift
//  intern
//
//  Created by Нурсултан Кабулов on 26.12.2024.
//
import Foundation
import FirebaseAuth

public struct AuthDataResultModel {
	let uid: String
	let email: String?
	let photoUrl: String?

	public init(user: User) {
		self.uid = user.uid
		self.email = user.email
		self.photoUrl = user.photoURL?.absoluteString
	}
}

public class AuthenticationManager {

	public static let shared = AuthenticationManager()

	private init() {}

	public func createUser(with email: String, password: String) async throws -> AuthDataResultModel {
		let authDataResult = try await FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password)
		return AuthDataResultModel(user: authDataResult.user)
	}
}

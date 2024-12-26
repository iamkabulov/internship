//
//  LoginView.swift
//  intern
//
//  Created by Нурсултан Кабулов on 26.12.2024.
//

import Foundation
import UIKit


let passwordToggleButton = UIButton(type: .custom)

class LoginView: UIView {
	
	let stackView = UIStackView()
	let usernameTextfield = UITextField()
	let passwordTextfield = UITextField()
	let divider = UIView()
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		style()
		layout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init coder: has not been implemented")
	}
}

extension LoginView {
	
	func style() {
		translatesAutoresizingMaskIntoConstraints = false
		backgroundColor = .secondarySystemBackground
		layer.cornerRadius = 5
		clipsToBounds = true
		
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.spacing = 8
		usernameTextfield.translatesAutoresizingMaskIntoConstraints = false
		usernameTextfield.placeholder = "Username"
		usernameTextfield.delegate = self
		passwordTextfield.translatesAutoresizingMaskIntoConstraints = false
		passwordTextfield.placeholder = "Password"
		passwordTextfield.isSecureTextEntry = true
		passwordTextfield.delegate = self
		passwordTextfield.enablePasswordToggle()
		divider.translatesAutoresizingMaskIntoConstraints = false
		divider.backgroundColor = .secondarySystemFill
	}
	
	func layout() {
		stackView.addArrangedSubview(usernameTextfield)
		stackView.addArrangedSubview(divider)
		stackView.addArrangedSubview(passwordTextfield)
		addSubview(stackView)
		
		
		//stack
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
			stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
			trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
			bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
		])
		
		divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
		
		
	}
}

// MARK: - UITextFieldDelegate
extension LoginView: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		usernameTextfield.endEditing(true)
		passwordTextfield.endEditing(true)
		return true
	}
	
	func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
		return true
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
	}
}

extension UITextField {
	func enablePasswordToggle() {
		passwordToggleButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
		passwordToggleButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
		passwordToggleButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
		rightView = passwordToggleButton
		rightViewMode = .always
	}
	
	@objc func togglePasswordView(_ sender: Any) {
		isSecureTextEntry.toggle()
		passwordToggleButton.isSelected.toggle()
	}
}

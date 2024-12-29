//
//  ViewController.swift
//  intern
//
//  Created by Нурсултан Кабулов on 24.12.2024.
//

import UIKit
import Configuration

protocol LoginViewControllerDelegate: AnyObject {
	func didLogin()
}

class LoginViewController: UIViewController {

	let auth = AuthenticationManager.shared
	let loginView = LoginView()
	let signInButton = UIButton(type: .system)
	let errorMessagelabel = UILabel()
	let loginLabel = UILabel()

	weak var delegate: LoginViewControllerDelegate?

	var username: String? {
		return loginView.usernameTextfield.text
	}

	var password: String? {
		return loginView.passwordTextfield.text
	}

	//animation
	var leadingEdgeOnScreen: CGFloat = 16
	var leadingEdgeOffScreen: CGFloat = -1000

	var titleLeadingAnchor: NSLayoutConstraint?


	override func viewDidLoad() {
		super.viewDidLoad()
		style()
		layout()
		// Do any additional setup after loading the view.
	}

	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		signInButton.configuration?.showsActivityIndicator = false
		loginView.usernameTextfield.text = ""
		loginView.passwordTextfield.text = ""
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		animate()
	}

}

extension LoginViewController {
	private func style() {
		view.backgroundColor = .systemBackground
		loginView.translatesAutoresizingMaskIntoConstraints = false

		signInButton.translatesAutoresizingMaskIntoConstraints = false
		signInButton.configuration = .filled()
		signInButton.configuration?.imagePadding = 8
		signInButton.setTitle("Sign In", for: [])
		signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)

		errorMessagelabel.translatesAutoresizingMaskIntoConstraints = false
		errorMessagelabel.textAlignment = .center
		errorMessagelabel.textColor = .systemRed
		errorMessagelabel.numberOfLines = 0
		errorMessagelabel.isHidden = true

		loginLabel.translatesAutoresizingMaskIntoConstraints = false
		loginLabel.text = "Welcome"
		loginLabel.textAlignment = .center
		loginLabel.font = loginLabel.font.withSize(40)
		loginLabel.alpha = 0
	}

	private func layout() {

		// LoginView
		view.addSubview(loginView)
		view.addSubview(signInButton)
		view.addSubview(errorMessagelabel)
		view.addSubview(loginLabel)
		NSLayoutConstraint.activate([
			loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
			view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
		])

		// Button
		NSLayoutConstraint.activate([
			signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
			signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
			signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
		])

		// ErrorMessageLabel
		NSLayoutConstraint.activate([
			errorMessagelabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
			errorMessagelabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
			errorMessagelabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
		])

		//label
		NSLayoutConstraint.activate([
			loginView.topAnchor.constraint(equalToSystemSpacingBelow: loginLabel.bottomAnchor, multiplier: 2),
			loginLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
			loginLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
		])

		//label
		NSLayoutConstraint.activate([
			loginView.topAnchor.constraint(equalToSystemSpacingBelow: loginLabel.bottomAnchor, multiplier: 2),
			loginLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
		])

		titleLeadingAnchor = loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingEdgeOffScreen)
		titleLeadingAnchor?.isActive = true
		
	}
}

// MARK: - Actions
extension LoginViewController {
	@objc func signInTapped(sender: UIButton)  {
		errorMessagelabel.isHidden = true
		Task {
			await login()
		}
	}

	private func login() async {
		guard let username = self.username, let password = self.password else {
			assertionFailure("Username / Password should be never nil")
			return
		}

		if username.isEmpty || password.isEmpty {
			configureView(withMessage: "Username / Password cannot be blank")
			return
		}

		if !username.isEmpty && !password.isEmpty {
			signInButton.configuration?.showsActivityIndicator = true
			do {
				let result = try await auth.createUser(with: username, password: password)
				print(result)
			} catch {
				print("Error: \(error)")
			}
			delegate?.didLogin()
		} else {
			configureView(withMessage: "Incorrect username / password ")
		}
	}

	private func configureView(withMessage message: String) {
		errorMessagelabel.isHidden = false
		errorMessagelabel.text = message
		shakeButton()
	}

	private func shakeButton() {
		let animation = CAKeyframeAnimation()
		animation.keyPath = "position.x"
		animation.values = [0, 10, -10, 10, 0]
		animation.keyTimes = [0, 0.16, 0.5, 0.83, 1]
		animation.duration = 0.4

		animation.isAdditive = true
		signInButton.layer.add(animation, forKey: "shake")
	}
}

extension LoginViewController {
	private func animate() {
		let duration = 0.5
		let animator1 = UIViewPropertyAnimator(duration: duration, curve: .easeInOut) {
			self.titleLeadingAnchor?.constant = self.leadingEdgeOnScreen
			self.view.layoutIfNeeded()
		}
		animator1.startAnimation()

		let animator3 = UIViewPropertyAnimator(duration: duration * 2, curve: .easeInOut) {
			self.loginLabel.alpha = 1
			self.view.layoutIfNeeded()
		}
		animator3.startAnimation(afterDelay: 0.05)
	}
}

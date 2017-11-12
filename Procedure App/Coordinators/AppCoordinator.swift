//
//  AppCoordinator.swift
//  Procedure App
//
//  Created by Mat Nuckowski on 12/11/17.
//  Copyright © 2017 Mat Nuckowski. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator {
	private var navigationController: 		UINavigationController!
	private let window:						UIWindow
	private let dataFetcher: 				TSNetworkFetcher
	private var errorHandler: 				TSErrorHandler

	init(with window: UIWindow,
		 dataFetcher: TSNetworkFetcher,
		 errorHandler: TSErrorHandler) {

		self.window = window
		self.dataFetcher = dataFetcher
		self.errorHandler = errorHandler
		self.errorHandler.delegate = self
	}

	func start() {
		let splashViewModel = SplashViewModel.init(with: Constants.LocalizableKeys.SplashScreen.loading.localized())
		let splashVC = SplashViewController.init(with: splashViewModel)
		window.rootViewController = splashVC
		window.makeKeyAndVisible()
	}

	func showSplashScreen() {
		
	}

}

extension AppCoordinator: ErrorHandlerDelegate
{
	func showAlert(with title: String?, message: String) {
		guard let rootVC = window.rootViewController else { return }
		let alertVC = UIAlertController.init(title: title,
											 message: message,
											 preferredStyle: .alert)
		rootVC.present(alertVC,
					   animated: true,
					   completion: nil)
	}
}

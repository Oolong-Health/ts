//
//  AppCoordinator.swift
//  Procedure App
//
//  Created by Mat Nuckowski on 12/11/17.
//  Copyright © 2017 Mat Nuckowski. All rights reserved.
//

import Foundation
import UIKit

protocol SelectedProcedureDelegate: class {
	func didSelectProcedure(with id: String)
}

class AppCoordinator {
	private lazy var navigationController: UINavigationController = {
		let navigationController = UINavigationController.init(rootViewController: procedureListVC)
		return navigationController
	}()

	private let window:								UIWindow
	private let dataFetcher: 						TSNetworkFetcher
	private var errorHandler: 						TSErrorHandler
	private let procedureListVC						= ProcedureListViewController.init(nibName: nil, bundle: nil)

	init(with window: UIWindow,
		 dataFetcher: TSNetworkFetcher,
		 errorHandler: TSErrorHandler) {

		self.window = window
		self.dataFetcher = dataFetcher
		self.errorHandler = errorHandler
		self.errorHandler.delegate = self
	}

	func start() {
		showSplashScreen()
		loadProcedures()
	}

	func showSplashScreen() {
		let splashViewModel = SplashViewModel.init(with: Constants.LocalizableKeys.SplashScreen.loading.localized())
		let splashVC = SplashViewController.init(with: splashViewModel)
		window.rootViewController = splashVC
		window.makeKeyAndVisible()
	}

	func loadProcedures() {
		dataFetcher.fetchAllProcedures().then {  procedures in
			self.showProceduresScreen(with: procedures)
			} .catch { error in
				self.errorHandler.handleError(error)
		}
	}

	func showProceduresScreen(with procedures: [Procedure]) {
		window.rootViewController = navigationController
		var proceduresScreenModel = ProceduresViewModel.init(with: procedures)
		proceduresScreenModel.delegate = self
		procedureListVC.update(with: proceduresScreenModel)
	}
}

extension AppCoordinator: SelectedProcedureDelegate {
	func didSelectProcedure(with id: String) {
		print(id)
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

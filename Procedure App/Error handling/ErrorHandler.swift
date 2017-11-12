//
//  ErrorHandler.swift
//  Procedure App
//
//  Created by Mat Nuckowski on 12/11/17.
//  Copyright © 2017 Mat Nuckowski. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

protocol ErrorHandlerDelegate: class {
	func showAlert(with title: String?, message: String)
}

struct ErrorHandler: TSErrorHandler {
	weak var delegate: ErrorHandlerDelegate?

	init(with delegate: ErrorHandlerDelegate) {
		self.delegate = delegate
	}

	func handleError(_ error: Error) {
		if let error = error as? MoyaError {
			handleMoyaError(error)
		} else if let error = error as? SwiftyJSONError {
			handleSwiftyJsonError(error)
		} else if let error = error as? APIResponseError {
			handleAPIResponseError(error)
		} else {

		}
	}

	private func handleMoyaError(_ error: MoyaError) {
		debugPrint(error.localizedDescription)
		/* TODO: add logic to handle Moya errors
		Send logs to Fabric etc. */
		showGenericError()

	}

	private func handleSwiftyJsonError(_ error: SwiftyJSONError) {
		debugPrint(error.localizedDescription)
		/* TODO: add logic to handle SwiftyJSON errors
		Send logs to Fabric etc. */
		showGenericError()
	}

	private func handleAPIResponseError(_ error: APIResponseError) {
		/* TODO: add logic to handle APIResponse errors
		Send logs to Fabric etc. */
		debugPrint(error.localizedDescription)
		switch error.kind {
		case .redirectionError:
			showRedirectionError(error)
		case .clientError:
			showClientError(error)
		case .serverError:
			showServerError(error)
		default:
			showGenericError()
		}
	}

	private func handleOtherError(_ error: Error) {
		debugPrint(error.localizedDescription)
		/* TODO: add logic to handle other errors
		Send logs to Fabric etc. */
		showGenericError()
	}

	private func showGenericError() {
		delegate?.showAlert(with: Constants.LocalizableKeys.Alerts.genericErrorTitle.localized(),
							message: Constants.LocalizableKeys.Alerts.genericErrorMessage.localized())
	}
}

// MARK: HANDLING API RESPONSE ERRORS
extension ErrorHandler {
	func showRedirectionError(_ error: APIResponseError) {
		delegate?.showAlert(with: Constants.LocalizableKeys.Alerts.redirectionErrorTitle,
							message: Constants.LocalizableKeys.Alerts.genericErrorMessage)
	}

	func showClientError(_ error: APIResponseError) {
		delegate?.showAlert(with: Constants.LocalizableKeys.Alerts.clientErrorTitle,
							message: Constants.LocalizableKeys.Alerts.genericErrorMessage)

	}

	func showServerError(_ error: APIResponseError) {
		delegate?.showAlert(with: Constants.LocalizableKeys.Alerts.serverErrorTitle,
							message: Constants.LocalizableKeys.Alerts.genericErrorMessage)
	}
}

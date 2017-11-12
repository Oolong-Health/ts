//
//  ErrorHandlerTests.swift
//  Procedure AppTests
//
//  Created by Mat Nuckowski on 13/11/17.
//  Copyright © 2017 Mat Nuckowski. All rights reserved.
//

import XCTest
@testable import Procedure_App

class ErrorHandlerTests: XCTestCase {

	var errorHandler = ErrorHandler()
	var error: APIResponseError!

	override func setUp() {
        super.setUp()
		errorHandler.delegate = self
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRedirectionErrorDisplayingRightTitle() {
		error = APIResponseError.init(with: 303,
									  request: nil)
		errorHandler.handleError(error)
    }

	func testServerErrorDisplayingRightTitle() {
		error = APIResponseError.init(with: 501,
									  request: nil)
		errorHandler.handleError(error)
	}

	func testClientErrorDisplayingRightTitle() {
		error = APIResponseError.init(with: 404,
									  request: nil)
		errorHandler.handleError(error)
	}

	func testUnknownErrorDisplayingRightTitle() {
		error = APIResponseError.init(with: 199,
									  request: nil)
		errorHandler.handleError(error)
	}
}

extension ErrorHandlerTests: ErrorHandlerDelegate {
	func showAlert(with title: String?, message: String) {
		switch error.kind {
		case .redirectionError:
			XCTAssert(title == Constants.LocalizableKeys.Alerts.redirectionErrorTitle.localized(),
					  "Wrong title for a redirection error")
		case .clientError:
			XCTAssert(title == Constants.LocalizableKeys.Alerts.clientErrorTitle.localized(),
					  "Wrong title for a client error")
		case .serverError:
			XCTAssert(title == Constants.LocalizableKeys.Alerts.serverErrorTitle.localized(),
					  "Wrong title for a server error")
		case .unknownError:
			XCTAssert(title == Constants.LocalizableKeys.Alerts.genericErrorTitle.localized(),
					  "Wrong title for an unknown error")
		}
	}
}

//
//  ViewController.swift
//  Procedure App
//
//  Created by Mat Nuckowski on 11/11/17.
//  Copyright © 2017 Mat Nuckowski. All rights reserved.
//

import UIKit
import PromiseKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

//		let errorHandler = ErrorHandler.init(with: self)
//		let networkFetcher: TSNetworkFetcher = NetworkFetcher()
//
//		networkFetcher.fetchAllProcedures().then { procedures in
//			print(procedures.count)
//			} .catch { error in
//				errorHandler.handleError(error)
//		}
//
//		networkFetcher.fetchProcedureDetails(for: "procedure-DUK_ACDF").then { procedure in
//			print(procedure.phases)
//			} .catch { error in
//				errorHandler.handleError(error)
//		}


	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

extension ViewController: ErrorHandlerDelegate {
	func showAlert(with title: String?, message: String) {
		print(message)
	}
}


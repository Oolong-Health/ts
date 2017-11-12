//
//  Protocols.swift
//  Procedure App
//
//  Created by Mat Nuckowski on 12/11/17.
//  Copyright © 2017 Mat Nuckowski. All rights reserved.
//

import Foundation
import PromiseKit

protocol TSNetworkFetcher {
	func fetchAllProcedures() -> Promise<[Procedure]>
	func fetchProcedureDetails(for id: String) -> Promise<Procedure>
}

protocol TSErrorHandler {
	func handleError(_ error: Error) 
}

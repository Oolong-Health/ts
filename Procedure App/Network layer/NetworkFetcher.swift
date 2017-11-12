//
//  NetworkFetcher.swift
//  Procedure App
//
//  Created by Mat Nuckowski on 12/11/17.
//  Copyright © 2017 Mat Nuckowski. All rights reserved.
//

import Foundation
import PromiseKit
import Moya

struct NetworkFetcher: TSNetworkFetcher {

	func fetchAllProcedures() -> Promise<[Procedure]> {
		return Promise { fulfill, reject in
			NetworkAdapter.request(target: .procedures,
								   success: { (response) in
									do {
										let procedureList = try response.map(to: ProcedureList.self)
										if let list = procedureList.procedureList {
											fulfill(list)
										} else {
											reject(ParseError.init(with: .noProcedures))
										}
									} catch {
										reject(error)
									}
			}, error: { (apiResponseError) in
				reject(apiResponseError)
			}, failure: { (moyaError) in
				reject(moyaError)
			})
		}
	}

	func fetchProcedureDetails(for id: String) -> Promise<Procedure> {
		return Promise { fulfill, reject in
			NetworkAdapter.request(target: .procedureDetails(procedureID: id),
								   success: { (response) in
									do {
										let procedure = try response.map(to: Procedure.self)
										fulfill(procedure)
									} catch {
										reject(error)
									}
			}, error: { (apiResponseError) in
				reject(apiResponseError)
			}, failure: { (moyaError) in
				reject(moyaError)
			})
		}
	}
}

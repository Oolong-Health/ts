//
//  NetworkAdapter.swift
//  Procedure App
//
//  Created by Mat Nuckowski on 12/11/17.
//  Copyright © 2017 Mat Nuckowski. All rights reserved.
//

import Foundation
import Moya

struct NetworkAdapter {

	static let provider = MoyaProvider<TouchSurgeryAPI>()
	/**
	Makes a request to a specific TouchSurgery API target
	*/
	static func request(target: TouchSurgeryAPI,
						success successCallback: @escaping (Response) -> Void,
						error errorCallback: @escaping (APIResponseError) -> Void,
						failure failureCallback: @escaping (MoyaError) -> Void) {

		provider.request(target) { (result) in
			switch result {
			case .success(let response):
				if response.statusCode >= 200 && response.statusCode <= 300 {
					successCallback(response)
				} else {
					errorCallback(APIResponseError.init(with: response.statusCode,
														request: response.request))
				}
			case .failure(let error):
				failureCallback(error)
			}
		}
	}
}

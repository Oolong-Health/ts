//
//  NetworkLayer.swift
//  Procedure App
//
//  Created by Mat Nuckowski on 12/11/17.
//  Copyright © 2017 Mat Nuckowski. All rights reserved.
//

import Foundation
import Moya

enum TouchSurgeryAPI {

	case procedures
	case procedureDetails(procedureID: String)
}

extension TouchSurgeryAPI: TargetType {

	var baseURL: URL {
		guard let url = URL(string: Constants.baseURL) else {
			fatalError("Can not initialise base url!")
		}
		return url
	}

	var path: String {
		switch self {
		case .procedures:
			return Constants.Paths.procedures
		case .procedureDetails(let procedureID):
			return Constants.Paths.procedureDetails + procedureID
		}
	}

	var method: Moya.Method {
		switch self {
		case .procedures:
			return .get
		case .procedureDetails:
			return .get
		}
	}

	var headers: [String : String]? {
		return nil
	}

	var sampleData: Data {
		return Data()
	}

	var task: Task {
		return .requestPlain
	}
}

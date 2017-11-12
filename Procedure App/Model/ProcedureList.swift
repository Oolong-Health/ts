//
//  Procedures.swift
//  Procedure App
//
//  Created by Mat Nuckowski on 12/11/17.
//  Copyright © 2017 Mat Nuckowski. All rights reserved.
//

import Foundation
import Moya_SwiftyJSONMapper
import SwiftyJSON

struct ProcedureList: ALSwiftyJSONAble {

	var procedureList: [Procedure]?

	init(jsonData:JSON) {
		if let procedureList = jsonData.array {
			self.procedureList = procedures(with: procedureList)
		}
	}

	private func procedures(with procedureList: [JSON]) -> [Procedure]? {
		var procedures = [Procedure]()
		procedureList.forEach {
			procedures.append(Procedure.init(jsonData: $0))
		}
		return procedures
	}
}


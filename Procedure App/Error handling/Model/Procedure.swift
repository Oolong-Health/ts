//
//  Procedure.swift
//  Procedure App
//
//  Created by Mat Nuckowski on 12/11/17.
//  Copyright © 2017 Mat Nuckowski. All rights reserved.
//

import Foundation
import Moya_SwiftyJSONMapper
import SwiftyJSON

struct Procedure: ALSwiftyJSONAble {

	let id:		String
	let name:	String
	let icon:	URL!
	var card: 	URL?
	var phases: [Phase]?
	
	init(jsonData:JSON) {
		self.id 				= jsonData[Constants.APIKeys.Procedure.id].stringValue
		self.name 				= jsonData[Constants.APIKeys.Procedure.name].stringValue
		self.icon 				= jsonData[Constants.APIKeys.Procedure.icon].url
		self.card 				= jsonData[Constants.APIKeys.Procedure.card].url
		if let phasesArray 		= jsonData[Constants.APIKeys.Procedure.phases].array {
			self.phases 		= phases(with: phasesArray)
		}
	}

	private func phases(with jsonArray: [JSON]) -> [Phase] {
		var phases = [Phase]()
		jsonArray.forEach {
			phases.append(Phase.init(jsonData: $0))
		}
		return phases
	}
}

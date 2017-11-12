//
//  Phase.swift
//  Procedure App
//
//  Created by Mat Nuckowski on 12/11/17.
//  Copyright © 2017 Mat Nuckowski. All rights reserved.
//

import Foundation
import Moya_SwiftyJSONMapper
import SwiftyJSON

struct Phase: ALSwiftyJSONAble {
	let name: 	String
	let icon: 	URL!

	init(jsonData:JSON) {
		self.name 	= jsonData[Constants.APIKeys.Phase.name].stringValue
		self.icon 	= jsonData[Constants.APIKeys.Phase.icon].url
	}
}

//
//  Constants.swift
//  Procedure App
//
//  Created by Mat Nuckowski on 12/11/17.
//  Copyright © 2017 Mat Nuckowski. All rights reserved.
//

import Foundation

struct Constants {

	static let baseURL 					= "http://localhost:3000"

	struct Paths {
		static let procedures 			= "procedures/"
		static let procedureDetails 	= "/procedure_details/"
	}
	struct APIKeys {
		struct Procedure {
			static let id				= "id"
			static let name				= "name"
			static let icon				= "icon"
			static let phases			= "phases"
			static let card				= "card"
		}

		struct Phase {
			static let name				= "name"
			static let icon				= "icon"
		}
	}

	struct LocalizableKeys {
		struct Alerts {
			static let genericErrorTitle 			= "Generic error title"
			static let genericErrorMessage			= "Generic error message"
			static let alertPositiveButtonTitle		= "Generic positive button title"
			static let redirectionErrorTitle		= "Redirection error title"
			static let clientErrorTitle				= "Client error title"
			static let serverErrorTitle				= "Server error title"
		}
		struct SplashScreen {
			static let loading						= "Loading"
		}
	}
}

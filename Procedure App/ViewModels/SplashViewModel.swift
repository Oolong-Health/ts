//
//  SplashViewModel.swift
//  Procedure App
//
//  Created by Mat Nuckowski on 12/11/17.
//  Copyright © 2017 Mat Nuckowski. All rights reserved.
//

import Foundation

struct SplashViewModelLayout: TSLayoutProtocol { }

struct SplashViewModel: TSSplashViewModel {

	var layout: TSLayoutProtocol = SplashViewModelLayout()
	let message: String

	init(with message: String) {
		self.message = message
	}
}

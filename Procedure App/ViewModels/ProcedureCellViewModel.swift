//
//  ProcedureCellViewModel.swift
//  Procedure App
//
//  Created by Mat Nuckowski on 12/11/17.
//  Copyright © 2017 Mat Nuckowski. All rights reserved.
//

import Foundation

struct ProcedureCellViewModel: TSProcedureCellViewModel
{
	let title: String
	let iconURL: URL?

	init(with procedure: Procedure) {
		self.title = 	procedure.name
		self.iconURL = 	procedure.icon
	}
}

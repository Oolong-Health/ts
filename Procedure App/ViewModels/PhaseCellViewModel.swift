//
//  PhaseCellViewModel.swift
//  Procedure App
//
//  Created by Mat Nuckowski on 12/11/17.
//  Copyright © 2017 Mat Nuckowski. All rights reserved.
//

import Foundation

struct PhaseCellViewModel: TSProcedurePhaseCellViewModel {
	
	let title: String
	let iconURL: URL?

	init(with phase: Phase) {
		self.title = phase.name
		self.iconURL = phase.icon
	}
}

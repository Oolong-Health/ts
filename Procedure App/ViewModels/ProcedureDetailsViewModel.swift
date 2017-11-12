//
//  ProcedureDetailsViewModel.swift
//  Procedure App
//
//  Created by Mat Nuckowski on 12/11/17.
//  Copyright © 2017 Mat Nuckowski. All rights reserved.
//

import Foundation

struct ProcedureDetailsViewModel: TSProcedureDetailsViewModel
{
	var cellViewModels: [TSProcedurePhaseCellViewModel] {
		return cellModels
	}

	var procedureName: String

	var cardURL: URL?

	var title: String {
		return Constants.LocalizableKeys.ProcedureDetailsScreen.title.localized()
	}

	var phaseTitle: String {
		return Constants.LocalizableKeys.ProcedureDetailsScreen.phases.localized()
	}
	
	var cellModels: 	[PhaseCellViewModel]!

	init(with procedure: Procedure) {
		self.procedureName = procedure.name
		self.cardURL = procedure.card
		self.cellModels = cellModels(with: procedure.phases)
	}

	private func cellModels(with phases: [Phase]?) -> [PhaseCellViewModel] {
		var cellModels = [PhaseCellViewModel]()
		guard let phases = phases else { return [] }
		phases.forEach {
			cellModels.append(PhaseCellViewModel.init(with: $0))
		}
		return cellModels
	}

}

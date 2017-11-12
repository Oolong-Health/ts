//
//  ProceduresViewModel.swift
//  Procedure App
//
//  Created by Mat Nuckowski on 12/11/17.
//  Copyright © 2017 Mat Nuckowski. All rights reserved.
//

import Foundation

struct ProceduresViewModel: TSProcedureViewModel {

	var delegate: SelectedProcedureDelegate?
	var title: String {
		return Constants.LocalizableKeys.ProceduresScreen.title.localized()
	}

	var cellViewModels: [TSProcedureCellViewModel]  {
		return cellModels
	}

	let procedures:		[Procedure]
	var cellModels: 	[ProcedureCellViewModel]!

	init(with procedures: [Procedure]) {
		self.procedures = procedures
		self.cellModels = cellModels(with: procedures)
	}

	private func cellModels(with procedures: [Procedure]) -> [ProcedureCellViewModel] {
		var cellModels = [ProcedureCellViewModel]()
		procedures.forEach {
			cellModels.append(ProcedureCellViewModel.init(with: $0))
		}
		return cellModels
	}

	func didSelectRow(at indexPath: IndexPath) {
		guard indexPath.row < procedures.count else { return }
		let procedure = procedures[indexPath.row]
		delegate?.didSelectProcedure(with: procedure.id)
	}
}

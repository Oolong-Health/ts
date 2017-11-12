//
//  Protocols.swift
//  Procedure App
//
//  Created by Mat Nuckowski on 12/11/17.
//  Copyright © 2017 Mat Nuckowski. All rights reserved.
//

import Foundation
import PromiseKit

protocol TSNetworkFetcher {
	func fetchAllProcedures() -> Promise<[Procedure]>
	func fetchProcedureDetails(for id: String) -> Promise<Procedure>
}

protocol TSErrorHandler {
	var delegate: ErrorHandlerDelegate? { get set }
	func handleError(_ error: Error) 
}

protocol TSSplashViewModel {
	var message: String { get }
	var layout: TSLayoutProtocol { get }
}

protocol TSProcedureViewModel {
	var title: String { get }
	var cellViewModels: [TSProcedureCellViewModel] { get }
	func didSelectRow(at indexPath: IndexPath)
}

protocol TSProcedureCellViewModel {
	var title: String { get }
	var iconURL: URL? { get }
}

protocol TSProcedureDetailsViewModel {
	var title: String { get }
	var phaseTitle: String { get }
	var procedureName: String { get }
	var cardURL: URL? { get }
	var cellViewModels: [TSProcedurePhaseCellViewModel] { get }
}

protocol TSProcedurePhaseCellViewModel {
	var title: String { get }
	var iconURL: URL? { get }
}

protocol TSLayoutProtocol { }

extension TSLayoutProtocol {
	var topMargin: CGFloat {
		return 20
	}

	var bottomMargin: CGFloat {
		return -20
	}

	var leadingMargin: CGFloat {
		return 20
	}

	var trailingMargin: CGFloat {
		return -20
	}

	var spacingH: CGFloat {
		return 40
	}

	var spacingV: CGFloat {
		return 40
	}
}

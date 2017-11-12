//
//  Errors.swift
//  Procedure App
//
//  Created by Mat Nuckowski on 12/11/17.
//  Copyright © 2017 Mat Nuckowski. All rights reserved.
//

import Foundation

struct APIResponseError: Error {
	enum ErrorKind {
		case redirectionError
		case clientError
		case serverError
		case unknownError
	}

	let statusCode	: Int
	let request		: URLRequest?
	let kind		: ErrorKind

	init(with statusCode: Int, request: URLRequest?) {
		self.statusCode = statusCode
		self.request = request
		if statusCode >= 300 && statusCode <= 300 {
			self.kind = .redirectionError
		} else if statusCode >= 400 && statusCode <= 500 {
			self.kind = .clientError
		} else if statusCode >= 500 {
			self.kind = .serverError
		} else {
			self.kind = .unknownError
		}
	}
}

struct ParseError: Error {
	enum ErrorKind {
		case noProcedures
	}

	let kind: ErrorKind

	init(with kind: ErrorKind) {
		self.kind = kind
	}
}

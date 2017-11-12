//
//  Utils.swift
//  Procedure App
//
//  Created by Mat Nuckowski on 12/11/17.
//  Copyright © 2017 Mat Nuckowski. All rights reserved.
//

import Foundation
import UIKit

extension String {

	func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
		return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
	}
}

extension UIApplication {
	class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
		if let nav = base as? UINavigationController {
			return topViewController(base: nav.visibleViewController)
		}
		if let tab = base as? UITabBarController {
			if let selected = tab.selectedViewController {
				return topViewController(base: selected)
			}
		}
		if let presented = base?.presentedViewController {
			return topViewController(base: presented)
		}
		return base
	}
}

extension UIColor {
	convenience init(hex: Int) {
		let components = (
			R: CGFloat((hex >> 16) & 0xff) / 255,
			G: CGFloat((hex >> 08) & 0xff) / 255,
			B: CGFloat((hex >> 00) & 0xff) / 255
		)
		self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
	}
}

extension UIColor {
	static func touchSurgeryColor() -> UIColor {
		return UIColor.init(hex: 0x32C8D7)
	}
}

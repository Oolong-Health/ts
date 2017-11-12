//
//  SplashViewController.swift
//  Procedure App
//
//  Created by Mat Nuckowski on 12/11/17.
//  Copyright © 2017 Mat Nuckowski. All rights reserved.
//

import UIKit
import SnapKit

class SplashViewController: UIViewController {

	let logoImageView 	= UIImageView()
	let loadingLabel	= UILabel()
	let spinner 		= UIActivityIndicatorView.init(activityIndicatorStyle: .white)
	let model: TSSplashViewModel

	init(with model: TSSplashViewModel) {
		self.model = model
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		setupUI()
    }

	private func setupUI() {
		view.backgroundColor = UIColor.touchSurgeryColor()
		setupLogo(in: view)
		setupLoadingLabel(in: view,
						  with: model.message)
		setupSpinner(in: view)
	}

	private func setupLogo(in view: UIView) {
		logoImageView.image = #imageLiteral(resourceName: "logo")
		logoImageView.contentMode = .scaleAspectFit
		view.addSubview(logoImageView)
		logoImageView.snp.makeConstraints { (make) in
			make.center.equalToSuperview()
		}
	}

	private func setupLoadingLabel(in view: UIView, with text: String?) {
		loadingLabel.textColor = .white
		loadingLabel.textAlignment = .center
		loadingLabel.text = text
		view.addSubview(loadingLabel)
		loadingLabel.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(logoImageView.snp.bottom).offset(model.layout.spacingV)
		}
	}

	private func setupSpinner(in view: UIView) {
		view.addSubview(spinner)
		spinner.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(loadingLabel.snp.bottom).offset(model.layout.spacingV)
		}
		spinner.startAnimating()
	}
}

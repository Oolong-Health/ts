//
//  PhaseCollectionViewCell.swift
//  Procedure App
//
//  Created by Mat Nuckowski on 12/11/17.
//  Copyright © 2017 Mat Nuckowski. All rights reserved.
//

import UIKit

struct PhaseCollectionViewLayout: TSLayoutProtocol {
	var iconHeight = 130
}

class PhaseCollectionViewCell: UICollectionViewCell {
	let titleLabel 		= UILabel()
	let iconImageView	= UIImageView()
	let layout			= TSProcedureCellLayout()

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.setupUI()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func awakeFromNib() {
		super.awakeFromNib()
	}

	private func setupUI() {
		self.backgroundColor = .white
		setupIconImage(in: contentView)
		setupTitleLable(in: contentView)
	}

	private func setupTitleLable(in view: UIView) {
		titleLabel.font = UIFont.systemFont(ofSize: 14,
											weight: .thin)
		titleLabel.numberOfLines = 2
		titleLabel.textAlignment = .center
		titleLabel.textColor = .darkGray
		view.addSubview(titleLabel)
		titleLabel.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.trailing.equalToSuperview().offset(layout.trailingMargin)
			make.leading.equalToSuperview().offset(layout.leadingMargin)
			make.bottom.equalToSuperview().offset(layout.bottomMargin)
		}
	}

	private func setupIconImage(in view: UIView) {
		iconImageView.contentMode = .scaleAspectFill
		iconImageView.tintColor = UIColor.touchSurgeryColor()
		view.addSubview(iconImageView)
		iconImageView.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalToSuperview().offset(layout.topMargin)
			make.height.equalTo(layout.iconHeight)
		}
	}

	func update(with model: TSProcedurePhaseCellViewModel) {
		titleLabel.text = model.title

		let placeholder = #imageLiteral(resourceName: "placeholder").withRenderingMode(.alwaysTemplate)
		guard let iconURL = model.iconURL else {
			iconImageView.image = placeholder
			return
		}
		iconImageView.af_setImage(withURL: iconURL,
								  placeholderImage: placeholder)

	}
    
}

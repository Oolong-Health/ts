//
//  ProcedureTableViewCell.swift
//  Procedure App
//
//  Created by Mat Nuckowski on 12/11/17.
//  Copyright © 2017 Mat Nuckowski. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire
import AlamofireImage

struct TSProcedureCellLayout: TSLayoutProtocol {
	let iconHeight: CGFloat = 50
}

class ProcedureTableViewCell: UITableViewCell {

	let titleLabel 		= UILabel()
	let iconImageView	= UIImageView()
	let layout			= TSProcedureCellLayout()

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style,
				   reuseIdentifier: reuseIdentifier)
		self.setupUI()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

	private func setupUI() {
		setupIconImage(in: contentView)
		setupTitleLable(in: contentView)
	}

	private func setupTitleLable(in view: UIView) {
		titleLabel.font = UIFont.systemFont(ofSize: 14,
											weight: .thin)
		titleLabel.textColor = .darkGray
		view.addSubview(titleLabel)
		titleLabel.snp.makeConstraints { (make) in
			make.centerY.equalToSuperview()
			make.leading.equalToSuperview().offset(layout.leadingMargin)
		}
	}

	private func setupIconImage(in view: UIView) {
		iconImageView.contentMode = .scaleAspectFit
		view.addSubview(iconImageView)
		iconImageView.snp.makeConstraints { (make) in
			make.centerY.equalToSuperview()
			make.trailing.equalToSuperview().offset(layout.trailingMargin)
			make.height.equalTo(layout.iconHeight)
		}
	}

	func update(with model: TSProcedureCellViewModel) {
		titleLabel.text = model.title

		let placeholder = #imageLiteral(resourceName: "placeholder")
		guard let iconURL = model.iconURL else {
			iconImageView.image = placeholder
			return
		}
		iconImageView.af_setImage(withURL: iconURL,
								  placeholderImage: placeholder)

	}
}

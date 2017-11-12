//
//  ProcedureDetailsViewController.swift
//  Procedure App
//
//  Created by Mat Nuckowski on 12/11/17.
//  Copyright © 2017 Mat Nuckowski. All rights reserved.
//

import UIKit
import UPCarouselFlowLayout

struct ProcedureDetailsViewLayout: TSLayoutProtocol {
	var cellWidht: CGFloat {
		return 250
	}

	var cellHeight: CGFloat {
		return 200
	}
}

class ProcedureDetailsViewController: UIViewController {

	let procedureNameLabel = UILabel()
	let cardImageView = UIImageView()
	let spinner = UIActivityIndicatorView.init(activityIndicatorStyle: .gray)
	let phasesLabel = UILabel()
	let layout = ProcedureDetailsViewLayout()
	var model: TSProcedureDetailsViewModel?
	let cellIdentifier = "phase cell"
	lazy var collectionView:  UICollectionView = {
		let layout = UPCarouselFlowLayout()
		layout.itemSize = CGSize.init(width: self.layout.cellWidht,
									  height:self.layout.cellHeight)
		layout.scrollDirection = .horizontal
		return UICollectionView.init(frame: CGRect.zero,
									 collectionViewLayout: layout)
	}()

	public func update(model: TSProcedureDetailsViewModel) {
		self.model = model
		updateUI()
	}

	override func viewDidLoad() {
        super.viewDidLoad()
		setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	public func startLoading() {
		spinner.isHidden = false
		spinner.startAnimating()
	}

	public func stopLoading() {
		spinner.stopAnimating()
		spinner.isHidden = true
	}

	private func setupUI() {
		view.backgroundColor = .white
		setupProcedureLabel(in: view)
		setupCardImageView(in: view)
		setupCollectionView(in: view)
		setupPhasesLabel(in: view)
		setupSpinner(in: view)
	}

	private func updateUI() {
		stopLoading()
		guard let model = model else { return }
		title = model.title
		procedureNameLabel.text = model.procedureName
		phasesLabel.text = model.phaseTitle
		updateCardImage(with: model.cardURL)
		collectionView.reloadData()
	}

	private func updateCardImage(with cardURL: URL?) {
		let placeholder = #imageLiteral(resourceName: "placeholder")
		guard let cardURL = cardURL else {
			cardImageView.image = placeholder
			return
		}
		cardImageView.af_setImage(withURL: cardURL,
								  placeholderImage: placeholder)
	}

	private func setupProcedureLabel(in view: UIView) {
		procedureNameLabel.textAlignment = .center
		procedureNameLabel.font = UIFont.systemFont(ofSize: 25, weight: .thin)
		procedureNameLabel.numberOfLines = 0
		view.addSubview(procedureNameLabel)
		procedureNameLabel.snp.makeConstraints { (make) in
			make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(layout.topMargin)
			make.leading.equalToSuperview().offset(layout.leadingMargin)
			make.trailing.equalToSuperview().offset(layout.trailingMargin)
		}
	}

	private func setupPhasesLabel(in view: UIView) {
		phasesLabel.textAlignment = .center
		phasesLabel.font = UIFont.systemFont(ofSize: 17, weight: .thin)
		view.addSubview(phasesLabel)
		phasesLabel.snp.makeConstraints { (make) in
			make.bottom.equalTo(collectionView.snp.top).offset(-layout.spacingV)
			make.leading.equalToSuperview().offset(layout.leadingMargin)
			make.trailing.equalToSuperview().offset(layout.trailingMargin)
		}
	}

	private func setupCardImageView(in view: UIView) {
		cardImageView.contentMode = .scaleAspectFit
		view.addSubview(cardImageView)
		cardImageView.snp.makeConstraints { (make) in
			make.leading.trailingMargin.equalTo(procedureNameLabel)
			make.top.equalTo(procedureNameLabel.snp.bottom).offset(layout.spacingV)
		}
	}

	private func setupSpinner(in view: UIView) {
		view.addSubview(spinner)
		spinner.snp.makeConstraints { (make) in
			make.center.equalToSuperview()
		}
	}

	private func setupCollectionView(in view: UIView) {
		collectionView.backgroundColor = .white
		view.addSubview(collectionView)
		collectionView.dataSource = self
		collectionView.register(PhaseCollectionViewCell.self,
								forCellWithReuseIdentifier: cellIdentifier)
		collectionView.snp.makeConstraints { (make) in
			make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
			make.leading.trailing.equalToSuperview()
			make.height.equalTo(layout.cellHeight)
		}
	}
}

extension ProcedureDetailsViewController: UICollectionViewDataSource {
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		guard let model = model else { return 0 }
		return model.cellViewModels.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier,
															for: indexPath) as? PhaseCollectionViewCell,
		let model = model else {
			fatalError("Can't init a collection cell")
		}

		cell.update(with: model.cellViewModels[indexPath.item])
		return cell
	}
}

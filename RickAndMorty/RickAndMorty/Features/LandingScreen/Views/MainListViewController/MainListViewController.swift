//
//  MainListViewController.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 21/10/2024.
//

import UIKit
import SwiftUI

class MainListViewController: UIViewController {
	let viewModel: MainListViewModelProtocol
	var onAction: ((_ id: Int) -> Void?)?
	let tableView = UITableView()
	var stackView: UIStackView?

	init(onAction: ( (_ id: Int) -> Void?)? = nil) {
		self.onAction = onAction
		viewModel = MainListViewModel()
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupButtons()
		setupTableView()
		fetchData()
	}
	
	private func setupButtons() {
		var buttons = [UIButton]()
		
		for (index, element) in viewModel.buttonTitles.enumerated() {
			let button = UIButton(type: .system)
			button.setTitle(element.rawValue, for: .normal)
			button.tag = index
			button.backgroundColor = .white
			button.setTitleColor(.black, for: .normal)
			button.layer.borderWidth = 1
			button.layer.borderColor = UIColor.black.cgColor
			button.translatesAutoresizingMaskIntoConstraints = false
			button.configuration = UIButton.Configuration.plain()
			let padding: CGFloat = 10
			button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: padding, leading: padding, bottom: padding, trailing: padding)
			button.heightAnchor.constraint(equalToConstant: 40).isActive = true
			button.layer.cornerRadius = 20
			button.setContentHuggingPriority(.required, for: .horizontal)
			button.setContentCompressionResistancePriority(.required, for: .horizontal)

			button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
			buttons.append(button)
		}
		
		stackView = UIStackView(arrangedSubviews: buttons)
		guard let stackView = stackView else { return }
		stackView.axis = .horizontal
		stackView.spacing = 10
		stackView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(stackView)
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: view.topAnchor),
			stackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor),
			stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
		])
	}
	
	private func setupTableView() {
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		view.addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		
		var topAnchor: NSLayoutConstraint
		if let stackView {
			topAnchor = tableView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20)
		} else {
			topAnchor = tableView.topAnchor.constraint(equalTo: view.topAnchor)
		}
		NSLayoutConstraint.activate([
			topAnchor,
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
	
	private func fetchData() {
		Task {
			do {
				try await viewModel.fetchData(tag: nil)
				DispatchQueue.main.async {
					self.tableView.reloadData()
				}
			} catch {
				showError()
			}
		}
	}
	
	@objc func buttonTapped(_ sender: UIButton) {
		Task {
			do {
				try await viewModel.fetchData(tag: sender.tag)
				DispatchQueue.main.async {
					let indexPath = IndexPath(row: 0, section: 0)
					self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
					self.tableView.reloadData()
				}
			} catch {
				showError()
			}
		}
	}
	
	func showError() {
		let alert = UIAlertController(title: "Error", message: "error", preferredStyle: .alert)
		
		let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
		alert.addAction(okAction)
		
		let tryAction = UIAlertAction(title: "try again", style: .default) { _ in
			self.fetchData()
		}
		alert.addAction(tryAction)
		self.present(alert, animated: true, completion: nil)
	}
}


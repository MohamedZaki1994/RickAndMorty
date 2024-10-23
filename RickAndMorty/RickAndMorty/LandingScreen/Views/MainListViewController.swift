//
//  MainListViewController.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 21/10/2024.
//

import UIKit
import SwiftUI

class MainListViewController: UIViewController {
	var onAction: (() -> Void?)?
	let tableView = UITableView()
	let viewModel = MainListViewModel()
	
	init(onAction: ( () -> Void?)? = nil) {
		self.onAction = onAction
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		setupTableView()
		Task {
			try await viewModel.fetchData()
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
		}
	}
	
	func setupTableView() {
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		view.addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.topAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
}

extension MainListViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		viewModel.model?.results.count ?? 2
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.row == (viewModel.model?.results.count ?? 0) - 1 {
			Task {
				do {
					try await viewModel.fetchData()
					DispatchQueue.main.async {
						self.tableView.reloadData()
					}
				} catch {
					print("error")
				}
			}
		}
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		let model = viewModel.model?.results[indexPath.row]
		let itemModel = ItemCellModel(name: model?.name, species: model?.species, image: model?.image)
		cell.contentConfiguration = UIHostingConfiguration(content: {
			ItemCellView(model: itemModel)
		})
		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		onAction?()
	}
	
}

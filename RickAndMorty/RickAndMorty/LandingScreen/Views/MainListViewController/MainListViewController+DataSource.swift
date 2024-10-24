//
//  MainListViewController+DataSource.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 24/10/2024.
//

import UIKit
import SwiftUI

extension MainListViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		viewModel.model?.results.count ?? 2
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.row == (viewModel.model?.results.count ?? 0) - 1 {
			Task {
				do {
					try await viewModel.loadMore()
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

}

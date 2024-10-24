//
//  MainListViewController+Delegate.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 24/10/2024.
//

import UIKit

extension MainListViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let id = viewModel.model?.results[indexPath.row].id {
			onAction?(id)
		}
	}
	
}

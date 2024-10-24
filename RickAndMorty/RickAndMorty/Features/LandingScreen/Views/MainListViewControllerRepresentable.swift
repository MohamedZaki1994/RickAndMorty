//
//  MainListViewControllerRepresentable.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 22/10/2024.
//

import UIKit
import SwiftUI

struct MainListViewControllerRepresentable: UIViewControllerRepresentable {
	@Binding var characterId: Int?
	
	func makeUIViewController(context: Context) -> MainListViewController {
		let vc = MainListViewController() { id in
			context.coordinator.navigate(id: id)
		}
		return vc
	}

	func updateUIViewController(_ uiViewController: MainListViewController, context: Context) {
	}
	
	func makeCoordinator() -> Coordinator {
		Coordinator(characterId: $characterId)
	}

	class Coordinator: NSObject {
		@Binding var characterId: Int?

		init(characterId: Binding<Int?>) {
			self._characterId = characterId
		}

		@objc func navigate(id: Int) {
			characterId = id
		}
	}
}

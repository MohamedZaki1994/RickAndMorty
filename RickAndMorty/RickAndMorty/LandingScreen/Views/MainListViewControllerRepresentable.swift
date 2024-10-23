//
//  MainListViewControllerRepresentable.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 22/10/2024.
//

import UIKit
import SwiftUI

struct MainListViewControllerRepresentable: UIViewControllerRepresentable {
	@Binding var navigateToSwiftUIView: Bool
	
	func makeUIViewController(context: Context) -> MainListViewController {
		let vc = MainListViewController() {
			context.coordinator.navigate()
		}
		return vc
	}

	func updateUIViewController(_ uiViewController: MainListViewController, context: Context) {
	}
	
	func makeCoordinator() -> Coordinator {
		Coordinator(navigateToSwiftUIView: $navigateToSwiftUIView)
	}

	class Coordinator: NSObject {
		@Binding var navigateToSwiftUIView: Bool

		init(navigateToSwiftUIView: Binding<Bool>) {
			self._navigateToSwiftUIView = navigateToSwiftUIView
		}

		@objc func navigate() {
			navigateToSwiftUIView = true
		}
	}
}

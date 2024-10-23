//
//  CharacterDetailsView.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 23/10/2024.
//

import SwiftUI
import Kingfisher

struct CharacterDetailsView: View {
	@Environment(\.dismiss) var dismiss
	@State var viewModel = CharacterDetailsViewModel()
	var id: Int
	
	init(id: Int) {
		self.id = id
	}
	
	var body: some View {
		ZStack(alignment: .topLeading) {
			VStack(alignment: .leading) {
				if let image = viewModel.model?.image,
				   let url = URL(string: image) {
					KFImage.url(url)
						.placeholder {
							Image(systemName: "person")
								.resizable()
								.scaledToFit()
								.frame(maxWidth: .infinity)
						}
						.resizable()
						.scaledToFit()
						.frame(maxWidth: .infinity)
						.clipShape(.rect(cornerRadius: 10))
				} else {
					Image(systemName: "person")
						.resizable()
						.scaledToFit()
						.frame(maxWidth: .infinity)
				}
				HStack {
					Text(viewModel.model?.name ?? "")
						.font(.system(size: 24, weight: .bold))
					Text("Status \(viewModel.model?.status ?? "")")
						.font(.system(size: 18))
						.padding(10)
						.background(RoundedRectangle(cornerRadius: 10).fill(Color.cyan))
				}
				.padding()

				HStack {
					Text(viewModel.model?.species.rawValue ?? "")
						.font(.system(size: 18))
					Text("•")
					Text(viewModel.model?.gender.rawValue ?? "")
						.font(.system(size: 18, weight: .bold))
						.foregroundStyle(.gray)
				}
				.padding()

				HStack {
					Text("Location :")
						.font(.system(size: 18, weight: .bold))
					Text(viewModel.model?.location.name ?? "")
						.foregroundStyle(.gray)
				}
				.padding()

				Spacer()
			}
			
			Button {
				dismiss()
			} label: {
				Image(systemName: "arrow.left")
					.foregroundStyle(Color.black)
					.padding()
					.background(Circle().fill(Color.white))
			}
			.padding()
		}
		.toolbar(.hidden)
		.task {
			do {
				try await viewModel.fetchCharacter(id: id)
			} catch {
				print("Error")
			}
		}
	}
}

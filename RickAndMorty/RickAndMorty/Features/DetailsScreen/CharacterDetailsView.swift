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
	@State var viewModel: CharacterDetailsViewModelProtocol = CharacterDetailsViewModel()
	var id: Int
	
	init(id: Int) {
		self.id = id
	}
	
	var body: some View {
		ZStack(alignment: .topLeading) {
			VStack(alignment: .leading) {
				image
				nameSection
				speciesSection
				locationSection
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
			.padding(.top, 50)
			.padding()
		}
		.ignoresSafeArea()
		.toolbar(.hidden)
		.task {
			do {
				try await viewModel.fetchCharacter(id: id)
			} catch {
				print("Error")
			}
		}
	}
	
	@ViewBuilder private var image: some View {
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
				.clipShape(.rect(cornerRadius: 20))
		} else {
			Image(systemName: "person")
				.resizable()
				.scaledToFit()
				.frame(maxWidth: .infinity)
		}
	}
	
	@ViewBuilder var nameSection: some View {
		HStack {
			Text(viewModel.model?.name ?? "")
				.font(.system(size: 24, weight: .bold))
			Spacer()
			Text("Status \(viewModel.model?.status ?? "")")
				.font(.system(size: 18))
				.padding(10)
				.background(RoundedRectangle(cornerRadius: 10).fill(Color.cyan))
		}
		.padding(.top ,10)
		.padding(.horizontal ,10)
	}
	
	@ViewBuilder var speciesSection: some View {
		HStack {
			Text(viewModel.model?.species.rawValue ?? "")
				.font(.system(size: 18))
			Text("•")
			Text(viewModel.model?.gender.rawValue ?? "")
				.font(.system(size: 18, weight: .bold))
				.foregroundStyle(.gray)
		}
		.padding(.horizontal ,10)
	}
	
	@ViewBuilder var locationSection: some View {
		HStack {
			Text("Location :")
				.font(.system(size: 18, weight: .bold))
			Text(viewModel.model?.location.name ?? "")
				.foregroundStyle(.gray)
		}
		.padding(.horizontal, 10)
		.padding(.vertical)
	}
}

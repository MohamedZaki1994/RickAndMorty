//
//  ItemCellView.swift
//  RickAndMorty
//
//  Created by Mohamed Zaki on 22/10/2024.
//
import SwiftUI
import Kingfisher

struct ItemCellModel {
	var name: String?
	var species: Species?
	var image: String?
}


struct ItemCellView: View {
	var model: ItemCellModel
	
	var body: some View {
		HStack {
			if let image = model.image,
			   let url = URL(string: image) {
				KFImage.url(url)
					.placeholder {
						ProgressView()
							.controlSize(.extraLarge)
					}
					.resizable()
					.frame(width: 70, height: 70)
					.clipShape(.rect(cornerRadius: 10))
			} else {
				ProgressView()
			}
			VStack(alignment: .leading) {
				Text(model.name ?? "unknown")
					.font(.system(size: 24, weight: .bold))
					.padding(.bottom, 5)
				
				Text(model.species?.rawValue ?? "unknown")
					.font(.system(size: 16))
					.foregroundStyle(Color.gray)
			}
			
			Spacer()
		}
		.padding()
		.background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
	}
}

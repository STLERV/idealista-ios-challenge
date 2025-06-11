//
//  AdDetailView.swift
//  IdealistaiOSChanllenge
//
//  Created by AnnaPersonalDev on 9/6/25.
//
import SwiftUI
import CoreLocation
import SwiftUI
import CoreLocation

struct AdDetailView: View {
    @StateObject var viewModel: AdDetailViewModel

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("loadingAd")
            } else if let property = viewModel.ad {
                ScrollView {
                    VStack(spacing: 16) {
                        ImageCarouselView(imageUrls: property.images)
                            .cornerRadius(12)
                            .shadow(radius: 4)

                        HStack(alignment: .top, spacing: 16) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("\(property.extendedPropertyType) - \(property.operation)")
                                    .font(.title)
                                    .foregroundColor(.primary)

                                Text(property.priceFormatted)
                                    .font(.headline)
                                    .foregroundColor(.primary)

                                VStack(alignment: .leading, spacing: 4) {
                                    Text(String(format: "rooms".localized, property.bedrooms))
                                    Text(String(format: "bathrooms".localized, property.bathrooms))
                                    Text(String(format: "area".localized, property.area))
                                    Text("energyLabel".localized + property.energyLabel)
                                    Text("hasLift".localized + property.hasLiftText)
                                }
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            }

                            MapaConPuntoView(coordinate: property.coordinate)
                                .frame(width: 160, height: 160)
                                .cornerRadius(8)
                        }

                        Divider().padding(.vertical, 4)

                        HStack(spacing: 8) {
                            Button(action: {
                                viewModel.toggleFavoriteStatus()
                            }) {
                                Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.green)
                            }

                            Text(viewModel.favoriteLabelText())
                                .font(.headline)
                                .foregroundColor(.secondary)
                        }

                        Text(property.description)
                            .font(.caption)
                            .foregroundColor(.primary)
                            .padding(.top, 8)
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchAdDetail()
                viewModel.getIsFavorite()
            }
        }
        .background(Color(UIColor.systemGray6))
    }
}

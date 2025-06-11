//
//  LocationMapView.swift
//  IdealistaiOSChanllenge
//
//  Created by AnnaPersonalDev on 9/6/25.
//
//
//  LocationMapView.swift
//  IdealistaiOSChanllenge
//
//  Created by AnnaPersonalDev on 9/6/25.
//
import SwiftUI
import MapKit

struct MapaConPuntoView: View {
    let coordinate: CLLocationCoordinate2D

    var body: some View {
        Group {
            if #available(iOS 17.0, *) {
                ModernMapView(coordinate: coordinate)
            } else {
                ClassicMapView(coordinate: coordinate)
            }
        }
        .frame(height: 300)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

@available(iOS 17.0, *)
private struct ModernMapView: View {
    let coordinate: CLLocationCoordinate2D
    @State private var cameraPosition: MapCameraPosition

    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        _cameraPosition = State(initialValue: .region(MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )))
    }

    var body: some View {
        Map(position: $cameraPosition) {
            Marker("location", coordinate: coordinate)
        }
    }
}

private struct ClassicMapView: View {
    let coordinate: CLLocationCoordinate2D
    @State private var region: MKCoordinateRegion

    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        _region = State(initialValue: MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        ))
    }

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [MapAnnotationItem(coordinate: coordinate)]) { item in
            MapAnnotation(coordinate: item.coordinate) {
                Circle()
                    .fill(Color.red)
                    .frame(width: 12, height: 12)
            }
        }
    }
}

private struct MapAnnotationItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

//
//  MapView.swift
//  FindCorona19Center
//
//  Created by kmjmarine on 2022/04/08.
//

import SwiftUI
import MapKit

struct AnnotationItem: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    var coordination: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    @State private var annotationItems = [AnnotationItem]()
    
    var body: some View {
        Map(
            coordinateRegion: $region,
            annotationItems:  [AnnotationItem(coordinate: coordination)],
            annotationContent: {
                MapMarker(coordinate: $0.coordinate)
            }
        )
        .onAppear {
            setRegion(coordination)
            setAnnotation(coordination)
        }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    }
    
    private func setAnnotation(_ coordinate: CLLocationCoordinate2D) {
        annotationItems = [AnnotationItem(coordinate: coordinate)]
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let center0 = Center(id: 0, sido: .경기도, facilityName: "오포보건소", address: "경기도 광주시 오포읍", lat: "37.404476", lng: "126.9491998", centerType: .central, phoneNumber: "031-322-5643")
        MapView(
            coordination: CLLocationCoordinate2D(
                latitude: CLLocationDegrees(center0.lat) ?? .zero,
                longitude: CLLocationDegrees(center0.lng) ?? .zero
            )
        )
    }
}

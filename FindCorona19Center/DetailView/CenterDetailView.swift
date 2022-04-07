//
//  CenterDetailView.swift
//  FindCorona19Center
//
//  Created by kmjmarine on 2022/04/08.
//

import SwiftUI
import MapKit

struct CenterDetailView: View {
    var center: Center
    
    var body: some View {
        VStack {
            MapView(coordination: center.coordinate)
                .ignoresSafeArea(edges: .all)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            CenterRow(center: center)
        }
        .navigationTitle(center.facilityName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CenterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let center0 = Center(id: 0, sido: .경기도, facilityName: "오포보건소", address: "경기도 광주시 오포읍", lat: "37.404476", lng: "126.9491998", centerType: .central, phoneNumber: "031-322-5643")
        CenterDetailView(center: center0)
    }
}

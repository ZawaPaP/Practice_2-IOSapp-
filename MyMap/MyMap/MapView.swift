//
//  MapView.swift
//  MyMap
//
//  Created by Kazuhide Izawa on 1/1/23.
//

import SwiftUI
import MapKit

enum MapType {
    case standard
    case satelite
    case hybrid
}


struct MapView: UIViewRepresentable {
    let searchKey: String
    let mapType: MapType
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context){
        print("Search Keywords: \(searchKey)")
        
        switch mapType {
        case .standard:
            uiView.preferredConfiguration = MKStandardMapConfiguration(elevationStyle: .flat)
        case .satelite:
            uiView.preferredConfiguration = MKImageryMapConfiguration()
        case .hybrid:
            uiView.preferredConfiguration = MKHybridMapConfiguration()
        }
        
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(
            searchKey,
            completionHandler: { (placemarks, error) in
                if let placemarks,
                   let firstPlacemark = placemarks.first,
                   let location = firstPlacemark.location {
                    
                    let targetCordinate = location.coordinate
                    print("Geo: \(targetCordinate)")
                    
                    let pin = MKPointAnnotation()
                    pin.coordinate = targetCordinate
                    pin.title = searchKey
                    uiView.addAnnotation(pin)
                    uiView.region = MKCoordinateRegion(
                        center: targetCordinate,
                        latitudinalMeters: 500.0,
                        longitudinalMeters: 500.0)
                }
            })
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "Singapore", mapType: .standard)
    }
}

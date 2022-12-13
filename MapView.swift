//
//  MapView.swift
//  Gophur
//
//  Created by Zane Mroue on 08/12/2022.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: UIViewRepresentable {
    var locations: [CLLocationCoordinate2D] = []
    
    var testLocation: CLLocationCoordinate2D
    
    init() {
        testLocation = CLLocationCoordinate2D(latitude: 42.36, longitude: -71.06)
        locations = [testLocation]
    }
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true

        // Set the map view's center coordinate to the user's current location
        if let userLocation = mapView.userLocation.location {
            mapView.centerCoordinate = userLocation.coordinate
        }

        return mapView
    }


        func updateUIView(_ view: MKMapView, context: Context) {
            view.removeAnnotations(view.annotations)

            for location in locations {
                let annotation = MKPointAnnotation()
                annotation.coordinate = location
                view.addAnnotation(annotation)
            }
        }

        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }

        class Coordinator: NSObject, MKMapViewDelegate {
            var parent: MapView

            init(_ parent: MapView) {
                self.parent = parent
            }

            func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
                // Calculate the directions from the user's current location to the selected location
                guard let destination = view.annotation?.coordinate else { return }
                let directionRequest = MKDirections.Request()
                directionRequest.source = MKMapItem.forCurrentLocation()
                directionRequest.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination))
                let directions = MKDirections(request: directionRequest)
                directions.calculate { (response, error) in
                    // Handle any errors that may occur
                    if let error = error {
                        print("Error: \(error)")
                    } else {
                        // Show the calculated directions on the map
                        guard let response = response else { return }
                        let route = response.routes[0]
                        mapView.addOverlay(route.polyline)
                        mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                    }
                }
            }
        }
    }

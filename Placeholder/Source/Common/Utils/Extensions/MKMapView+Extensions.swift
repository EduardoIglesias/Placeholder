//
//  MKMapView+Extensions.swift
//  Placeholder
//
//  Created by 0015862 on 10/06/2020.
//  Copyright © 2020 Rindus. All rights reserved.
//

import MapKit

extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}

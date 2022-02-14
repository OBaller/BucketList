//
//  Location.swift
//  BucketList
//
//  Created by naseem on 14/02/2022.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

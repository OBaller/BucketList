//
//  ContentView.swift
//  BucketList
//
//  Created by naseem on 13/02/2022.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))

    func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        // just send back the first one, which ought to be the only one
        return paths[0]
    }
    
    let users = [
            User(firstName: "Arnold", lastName: "Rimmer"),
            User(firstName: "Kristine", lastName: "Kochanski"),
            User(firstName: "David", lastName: "Lister"),
    ].sorted()
    
    var body: some View {
        VStack {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String

    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

//Text("Hello World")
//    .onTapGesture {
//        let str = "Test Message"
//        let url = getDocumentsDirectory().appendingPathComponent("message.txt")
//
//        do {
//            try str.write(to: url, atomically: true, encoding: .utf8)
//            let input = try String(contentsOf: url)
//            print(input)
//        } catch {
//            print(error.localizedDescription)
//        }
//    }

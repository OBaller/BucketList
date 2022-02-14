//
//  ContentView.swift
//  BucketList
//
//  Created by naseem on 13/02/2022.
//

import SwiftUI
import MapKit
import LocalAuthentication

struct ContentView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))

    let locations = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    @State private var isUnlocked = false

    
//    func getDocumentsDirectory() -> URL {
//        // find all possible documents directories for this user
//        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//
//        // just send back the first one, which ought to be the only one
//        return paths[0]
//    }
//
//    let users = [
//            User(firstName: "Arnold", lastName: "Rimmer"),
//            User(firstName: "Kristine", lastName: "Kochanski"),
//            User(firstName: "David", lastName: "Lister"),
//    ].sorted()
    
    var body: some View {
        NavigationView {
            Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    NavigationLink {
                        Text(location.name)
                    } label: {
                        Circle()
                            .stroke(.red, lineWidth: 3)
                            .frame(width: 44, height: 44)
                    }
                }
            }
            .navigationTitle("London Explorer")
        }
        
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    // authenticated successfully
                    isUnlocked = true
                } else {
                    // there was a problem
                }
            }
        } else {
            // no biometrics
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


//VStack {
//    if isUnlocked {
//        Text("Unlocked")
//    } else {
//        Text("Locked")
//    }
//}

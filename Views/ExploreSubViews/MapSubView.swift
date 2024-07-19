//
//  Premiere vue : Carte.swift
//  PasAPas
//
//  Created by SwiftUI Developper on 25/04/2023.
//

//    ===============================CHRISTOPHER ==============================================

import SwiftUI
import CoreLocationUI
import MapKit

struct MapSubView: View {

    // MARK: VARIABLES & CONSTANTES
    
    @EnvironmentObject private var dataVM: DatasVM
    @Binding var distanceSliderValue : Double
    @Binding var timeSliderValue : Double
    @Binding var difficultySliderValue : Double
    
    
    
    // MAP
    @State private var mapRegion : MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.4832, longitude: -1.5586), span: MKCoordinateSpan(latitudeDelta: 0.18, longitudeDelta: 0.18))
    ///
    
    /// Permet de filtrer les randos sur la carte
    var filtrer: [Rando] {
        return dataVM.randos.filter({
            $0.distance <= Int(distanceSliderValue) && $0.durée <= timeSliderValue && $0.niveauRando <= difficultySliderValue
        })
    }
    
    // MARK: BODY
    var body: some View {
        ZStack (alignment: .bottomLeading) {
            Map(coordinateRegion: $mapRegion, annotationItems: filtrer) { rando in
                MapAnnotation(coordinate: rando.coordinates) {
                    MapPin(rando: rando)
                }
            }
            LocalisationButton()
            .padding()
        }
        .environmentObject(DatasVM())
    }
}

// MARK: PREVIEWS
struct Premiere_vue___Carte_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MapSubView(distanceSliderValue: .constant(0), timeSliderValue: .constant(0), difficultySliderValue: .constant(0))
                .environmentObject(DatasVM())
        }
    }
}



// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION

private struct LocalisationButton: View {
    var body: some View {
        LocationButton (.currentLocation) {
            //
        }
        .foregroundColor(Color("CustomColorBlue"))
        .font(.title3)
        .cornerRadius(50)
        .labelStyle(.iconOnly)
        .tint(Color("CustomWhite"))
//        .tint(Color(uiColor: .tertiarySystemBackground))
        
    }
}

struct MapPin: View {
    var rando : Rando
    var body: some View {
        NavigationLink {
            InfoRando(actualRando: rando)
        } label: {
            Image(systemName: "figure.walk.circle")
                .font(.title)
                .padding(5)
                .foregroundColor(Color.accentColor)
                .background(Color(uiColor: .tertiarySystemBackground))
                .cornerRadius(100)
                .shadow(radius: 5)
        }

    }
}


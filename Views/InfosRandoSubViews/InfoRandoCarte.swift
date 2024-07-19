//
//  InfoRandoCarte.swift
//  PasAPas
//
//  Created by SwiftUI Developper on 27/04/2023.
//

//    =============================== CHRISTOPHER ==============================================

import SwiftUI
import MapKit

struct InfoRandoCarte: View {

    // MARK: VARIABLES & CONSTANTES
    
    @EnvironmentObject private var dataVM: DatasVM
    var actualRando : Rando
    
    @State var startHikeButtonToggle : Bool = false
    @State var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.064416, longitude: -1.194583), span: .init(latitudeDelta: 0.018, longitudeDelta: 0.018))
    
    
    // MARK: BODY
    var body: some View {
        ZStack {
            ZStack (alignment: .bottom) {
                Map(coordinateRegion: $mapRegion, annotationItems: dataVM.convertData(Data: actualRando.LLDatas)) { llPoints in
                    MapAnnotation(coordinate: llPoints.coordinates) {
                        Circle()
                            .fill(Color.accentColor)
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
//                Map(coordinateRegion: $mapRegion, annotationItems: actualRando.pointsOfInterest) { POI in
//                    MapAnnotation(coordinate: POI.coordinates) {
//                        PointsOfInterestPin(POI: POI)
//                    }
//                }
//                ForEach(actualRando.pointsOfInterest) { POI in
//                    MapAnnotation(coordinate: POI.coordinates) {
//                        PointsOfInterestPin(POI: POI)
//                    }
//                }
                
                startHikeButton
            }
        }
        .onAppear {
            mapRegion.center = actualRando.coordinates
    }
        .fullScreenCover(isPresented: $startHikeButtonToggle) {
            FullScreenHikeInProgressSubView(actualRando: actualRando)
        }
    }
}


// MARK: PREVIEWS
struct InfoRandoCarte_Previews: PreviewProvider {
    static var previews: some View {
        InfoRandoCarte(actualRando: DatasVM().randos.first!)
            .environmentObject(DatasVM())
    }
}


// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION


extension InfoRandoCarte {
    
    var startHikeButton: some View {
        Button {
            startHikeButtonIsPressed()
        } label: {
            Text("Commencer la randonnée")
                .font(.headline)
                .padding()
                .background(Color(uiColor: .tertiarySystemBackground))
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.accentColor, lineWidth: 2)
                }
        }
        .buttonStyle(.borderless)
        .padding(.bottom)
    }
    
    func startHikeButtonIsPressed() {
        withAnimation(.spring(response: 0.6)) {
            startHikeButtonToggle.toggle()
        }
    }
}

struct PointsOfInterestPin: View {
    var POI : PointOfInterest
    var body: some View {
        Menu {
            Button {
                //
            } label: {
                VStack {
                    Label(POI.description, systemImage: POI.type == .bivouac ? "tent.circle" : POI.type == .dangers ? "exclamationmark.circle" : POI.type == .fauna ? "pawprint.circle" : POI.type == .flora ? "camera.macro.circle" : POI.type == .pointOfView ? "eye.circle" : POI.type == .waterSpot ? "drop.circle" : POI.type == .wrongWay ? "signpost.right.and.left.circle" : "")
                    Image("Rando1")
                }
            }
            
        } label: {
            Image(systemName: POI.type == .bivouac ? "tent.circle" : POI.type == .dangers ? "exclamationmark.circle" : POI.type == .fauna ? "pawprint.circle" : POI.type == .flora ? "camera.macro.circle" : POI.type == .pointOfView ? "eye.circle" : POI.type == .waterSpot ? "drop.circle" : POI.type == .wrongWay ? "signpost.right.and.left.circle" : "")
                .font(.title)
                .padding(5)
                .foregroundColor(Color.accentColor)
                .background(Material.thick)
                .cornerRadius(100)
                .shadow(radius: 5)
        }
        .menuStyle(.button)
    }
}

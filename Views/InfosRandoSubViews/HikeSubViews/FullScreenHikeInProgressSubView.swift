//
//  FullScreenHikeInProgressSubView.swift
//  PasAPasFinal
//
//  Created by SwiftUI Developper on 08/05/2023.
//

//    =============================== CHRISTOPHER ==============================================


import SwiftUI
import CoreLocation
import MapKit

struct FullScreenHikeInProgressSubView: View {
    
    // MARK: VARIABLES & CONSTANTES
    
    @EnvironmentObject private var dataVM: DatasVM
    @Environment (\.presentationMode) var presentationMode
    var actualRando : Rando
    @State var endHike : Bool = false
    @State var letsGoButtonPressed : Bool = true
    @State var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.064416, longitude: -1.194583), span: .init(latitudeDelta: 0.018, longitudeDelta: 0.018))
    
    
    // MARK: BODY
    var body: some View {
        ZStack {
            ZStack (alignment: .bottom){
                ZStack (alignment: .bottom) {
                    Map(coordinateRegion: $mapRegion, annotationItems: dataVM.convertData(Data: actualRando.LLDatas)) { llPoints in
                        MapAnnotation(coordinate: llPoints.coordinates) {
                            Circle()
                                .fill(Color.accentColor)
                        }
                    }
        //            Map(coordinateRegion: $mapRegion, annotationItems: actualRando.pointsOfInterest) { POI in
        //                MapAnnotation(coordinate: POI.coordinates) {
        //                    pointsOfInterestPin
        //                }
        //            }
                }
                .ignoresSafeArea()
        }
            VStack {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Label("Retour", systemImage: "chevron.left")
                            .padding()
                    }
                    Spacer()
                }
                Spacer()
                endHikeButton
            }
            EndOfTheHikeSubView(actualRando: actualRando)
                .offset(y: endHike ? 0 : 1000)
            StartHikeSubView(letsGoButtonPressed: $letsGoButtonPressed)
                .offset(x: letsGoButtonPressed ? -500 : 0)
        }

        .onAppear {
            withAnimation(.spring(response: 0.6).delay(1)) {
                letsGoButtonPressed = false
            }
            mapRegion.center = actualRando.coordinates
    }
    }
}


// MARK: PREVIEW
struct FullScreenHikeInProgressSubView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenHikeInProgressSubView(actualRando: DatasVM().randos.first!)
            .environmentObject(DatasVM())
    }
}



// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION


extension FullScreenHikeInProgressSubView {
    
    var endHikeButton: some View {
        Button {
            withAnimation(.spring(response: 0.6)) {
                endHikeButtonIsPressed()
            }
        } label: {
            Text("Terminer la randonnée")
                .font(.headline)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.accentColor, lineWidth: 2)
                }
        }
        .buttonStyle(.borderless)
        .padding(.bottom)
    }
    
    var pointsOfInterestPin: some View {
        
        Button {
            //
        } label: {
            Image(systemName: "eye.circle")
                .font(.headline)
                .foregroundColor(.accentColor)
                .padding(6)
                .background(
                    Circle()
                        .fill(.white)
                        .shadow(radius: 3)
                )
        }

        
        
    }
    
    func endHikeButtonIsPressed() {
        withAnimation(.spring(response: 0.6)) {
            endHike.toggle()
        }
    }
}

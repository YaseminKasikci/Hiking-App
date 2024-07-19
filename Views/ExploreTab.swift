//
//  ExploreTab.swift
//  PasAPasFinal
//
//  Created by SwiftUI Developper on 03/05/2023.
//

//    =============================== CHRISTOPHER / BILAL = ButtonFAV / ASSETOU = VU Randonnée proposé ==============================================

import SwiftUI

struct ExploreTab: View {
    
    
    // MARK: VARIABLES & CONSTANTES
    
    @EnvironmentObject private var dataVM: DatasVM
   
    // PICKER
    enum Views: String, CaseIterable, Identifiable {
        case Carte, Liste
        var id: Self { self }
    }
    @State private var selectedView: Views = .Carte
    ///
    
    @State var distanceSliderValue : Double = 105
    @State var timeSliderValue : Double = 10.5
    @State var difficultySliderValue : Double = 4
    @State var filterButtonIsPressed : Bool = false
    
    @State var famillyButton: Bool = false
    @State var friendButton: Bool = false
    @State var dogButton: Bool = false
    
    
    // MARK: BODY
    var body: some View {
        VStack (spacing: 0) {
            picker
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(uiColor: .tertiarySystemGroupedBackground))
            if selectedView == .Carte {
                ZStack (alignment: .bottomTrailing) {
                    MapSubView(distanceSliderValue: $distanceSliderValue, timeSliderValue: $timeSliderValue, difficultySliderValue: $difficultySliderValue)
                    FilterButton(filterButtonIsPressed: $filterButtonIsPressed)
                        .padding()
                }
            } else if selectedView == .Liste {
                ZStack (alignment: .bottomTrailing) {
                    ListSubView(distanceSliderValue: $distanceSliderValue, timeSliderValue: $timeSliderValue, difficultySliderValue: $difficultySliderValue, famillyButton: $famillyButton, friendButton: $friendButton, dogButton: $dogButton)
                    FilterButton(filterButtonIsPressed: $filterButtonIsPressed)
                        .padding()
                }
            }
        }
        .sheet(isPresented: $filterButtonIsPressed) {
            FiltresRandosListe(distanceSliderValue: $distanceSliderValue, timeSliderValue: $timeSliderValue, difficultySliderValue: $difficultySliderValue, famillyButton:$famillyButton, friendButton: $friendButton, dogButton: $dogButton )
        }
    }
}


// MARK: PREVIEW
struct ExploreTab_Previews: PreviewProvider {
    static var previews: some View {
        ExploreTab()
            .environmentObject(DatasVM())
    }
}


private extension ExploreTab {
    
    var picker: some View {
        Picker("Vue", selection: $selectedView){
            Text("Carte").tag(Views.Carte)
            Text("Liste").tag(Views.Liste)
        }
        .foregroundColor(.accentColor)
        .pickerStyle(.segmented)
        .padding(.horizontal)
    }
}


// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION



//FILTRES

struct FiltresRandosListe: View {
    
    @AppStorage ("first_connection") var isFirstConnection : Bool = true
    @AppStorage ("user_LoegedIn") var userIsLoged : Bool = false
    
    @Binding var distanceSliderValue : Double
    @Binding var timeSliderValue : Double
    @Binding var difficultySliderValue : Double
    
    @Binding var famillyButton: Bool
    @Binding var friendButton: Bool
    @Binding var dogButton: Bool
    
    @Environment (\.presentationMode) var presentationMode
    
    
    // MARK: BODY
    var body: some View {
        VStack {
            returnButton
            VStack (spacing: 40) {
                distanceSlider
                timeSlider
                difficultySlider
                Htags
            }
            .padding(.horizontal)
            filterButton
            Button {
                distanceSliderValue = 105
                timeSliderValue = 10.5
                difficultySliderValue = 4.0
                
                famillyButton = false
                friendButton = false
                dogButton = false
            } label: {
                Text("Réinitialiser")
            }
            .padding(.vertical)
        }
    }
}

extension FiltresRandosListe {
    
    var distanceSlider: some View {
        VStack {
            Text("Distance Max")
                .font(.headline)
            Slider(value: $distanceSliderValue, in: 0...105, step: 5) {
                Text("silder")
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("ND")
            }
            Text(distanceSliderValue < 105 ?  "\(Int(distanceSliderValue)) Km" : "Non déterminé")
                .font(.headline)
                .foregroundColor(.accentColor)
        }
    }
    
    var timeSlider: some View {
        VStack {
            Text("Temps Max")
                .font(.headline)
            Slider(value: $timeSliderValue, in: 1...10.5, step: 0.5) {
                Text("silder")
            } minimumValueLabel: {
                Text("1")
            } maximumValueLabel: {
                Text("ND")
            }
            let valeurDecimale = String(format: "%.1f", timeSliderValue)
            Text(timeSliderValue < 10.5 ? "\(valeurDecimale) Heures" : "Non déterminé")
                .font(.headline)
                .foregroundColor(.accentColor)
        }
    }
    
    var difficultySlider: some View {
        VStack {
            Text("Difficulté")
                .font(.headline)
            Slider(value: $difficultySliderValue, in: 0...4, step: 1) {
                Text("silder")
            } minimumValueLabel: {
                Text("👍🏻")
            } maximumValueLabel: {
                Text("💪🏻")
            }
            switch difficultySliderValue {
            case 0.0: Text("Facile")
                    .font(.headline)
                    .foregroundColor(.accentColor)
            case 1.0: Text("Moyen")
                    .font(.headline)
                    .foregroundColor(.accentColor)
            case 2.0: Text("Difficile")
                    .font(.headline)
                    .foregroundColor(.accentColor)
            case 3.0 : Text("Expert")
                    .font(.headline)
                    .foregroundColor(.accentColor)
            default: Text("Toutes")
                    .font(.headline)
                    .foregroundColor(.accentColor)
            }
            
            
        }
    }
    
    var Htags: some View {
        VStack {
            Text("Thématiques")
                .font(.headline)
                .padding()
            VStack {
                HStack{
                    Button {
                        difficultySliderValue = 1
                        distanceSliderValue = 10
                        timeSliderValue = 2
                        famillyButton.toggle()
                    } label: {
                        Label("En famille", systemImage: "figure.and.child.holdinghands")
                            .padding(10)
                            .foregroundColor(famillyButton ? .white : Color("AccentColor") )
                            .background(famillyButton ?Color("AccentColor") : .white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("AccentColor"), lineWidth: 2))
                    }
                    Button {
                        friendButton.toggle()
                    } label: {
                        Label("Partagée", systemImage: "person.2.fill")
                    } .padding(10)
                        .foregroundColor(friendButton ? .white : Color("AccentColor") )
                        .background(friendButton ?Color("AccentColor") : .white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("AccentColor"), lineWidth: 2))
                }
                HStack {
                    Button {
                        dogButton.toggle()
                    } label: {
                        Label("avec son chien", systemImage: "pawprint.fill")
                    }
                    .padding(10)
                    .foregroundColor(dogButton ? .white : Color("AccentColor") )
                    .background(dogButton ?Color("AccentColor") : .white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("AccentColor"), lineWidth: 2))
                }
            }
        }
    }
}

extension FiltresRandosListe {
    
    var returnButton: some View {
        HStack {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Annuler")
                    .padding()
            }
            Spacer()
        }
        .padding()
    }
    
    var filterButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Text("Appliquer")
                .font(.headline)
                .padding(.horizontal, 40)
                .padding()
        }
        .buttonStyle(.bordered)
        .padding(.vertical, 10)
    }
    
}

//
//  InfoRandoFav.swift
//  PasAPasFinal
//
//  Created by SwiftUI Developper on 05/05/2023.
//

//    =============================== BILAL ==============================================


import SwiftUI

struct InfoRandoFav: View {
    
    // MARK: VARIABLES & CONSTANTES
    
    
    @EnvironmentObject private var dataVM: DatasVM
    var actualRando : Rando
    var noteRando : Double {
        var noteRandoFinal : Double = 0
        var sommeAvis : Double = 0
        for avis in actualRando.avis {
            sommeAvis += (Double(avis.note))
        }
        noteRandoFinal = sommeAvis/(Double(actualRando.avis.count))
        return noteRandoFinal
    }
    
    //Niveau de la rando
    enum Level: String, CaseIterable, Identifiable {
        case facile, moyen, difficile, expert
        var id: Self { self }
    }

    // PICKER
    enum PickerViews: String, CaseIterable, Identifiable {
        case Infos, Carte, Conseils, Meteo
        var id: Self { self }
    }
    @State private var selectedPicker: PickerViews = .Infos
    ///
    
    // MARK: BODY
    var body: some View {
        VStack {
            header
            picker
            if selectedPicker == .Infos {
              InfoRandoInfos(actualRando: actualRando)
            } else if selectedPicker == .Carte {
                InfoRandoCarte(actualRando: actualRando)
            } else if selectedPicker == .Conseils {
                InfoRandoConseils(actualRando: actualRando)
            } else if selectedPicker == .Meteo {
                InfoRandoMeteo()
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}


// MARK: PREVIEW
struct InfoRandoFav_Previews: PreviewProvider {
    static var previews: some View {
        InfoRandoFav(actualRando: DatasVM().randos.first!)
            .environmentObject(DatasVM())
    }
}



// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION


private extension InfoRandoFav {
    
    var star: some View {
        Image(systemName: "star.fill")
            .font(.title3)
            .foregroundColor(.yellow)
            .shadow(radius: 5)
    }
    
    var likeButton: some View {
        HStack {
            Spacer()
            Button {
                LikeButtonIsPressed(rando: actualRando)
            } label: {
                Image(systemName: dataVM.users[0].favoritesHikes.contains(actualRando) ? "heart.fill" : "heart")
                    .font(.title2)
                    .padding(5)
                    .foregroundColor(Color.accentColor)
                    .background(Material.thick)
                    .cornerRadius(50)
        }
        }
    }
    
    var downloadButton: some View {
        HStack {
            Button {
               //
            } label: {
                Image(systemName: "arrow.down.to.line.circle")
                    .font(.title2)
                    .padding(5)
                    .foregroundColor(Color.accentColor)
                    .background(Material.thick)
                    .cornerRadius(50)
        }
        }
    }
    
    var levelCapsule: some View {
        ZStack {
            switch actualRando.niveauRando {
            case 0:
                LevelCapsuleBloc(text: "Facile", color: .green)
            case 1:
                LevelCapsuleBloc(text: "Moyen", color: .orange)
            case 2:
                LevelCapsuleBloc(text: "Difficile", color: .red)
            case 3:
                LevelCapsuleBloc(text: "Expert", color: .black)
            default: Text("")
            }
                
        }
    }
    
    var header: some View {
        ZStack (alignment: .bottom) {
            Image(actualRando.imageCouvertureRando)
                .resizable()
                .scaledToFill()
                .frame(height:  UIScreen.main.bounds.height*0.30)
                .clipped()
                .overlay {
                    Color.black.opacity(0.4)
                }
            VStack (spacing: 10) {
                Rectangle()
                    .fill(.clear)
                    .frame(height: 50)
                levelCapsule
                VStack {
                    Text(actualRando.nomRando.capitalized)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                    .padding(.horizontal)
                }
                .frame(height: 100)
                VStack (spacing: 15){
                    HStack {
                        switch noteRando {
                        case 0 :
                            Text("Aucune Note")
                        case 1...2 :
                            star
                        case 2.1...3 :
                            star
                            star
                        case 3.1...4 :
                            star
                            star
                            star
                        case 4.1...5 :
                            star
                            star
                            star
                            star
                        case 5 :
                            star
                            star
                            star
                            star
                            star
                        default:
                            Text("")
                        }
                    }
                    NavigationLink {
                        AvisListSubView(actualRando: actualRando)
                    } label: {
                        Text(" \(actualRando.avis.count) Avis")
                            .foregroundColor(.white)
                            .font(.headline)
                            .underline()
                    }
                }
                .padding(.bottom)
            }

            .frame(height:  UIScreen.main.bounds.height*0.30)
    
            HStack {
                downloadButton
                Spacer()
                likeButton
            }
            .padding()
        }
        .frame(height:  UIScreen.main.bounds.height*0.30)
    }
    
    var picker: some View {
        Picker("Vue", selection: $selectedPicker){
            Text("Infos").tag(PickerViews.Infos)
            Text("Carte").tag(PickerViews.Carte)
            Text("Conseils").tag(PickerViews.Conseils)
            Text("Météo").tag(PickerViews.Meteo)
        }
        .pickerStyle(.segmented)
        .padding(.horizontal)
    }
    
}


private struct LevelCapsuleBloc: View {
    let text : String
    let color : Color
    var body: some View {
        ZStack {
            Capsule()
                .frame(width: 70, height: 20)
                .foregroundColor(color)
            Text(text)
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .fontWeight(.semibold)
        }
        .shadow(radius: 5)
    }
}



// MARK: FUNCTIONS

private extension InfoRandoFav {
    
    func GetRandoIndex(Rando: Rando) -> Int {
        if let index = dataVM.users[0].favoritesHikes.firstIndex(where: {$0.id == Rando.id}) {
      return index
        }
      return 0
    }
    
    func LikeButtonIsPressed(rando: Rando) {
        if dataVM.users[0].favoritesHikes.contains(rando) {
            dataVM.users[0].favoritesHikes.remove(at: GetRandoIndex(Rando: rando))
        } else {
                dataVM.users[0].favoritesHikes.append(rando)
            }
    }
}

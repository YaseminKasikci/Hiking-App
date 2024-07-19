//
//  ListSubView.swift
//  PasAPasFinal
//
//  Created by SwiftUI Developper on 03/05/2023.
//
 
//    =============================== ChRISTOPHER ET  un peu YASEMIN  ==============================================

import SwiftUI

struct ListSubView: View {
    
    // MARK: VARIABLES & CONSTANTES
    
    @EnvironmentObject private var dataVM: DatasVM
    @Binding var distanceSliderValue : Double
    @Binding var timeSliderValue : Double
    @Binding var difficultySliderValue : Double
    
    @Binding var famillyButton: Bool
    @Binding var friendButton: Bool
    @Binding var dogButton: Bool
    
    // MARK: BODY
    var body: some View {
        ZStack {
            Color(uiColor: .tertiarySystemBackground)
                .edgesIgnoringSafeArea(.top)
            VStack (spacing: 0) {
                ScrollView {
                    VStack  {
                        if  friendButton == true {
                            ForEach(dataVM.randoCopains) { randos in
                                TuilleRandoCopain(rando: randos)
                            }
                        } else {
                            ForEach(dataVM.randos) { rando in
                                if rando.distance <= (Int(distanceSliderValue)) && rando.durée <= timeSliderValue && rando.niveauRando <= difficultySliderValue {
                                    TuilleRando(rando: rando)
                                        .padding(.top)
                                }
                            }
                        }
                    }
                }
                Spacer()
            }
        }
    }
}


// MARK: PREVIEW
struct ListSubView_Previews: PreviewProvider {
    static var previews: some View {
        ListSubView(distanceSliderValue: .constant(0), timeSliderValue: .constant(0), difficultySliderValue: .constant(0), famillyButton: .constant(false), friendButton: .constant(false), dogButton: .constant(false))
            .environmentObject(DatasVM())
    }
}



// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION


struct TuilleRando: View {
    
    @EnvironmentObject private var dataVM: DatasVM
    var rando : Rando
    
    var valeurDecimaleTemps : String { String(format: "%.1f", rando.durée)
        }
    
    var body: some View {
        NavigationLink {
            InfoRando(actualRando: rando)
        } label: {
            ZStack (alignment: .topLeading){
                Image(rando.imageCouvertureRando)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 220)
                    .cornerRadius(20)
                    .overlay {
                        Color.black.opacity(0.4)
                            .cornerRadius(20)
                    }
                    .shadow(radius: 5)
                levelCapsule
                likeButton
                VStack (alignment: .leading, spacing: 20) {
                    Spacer()
                    Text(rando.nomRando.capitalized)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    HStack (spacing: 40){
                        Label("\(rando.distance) Km", systemImage: "arrow.left.arrow.right")
                        Label("\(valeurDecimaleTemps) H", systemImage: "clock")
                    }
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.semibold)
                }
                .padding()
            }
            .frame(height: 220)
            .padding(.horizontal)
        }
    }
}

extension TuilleRando {
    
    var levelCapsule: some View {
        ZStack {
            switch rando.niveauRando {
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
        .padding()
    }
    
    var likeButton: some View {
        HStack {
            Spacer()
            Button {
                LikeButtonIsPressed(rando: rando)
            } label: {
                Image(systemName: dataVM.users[0].favoritesHikes.contains(rando) ? "heart.fill" : "heart")
                    .font(.headline)
                    .padding(5)
                    .foregroundColor(Color.accentColor)
                    .background(Material.thick)
                    .cornerRadius(50)
            }
            .padding()
            .shadow(radius: 2)
        }
    }
    
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

struct TuilleRandoCopain: View {
    
    @EnvironmentObject private var dataVM: DatasVM
    var rando : CopainsRando
    
    var valeurDecimaleTemps : String { String(format: "%.1f", rando.randoProposee.durée)
        }
    
    var body: some View {
        NavigationLink {
            InfoRando(actualRando: rando.randoProposee)
        } label: {
            ZStack (alignment: .topLeading){
                Image(rando.randoProposee.imageCouvertureRando)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 360 ,height: 220)
                    .cornerRadius(20)
                    .overlay {
                        Color.black.opacity(0.4)
                            .cornerRadius(20)
                    }
                    .shadow(radius: 5)
                levelCapsule
                likeButton
                VStack (alignment: .leading, spacing: 20) {
                    Spacer()
                    Text(rando.randoProposee.nomRando.capitalized)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    HStack (spacing: 40){
                        Label("\(rando.randoProposee.distance) Km", systemImage: "arrow.left.arrow.right")
                        Label("\(valeurDecimaleTemps) H", systemImage: "clock")
                    }
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.semibold)
                }
                .padding()
            }
            .frame(height: 220)
            .padding(.horizontal)
        }
    }
}

extension TuilleRandoCopain {
    
    var levelCapsule: some View {
        ZStack {
            switch rando.randoProposee.niveauRando {
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
        .padding()
    }
    
    var likeButton: some View {
        HStack {
            Spacer()
            Button {
                LikeButtonIsPressed(rando: rando.randoProposee)
            } label: {
                Image(systemName: dataVM.users[0].favoritesHikes.contains(rando.randoProposee) ? "heart.fill" : "heart")
                    .font(.headline)
                    .padding(5)
                    .foregroundColor(Color.accentColor)
                    .background(Material.thick)
                    .cornerRadius(50)
            }
            .padding()
            .shadow(radius: 2)
        }
    }
    
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
        .shadow(radius: 2)
    }
}

struct FilterButton: View {
    @Binding var filterButtonIsPressed : Bool
    var body: some View {
        Button {
            filterButtonIsPressed.toggle()
        } label: {
            Image(systemName: "line.3.horizontal.decrease.circle")
                .font(.title)
                .padding(5)
                .background(Color(uiColor: .tertiarySystemBackground))
                .cornerRadius(40)
        }
        .shadow(radius: 5)
    }
}

//
//  InfoRandoInfos.swift
//  PasAPas
//
//  Created by Apprenant 84 on 25/04/2023.
//

//    =============================== BILAL ==============================================

import SwiftUI

struct InfoRandoInfos: View {

    // MARK: VARIABLES & CONSTANTES
    
    @EnvironmentObject private var dataVM: DatasVM
    @State var photoIndex : Int = 0
    var actualRando : Rando
    
    // MARK: BODY
    var body: some View {
        ZStack {
            Color(uiColor: .tertiarySystemBackground)
            .edgesIgnoringSafeArea(.bottom)
            VStack {
                ScrollView {
                    VStack (spacing: 20) {
                        logsRando
                        descriptionRandoBloc
                        photosScrollView2
                        avisRando
                    }
                    .padding(.top)
                }
            }
        }
    }
}
    
    
// MARK: PREVIEWS
    struct InfoRandoInfos_Previews: PreviewProvider {
        static var previews: some View {
            InfoRandoInfos(actualRando: DatasVM().randos.first!)
                .environmentObject(DatasVM())
        }
    }


// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION


extension InfoRandoInfos {
    
    private var valeurDecimaleTemps : String { String(format: "%.1f", actualRando.durée)
        }
    
    var logsRando: some View {
        HStack (spacing: 30) {
            Label("\(actualRando.distance) Km", systemImage: "arrow.left.and.right")
            Label("\(valeurDecimaleTemps) H", systemImage: "clock")
            Label("\(actualRando.denivele) M", systemImage: "arrow.up.arrow.down")
        }
        .font(.headline)
    }
    
    var descriptionRandoBloc: some View {
        VStack {
            Text("Description")
                .font(.title3)
                .fontWeight(.semibold)
            Text(actualRando.descriptionRando)
                .multilineTextAlignment(.center)
                .padding(.top, 2)
                .padding(.horizontal, 20)
        }
    }
    
    var photosScrollView: some View {
        ScrollView (.horizontal, showsIndicators: false){
            HStack (spacing: 20) {
                ForEach(actualRando.photosRando, id: \.self) { photo in
                    Image(photo)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 150)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                }
            }
        }
        .padding()
    }
    
    
    var photosScrollView2: some View {
        ScrollView (.horizontal, showsIndicators: false){
            HStack (spacing: 20) {
                ForEach(actualRando.photosRando.indices) { index in
                    NavigationLink {
                        FullSizePhotosView(photoIndex: $photoIndex, actualRando: actualRando)
                    } label: {
                        Image(actualRando.photosRando[index])
                            .resizable()
                            .scaledToFill()
                            .frame(height: 150)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                    }
                    .simultaneousGesture(TapGesture().onEnded{
                        photoIndex = index
                    })
                }
            }
        }
        .padding()
    }
    
    var avisRando: some View {
        VStack {
            Text("Avis")
                .font(.title3)
                .fontWeight(.semibold)
                if actualRando.avis.isEmpty {
                    Text("il n'y a aucuns avis sur cette randonnée pour le moment")
                        .padding()
                        .multilineTextAlignment(.center)
                } else {
                    ScrollView (.horizontal, showsIndicators: false){
                    HStack (spacing: 20){
                        ForEach(actualRando.avis.prefix(3)) { avis in
                            AvisBloc2(avis: avis)
                        }
                        NavigationLink {
                            AvisListSubView(actualRando: actualRando)
                        } label: {
                            Text("Voir tout les avis ...")
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                        
                    }
                    .padding()
                }
            }
        }
    }
}

struct NoteRando2: View {
    var avis : Avis
    var body: some View {
        HStack {
            switch avis.note {
            case 0 :
                Text("Aucune Note")
            case 1...1.9 :
                star
            case 2.1...2.9 :
                star
                star
            case 3...3.9 :
                star
                star
                star
            case 4...4.9 :
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
        .padding(5)
        .padding(.horizontal)
    }
}

//struct AvisBloc: View {
//    var avis : Avis
//
//    var body: some View {
//        ZStack {
//            Rectangle()
//                .fill(Color("CustomColorYellow"))
//                .frame(width: 250, height: 300)
//                .cornerRadius(20)
//                .shadow(radius: 2)
//                .overlay {
//                    VStack (spacing: 10) {
//                        Image(avis.utilisateur.photoProfil)
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: 80 ,height: 80)
//                            .clipped()
//                            .cornerRadius(90)
//                            .overlay(
//                                Circle()
//                                   .strokeBorder(.black, lineWidth: 1))
//                            .padding()
//                        HStack {
//                            Text(avis.utilisateur.prenomUtilisateur)
//                                .font(.title2)
//                                .fontWeight(.bold)
//                            Text(avis.utilisateur.nomUtilisateur)
//                                .font(.title2)
//                                .fontWeight(.bold)
//                        }
//                        NoteRando2(avis: avis)
//                        Text("\"\(avis.avis)\"")
//                            .multilineTextAlignment(.center)
//                        Spacer()
//                        }
//                        .frame(height:300)
//                        .padding()
//                }
//        }
//    }
//}

struct AvisBloc2: View {
    
    let backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.white, Color.accentColor]),
        startPoint: .topLeading, endPoint: .bottom)
    let avis : Avis

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.clear)
                .frame(width: 300, height: 400)
            RoundedRectangle(cornerRadius: 25)
                .fill(Material.ultraThick)
                .shadow(radius: 5)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color("CustomColorGreen"), lineWidth: 2)
                   
                )
                .frame(width: 300, height: 300)
            VStack (spacing: 0) {
                Image(avis.utilisateur.photoProfil)
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
                    .shadow(radius: 3)
                    .overlay(
                        Circle()
                            .stroke( Color("CustomColorGreen"), lineWidth: 2))
                    .padding(.vertical)
                Text(avis.utilisateur.prenomUtilisateur + " " + avis.utilisateur.nomUtilisateur)
                    .font(.title2)
                    .fontWeight(.bold)
                NoteRando2(avis: avis)
                Rectangle()
                    .frame(width: 200, height: 1)
                    .foregroundColor(Color("CustomColorGreen"))
            }
            .offset(y:-110)
            VStack {
                Text("\"\(avis.avis)\"")
                    .multilineTextAlignment(.center)
                    .padding(.top)
                Spacer()
            }
            .frame(width: 280, height: 150)
            .offset(y:60)
        }
    }
}

extension NoteRando2 {
    var star: some View {
        Image(systemName: "star.fill")
            .font(.subheadline)
            .foregroundColor(.yellow)
    }
}

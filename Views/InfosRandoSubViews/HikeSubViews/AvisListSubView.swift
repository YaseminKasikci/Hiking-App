//
//  AvisListSubView.swift
//  PasAPasFinal
//
//  Created by SwiftUI Developper on 04/05/2023.
//

//    =============================== ASSETOU ==============================================


import SwiftUI
import CoreLocation

struct AvisListSubView: View {
    
    // MARK: VARIABLES & CONSTANTES
    
    @EnvironmentObject private var dataVM: DatasVM
    var actualRando : Rando
    
    // MARK: BODY
    var body: some View {
        VStack {
            Text("Avis")
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .padding(.bottom)
                .background(Color(uiColor: .tertiarySystemGroupedBackground))
            if actualRando.avis.isEmpty {
                Spacer()
               Text("Aucuns avis pour le moment")
                    .font(.headline)
            } else {
                ScrollView {
                    VStack (spacing: 50){
                        Rectangle()
                            .fill(.clear)
                            .frame(height: 10)
                            
                        ForEach(actualRando.avis) { avis in
                            AvisBloc(avis: avis)
                        }
                    }
                }
            }
            Spacer()
        }
    }
}


// MARK: PREVIEW
struct AvisListSubView_Previews: PreviewProvider {
    static var previews: some View {
        AvisListSubView(actualRando: Rando(imageCouvertureRando: "", nomRando: "", niveauRando: 4, distance: 12, durée: 2, denivele: 2, descriptionRando: "", avis: [Avis(utilisateur: DatasVM().users.first!, note: 5, avis: "Super rando")], saisons: [], coordinates: CLLocationCoordinate2D(latitude: 2, longitude: 2)))
    }
}


// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION

private struct AvisBloc: View {
    var avis:Avis
    @State var seeMorePressed : Bool = false
    
    var body: some View {
        
        ZStack (alignment: .top) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Material.ultraThick)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("CustomColorGreen"), lineWidth: 2)
                )
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .padding(.horizontal)
            Image(avis.utilisateur.photoProfil)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 120, height: 120)
                .shadow(radius: 2)
                .overlay(
                    Circle()
                        .stroke(Color("CustomColorGreen"), lineWidth: 2)
                )
                .offset(x: -125, y: -40)
            VStack (spacing: 5){
                Text("\(avis.utilisateur.prenomUtilisateur)" + " " + "\(avis.utilisateur.nomUtilisateur)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                NoteRando3(avis: avis)
                Rectangle()
                    .frame(width: 100, height: 1)
                    .foregroundColor(Color("CustomColorGreen"))
            }
            .frame(width: 250, height: 100)
            .offset(x: 50, y: -10)
            VStack {
                Text("\"\(avis.avis)\"")
                    .multilineTextAlignment(.leading)
                    .font(.body)
                   Spacer()
            }
            .frame(width: 330, height: 300)
        .offset(y: 90)
        }
        .padding(.bottom)
    }
}

private struct NoteRando3: View {
    var avis : Avis
    var body: some View {
        HStack {
            switch avis.note {
            case 0 :
                Text("Aucune Note")
            case 1...1.9 :
                star
            case 2...2.9 :
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

private extension NoteRando3 {
    var star: some View {
        Image(systemName: "star.fill")
            .font(.subheadline)
            .foregroundColor(.yellow)
    }
}

//
//  FicheRandoCopain.swift
//  PasAPasFinal
//
//  Created by SwiftUI Developper on 05/05/2023.
//

//    =============================== DRICY ==============================================


import SwiftUI

struct FicheRandoCopain: View {
    
    // MARK: VARIABLES & CONSTANTES
    
    @EnvironmentObject private var dataVM: DatasVM
    @State var actualRandoCopain : CopainsRando
    var valeurDecimaleTemps : String { String(format: "%.1f", actualRandoCopain.randoProposee.durée)
        }
    
    // MARK: BODY
    var body: some View {
        VStack(spacing: 0){
            header
           VStack (spacing: 10) {
               InfoOrganisateur2(friend: actualRandoCopain.organisateur , actualRandoCopain: actualRandoCopain)
               ScrollView {
                   Text("\"\(actualRandoCopain.descriptionCopainsRando)\"")
                       .multilineTextAlignment(.center)
                       .frame(maxHeight: .infinity)
               }
               VStack (spacing: 20){
                   Text("Le \(actualRandoCopain.date) 2023")
                       .font(.title2)
                       .bold()
                       .multilineTextAlignment(.center)
                   
                   Text("Ils ont déjà rejoints \(actualRandoCopain.organisateur.prenomUtilisateur)")
                       .multilineTextAlignment(.center)
                   HStack {
                       ForEach(actualRandoCopain.participant) { participants in
                           PhotoProfilAmis(friend: participants)
                       }
                   }
                   
    
                   
                   Text("Il reste encore \(actualRandoCopain.placeDispo) places disponibles")
                       .multilineTextAlignment(.center)
                   Button {
                       ParticiperRandoCopain()
                   } label: {
                       if actualRandoCopain.organisateur ==  DatasVM().users[0] {
                           Text("Annuler la Randonnée")
                               .foregroundColor(.red)
                               .font(.headline)
                               .padding()
                           
                       } else if actualRandoCopain.organisateur !=  DatasVM().users[0] && actualRandoCopain.participant.contains(DatasVM().users[0]){
                           Text("Quitter la Randonnée")
                               .padding(8)
                               .padding(.horizontal)
                               .foregroundColor(Color("CustomWhite"))
                               .font(.headline)
                               .padding()
                               .background(Color.red)
                               .cornerRadius(10)
                       
                       } else {
                           Text("Participer à la randonnée")
                               .padding(8)
                               .foregroundColor(Color("CustomWhite"))
                               .font(.headline)
                               .padding()
                               .background(Color.accentColor)
                               .cornerRadius(10)
                       }
                   }
                   NavigationLink {
                       InfoRando(actualRando: actualRandoCopain.randoProposee)
                   } label: {
                       Text("Voir les informations de la randonnée")
                   }
               }
            }
           .padding(.horizontal)
            Spacer()
        }
    }
    
    func ParticiperRandoCopain() {
        
        if actualRandoCopain.organisateur ==  DatasVM().users[0] {

            
        } else if actualRandoCopain.organisateur !=  DatasVM().users[0] && actualRandoCopain.participant.contains(DatasVM().users[0]){
            actualRandoCopain.participant.removeLast()
            actualRandoCopain.placeDispo += 1
        
        } else {
            actualRandoCopain.participant.append(DatasVM().users[0])
            DatasVM().users[0].randosCopainAVenir.append(actualRandoCopain)
            actualRandoCopain.placeDispo -= 1
        }

    }
}


// MARK: PREVIEW
struct FicheRandoCopain_Previews: PreviewProvider {
    static var previews: some View {
        FicheRandoCopain(actualRandoCopain: CopainsRando(randoProposee: DatasVM().randos[0], date: "", descriptionCopainsRando: "", placeDispo: 2, organisateur: DatasVM().users[0]))
        .environmentObject(DatasVM())
    }
}


// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION


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

private struct PhotoProfilAmis: View {
    var friend : Utilisateur
    var body: some View {
        NavigationLink {
           ProfilAmis(actualFriend: friend)
        } label: {
            Image(friend.photoProfil)
                .resizable()
                .scaledToFill()
                .frame(width:60, height: 60)
                .clipShape(Circle())
                .overlay(Circle().strokeBorder(Color("CustomColorGreen"), lineWidth: 2))
                .shadow(radius: 2)
        }
    }
}

struct InfoOrganisateur: View {
    var friend : Utilisateur
    var actualRandoCopain : CopainsRando
    var body: some View {
        VStack {
            Text("Proposée par ")
                .font(.headline)
                .foregroundColor(.white)
            VStack (spacing: 0){
                Image(actualRandoCopain.organisateur.photoProfil)
                    .resizable()
                    .scaledToFit()
                    .frame(width:200)
                    .clipShape(Circle())
                    .overlay(Circle().strokeBorder(Color("CustomColorGreen"), lineWidth: 4))
                    .shadow(radius: 3)
                Text(actualRandoCopain.organisateur.prenomUtilisateur + " " + actualRandoCopain.organisateur.nomUtilisateur)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
            }
            NavigationLink {
              ProfilAmis(actualFriend: friend)
            } label: {
                Text("Voir le profile")
                    .foregroundColor(.accentColor)
            }
        }
    }
}

struct InfoOrganisateur2: View {
    var friend : Utilisateur
    var actualRandoCopain : CopainsRando
    var body: some View {
        VStack (spacing: 0) {
           
            VStack (spacing: 10){
                Text("Proposée par ")
                Text(actualRandoCopain.organisateur.prenomUtilisateur + " " + actualRandoCopain.organisateur.nomUtilisateur)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
            }
            NavigationLink {
              ProfilAmis(actualFriend: friend)
            } label: {
                Text("Voir le profile")
                    .foregroundColor(.accentColor)
            }
        }
        .offset(y: -20)
    }
}

extension FicheRandoCopain {
    
    var backgroundImage: some View {
        ZStack{
            Image(actualRandoCopain.randoProposee.imageCouvertureRando)
                .resizable()
                .scaledToFill()
                .frame(height:  UIScreen.main.bounds.height*0.30)
                .clipped()
                .overlay {
                    Color.black.opacity(0.4)
                }
        }
        .edgesIgnoringSafeArea(.top)
       
    }
    
    var levelCapsule: some View {
        ZStack {
            switch actualRandoCopain.randoProposee.niveauRando {
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
    
    var infoOrganisateur: some View {
        VStack {
            Text("Proposé par ")
                .font(.headline)
                .foregroundColor(.white)
            VStack (spacing: 0){
                Image(actualRandoCopain.organisateur.photoProfil)
                    .resizable()
                    .scaledToFit()
                    .frame(width:200)
                    .clipShape(Circle())
                    .overlay(Circle().strokeBorder(Color("CustomColorGreen"), lineWidth: 4))
                    .shadow(radius: 3)
                Text(actualRandoCopain.organisateur.prenomUtilisateur + " " + actualRandoCopain.organisateur.nomUtilisateur)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
            }
            NavigationLink {
                ProfilAmis(actualFriend: actualRandoCopain.organisateur)
            } label: {
                Text("Voir le profile")
                    .foregroundColor(.accentColor)
            }
        }
    }
    
    var infoOrganisateur2: some View {
        VStack {
            VStack (spacing: 0){
                Image(actualRandoCopain.organisateur.photoProfil)
                    .resizable()
                    .scaledToFit()
                    .frame(width:200)
                    .clipShape(Circle())
                    .overlay(Circle().strokeBorder(Color("CustomColorGreen"), lineWidth: 4))
                    .shadow(radius: 3)
                Text("Proposé par ")
                    .font(.headline)
                    .foregroundColor(.white)
                Text(actualRandoCopain.organisateur.prenomUtilisateur + " " + actualRandoCopain.organisateur.nomUtilisateur)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
            }
            NavigationLink {
                ProfilAmis(actualFriend: actualRandoCopain.organisateur)
            } label: {
                Text("Voir le profil")
                    .foregroundColor(.accentColor)
            }
        }
    }
    
    var header: some View {
        ZStack (alignment: .top) {
            backgroundImage
            levelCapsule
                .offset(y: 50)
            VStack (spacing: 10) {
                Text("\(actualRandoCopain.randoProposee.nomRando.capitalized)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .frame(height: 90)
                    .offset(y: 80)
            }
            .padding(.vertical)
            Image(actualRandoCopain.organisateur.photoProfil)
                .resizable()
                .scaledToFit()
                .frame(width:190)
                .clipShape(Circle())
                .overlay(Circle().strokeBorder(Color("CustomColorGreen"), lineWidth: 4))
                .shadow(radius: 3)
                .offset(y: 190)
        }
        .edgesIgnoringSafeArea(.top)
    }
    
    
}

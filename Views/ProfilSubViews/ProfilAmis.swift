//
//  ProfileAmis.swift
//  PasAPasFinal
//
//  Created by SwiftUI Developper on 09/05/2023.
//

//    =============================== CHRISTOPER ==============================================


import SwiftUI

struct ProfilAmis: View {
    
    // MARK: VARIABLES & CONSTANTES
    
    @EnvironmentObject private var dataVM: DatasVM
    
    let gradient =  LinearGradient(gradient: Gradient(colors: [Color(uiColor: .tertiarySystemBackground), .clear]), startPoint: .top, endPoint: .bottom)

    var actualFriend : Utilisateur
    
    
    // MARK: BODY
    var body: some View {
        ZStack {
            Color(uiColor: .tertiarySystemBackground)
                .edgesIgnoringSafeArea(.bottom)
            scrollViewWithInformations
            gradientBloc
                .offset(y: -140)
            backgroundPhotoAndName
            Spacer()
        }
    }
}


// MARK: PREVIEW
struct ProfileAmis_Previews: PreviewProvider {
    static var previews: some View {
        ProfilAmis(actualFriend: DatasVM().users[1])
    }
}


// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION



private extension ProfilAmis {
    
    var backgroundPhotoAndName: some View {
        VStack {
            ZStack{
                Image(actualFriend.photoCouverture)
                    .resizable()
                    .scaledToFit()
                    .overlay {
                        Color.black.opacity(0.4)
                    }
                Text(actualFriend.prenomUtilisateur + " " + actualFriend.nomUtilisateur)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .shadow(radius: 2)
                Image(actualFriend.photoProfil)
                    .resizable()
                    .scaledToFit()
                    .frame(width:200)
                    .clipShape(Circle())
                    .overlay(Circle().strokeBorder(Color("CustomColorGreen"), lineWidth: 4))
                    .offset(y:125)
            }
            .edgesIgnoringSafeArea(.top)
            Spacer()
        }
        
    }
    
    var scrollViewWithInformations: some View {
        VStack {
            Rectangle()
                .fill(.clear)
                .frame(height: 220)
            ScrollView (showsIndicators: false) {
                Text("\r\r\(actualFriend.bioUtilisateur)")
                    .multilineTextAlignment(.center)
                    .padding()
                Divider()
                PhotosAmis(actualUser: actualFriend)
                Divider()
                RandosCopainProposees(user: actualFriend)
                Divider()
                HistoriqueRando(user: actualFriend)
            }
        }
    }
    
    var gradientBloc: some View {
        VStack {
                gradient
                    .frame(height: 70)
        }
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
                .overlay(Circle().strokeBorder(Color("CustomColorGreen"), lineWidth: 3))
        }
    }
}

private struct TuilleRando2: View {
    var rando : Rando
    var body: some View {
        NavigationLink {
            InfoRando(actualRando: rando)
        } label: {
            ZStack {
                Image(rando.imageCouvertureRando)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 220)
                    .cornerRadius(20)
                Rectangle()
                    .frame(height: 220)
                    .opacity(0.4)
                    .cornerRadius(20)
                VStack (alignment: .center, spacing: 10){
                    Text(rando.nomRando)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                    HStack (spacing: 40) {
                        Label(rando.durée.description, systemImage: "clock")
                        Label("\(rando.distance)km", systemImage:"arrow.left.arrow.right")
                    }
                    .foregroundColor(.white)
                    .font(.headline)
                }
                .padding(.horizontal)
            }
        }
        .foregroundColor(.black.opacity(0.4))
    }
}

private struct HistoriqueRando : View {
    var user : Utilisateur
    @EnvironmentObject private var dataVM: DatasVM
    var historiqueIsEmpty: Bool {
        user.historiqueUtilisateur.isEmpty ? true : false
    }
    var body: some View {
        VStack {
            Text("Son historique de randonnées")
                .font(.headline)
                .padding(.bottom)
            if historiqueIsEmpty {
                Text("\(user.prenomUtilisateur) n'a terminer aucune randonée pour le moment")
                    .multilineTextAlignment(.center)
            } else {
                ScrollView (.horizontal, showsIndicators: false){
                    HStack (spacing: 10) {
                        ForEach(user.historiqueUtilisateur) { hike in
                            TuilleRando2(rando: hike)
                        }
                    }
                }
            }
        }
        .padding()
    }
}

private struct PhotosAmis : View {
    
    var friendsListIsEmpty: Bool {
        actualUser.copainsUtilisateur.isEmpty ? true : false
    }
    var actualUser : Utilisateur
    var body: some View {
        VStack {
            Text("Ses CopainsRando")
                .font(.headline)
                .padding(.bottom)
            if friendsListIsEmpty {
                Text("\(actualUser.prenomUtilisateur) n'à pas encore ajouté(e) d'ami(e)")
                    .multilineTextAlignment(.center)
        } else {
            HStack {
                ForEach(actualUser.copainsUtilisateur) { friend in
                    PhotoProfilAmis(friend: friend)
                }
            }
        }
        }
        .padding()
    }
}

private struct RandosCopainProposees: View {
    var user : Utilisateur
    @EnvironmentObject private var dataVM: DatasVM
    var body: some View {
        VStack {
            Text("Ses prochaines randonnées partagées")
                .font(.headline)
                .padding(.bottom)
            ScrollView (.horizontal, showsIndicators: false){
                HStack (spacing: 10) {
                    ForEach(user.randosCopainAVenir) { rando in
                        TuileCopainRando(rando: rando)
                    }
                }
            }
        }
        .padding()
    }
}

private struct TuileCopainRando: View {
    
    @EnvironmentObject private var dataVM: DatasVM
    var rando : CopainsRando
    
    var body: some View {
        NavigationLink {
           FicheRandoCopain(actualRandoCopain: rando)
        } label: {
            ZStack {
                Image(rando.randoProposee.imageCouvertureRando)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 220)
                    .cornerRadius(20)
                Rectangle()
                    .frame(height: 220)
                    .opacity(0.4)
                    .cornerRadius(20)
                VStack (alignment: .center, spacing: 10){
                    Text("Le \(rando.date) 2023")
                        .shadow(radius: 3)
                    Text(rando.randoProposee.nomRando)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .shadow(radius: 5)
                    Text("Avec")
                    HStack {
                        ParticipantsPics(photoProfile: rando.organisateur.photoProfil)
                        ForEach(self.rando.participant) { participants in
                            ParticipantsPics(photoProfile: participants.photoProfil)
                        }
                    }
                }
                .foregroundColor(.white)
                .font(.headline)
                .padding(.horizontal)
            }
        }
        .foregroundColor(.black.opacity(0.4))
    }
}

private extension TuileCopainRando {

    var backgroundImage: some View {
        Image(rando.randoProposee.imageCouvertureRando)
            .resizable()
            .scaledToFill()
            .frame(width: 350)
            .cornerRadius(20)
            .overlay {
                Rectangle()
                    .fill(.black)
                    .opacity(0.4)
            }
            .cornerRadius(20)
            .shadow(radius: 5)
            .padding(.horizontal)
    }

    var dateRando: some View {
        HStack{
            Spacer()
            Label(rando.date, systemImage: "calendar.badge.clock")
                .foregroundColor(.white)
                .bold()
                .padding(.trailing)
        }
    }

    var ProposantEtDescription: some View {
        HStack {
            Image(rando.organisateur.photoProfil)
                .resizable()
                .scaledToFill()
                .frame(width:50, height: 50)
                .clipShape(Circle()
                )
                .overlay(Circle().strokeBorder(.green, lineWidth: 1))
                .padding(.horizontal)
            Text("\" \(rando.descriptionCopainsRando) \"")
                .font(.caption)
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .bold()
                .padding(.trailing)
            Spacer()
  }
   .frame(height: 50)
   .padding(.horizontal, 2)
    }

    var nomRando: some View {
        Text(rando.randoProposee.nomRando.capitalized)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(.leading)
    }

    var valeurDecimaleTemps : String { String(format: "%.1f", rando.randoProposee.durée)
        }

    var logsRando: some View {
        HStack (spacing:30) {
            Label("\(valeurDecimaleTemps) H", systemImage: "clock")
            Label("\(rando.randoProposee.distance) Km", systemImage:"arrow.left.arrow.right")
        }
        .font(.caption)
        .foregroundColor(.white)
        .bold()
        .padding(.horizontal)
    }

    var profilesParticipants: some View {
        HStack {
            Spacer()
            ForEach(rando.participant) { participants in
                ParticipantsPics(photoProfile: participants.photoProfil)
            }
            if PlacesRestantes(randoCopain: rando) != 0 {
                Text("+\(PlacesRestantes(randoCopain:rando).description)")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(width:35, height: 35)
                    .overlay(Circle().strokeBorder(.green, lineWidth: 2))
                    .background(Circle().fill(Material.ultraThinMaterial))
            }
        }
        .padding(.horizontal)
    }

    func PlacesRestantes(randoCopain : CopainsRando) -> Int {
        let placesrestantes : Int = (randoCopain.placeDispo) - (randoCopain.participant.count)
        return placesrestantes
    }
}

private struct ParticipantsPics: View {
    var photoProfile : String
    var body: some View {

        Image(photoProfile)
                .resizable()
                .scaledToFill()
                .frame(width:35, height: 35)
                .clipShape(Circle())
                .overlay(Circle().strokeBorder(.green, lineWidth: 2))
    }
}





//
//  CopainRandoListeRandos.swift
//  PasAPas
//
//  Created by SwiftUI Developper on 25/04/2023.
//

//    =============================== CHRISTOPHER / YASEMIN ==============================================


import SwiftUI

struct ListeRandosCopain: View {

    // MARK: VARIABLES & CONSTANTES
    
    @EnvironmentObject private var dataVM: DatasVM
   
    @State var createHikeButtonPressed : Bool = false
    @AppStorage ("user_LoegedIn") var userIsLoged : Bool = false
    
    
    // MARK: BODY
    var body: some View {
        VStack (spacing: 0){
            HStack {
                Button {
                    userIsLoged = false
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.title)
                        .foregroundColor(.clear)
                        .padding()
                }
                Spacer()
                Text("CopainsRando")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                Spacer()
                Button {
                    createHikeButtonPressed.toggle()
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.title)
                        .padding()
                }
            }
            .background(Color(uiColor: .tertiarySystemGroupedBackground))
            ZStack {
                Color(uiColor: .tertiarySystemBackground)
                    .edgesIgnoringSafeArea(.bottom)
                ScrollView {
                    VStack (spacing: 20) {
                        ForEach(dataVM.randoCopains) { rando in
                            NavigationLink {
                                FicheRandoCopain(actualRandoCopain: rando)
                            } label: {
                                TuileCopainRando(rando: rando)
                            }
                        }
                    }
                }
                .padding(.top)
            }
            Spacer()
        }
        .fullScreenCover(isPresented: $createHikeButtonPressed) {
            CreationRandoCopain()
        }
    }
}



// MARK: PREVIEWS
struct CopainRandoListeRandos_Previews: PreviewProvider {
    static var previews: some View {
        ListeRandosCopain()
            .environmentObject(DatasVM())
    }
}


// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION



private struct TuileCopainRando: View {
    
    @EnvironmentObject private var dataVM: DatasVM
    var rando : CopainsRando
    
    var body: some View {
        ZStack{
            backgroundImage
            VStack (alignment: .leading ,spacing: 15){
                dateRando
                ProposantEtDescription
                nomRando
                HStack {
                    logsRando
                    profilesParticipants
                }
            }
            .frame(height: 220)
            .padding(.horizontal)
        }
    }
}

private extension TuileCopainRando {

    var backgroundImage: some View {
        Image(rando.randoProposee.imageCouvertureRando)
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity)
            .frame(height: 220)
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
        .padding(.leading)
    }

    var profilesParticipants: some View {
        HStack {
            Spacer()
            ForEach(rando.participant) { participants in
                ParticipantsPics(photoProfile: participants.photoProfil)
            }
            if  rando.placeDispo != 0 {
              Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFill()
                    .frame(width:35, height: 35)
                    .foregroundColor(Color(uiColor: .darkGray).opacity(0.7))
                    .overlay {
                        Text("+\(rando.placeDispo)")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(2)
                            .background(Color.red)
                            .cornerRadius(40)
                            .offset(x: 15,y:-15)
                    }
//                Image(systemName: "person.crop.circle.badge")
//                Text("+\(PlacesRestantes(randoCopain:rando).description)")
//                    .foregroundColor(.white)
//                    .font(.headline)
//                    .frame(width:35, height: 35)
//                    .overlay(Circle().strokeBorder(.green, lineWidth: 2))
//                    .background(Circle().fill(Material.ultraThinMaterial))
            }
        }
        .padding(.horizontal)
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
                .shadow(radius: 3)
    }
}




//
//  InfoRandoConseils.swift
//  PasAPasFinal
//
//  Created by SwiftUI Developper on 05/05/2023.
//

//    =============================== BILAL / matériel necessaire CHRISTOPHER ==============================================

import SwiftUI

struct InfoRandoConseils: View {
    
    // MARK: VARIABLES & CONSTANTES
    
    @EnvironmentObject private var dataVM: DatasVM
    let actualRando : Rando
    
    // MARK: BODY
    var body: some View {
        ZStack {
            Color(uiColor:.tertiarySystemBackground)
                .edgesIgnoringSafeArea(.bottom)
            ZStack {
                ScrollView {
                    VStack (spacing: 50){
                        VStack {
                            ConseilsText(actualRando: actualRando)
                                .padding()
                            Divider()
                            Text("Quand partir ?")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .padding(.vertical)
                            VStack (spacing: 30) {
                                HStack (spacing: 20) {
                                    SeasonIcon(actualRando: actualRando, moisText: "Jan", mois: .janvier)
                                    SeasonIcon(actualRando: actualRando, moisText: "Fev", mois: .fevrier)
                                    SeasonIcon(actualRando: actualRando, moisText: "Mar", mois: .mars)
                                    SeasonIcon(actualRando: actualRando, moisText: "Avr", mois: .avril)
                                    SeasonIcon(actualRando: actualRando, moisText: "Mai", mois: .mais)
                                    SeasonIcon(actualRando: actualRando, moisText: "Juin", mois: .juin)
                                }
                                HStack (spacing: 20) {
                                    SeasonIcon(actualRando: actualRando, moisText: "Juil", mois: .juillet)
                                    SeasonIcon(actualRando: actualRando, moisText: "Aou", mois: .aout)
                                    SeasonIcon(actualRando: actualRando, moisText: "Sep", mois: .septembre)
                                    SeasonIcon(actualRando: actualRando, moisText: "Oct", mois: .octobre)
                                    SeasonIcon(actualRando: actualRando, moisText: "Nov", mois: .novembre)
                                    SeasonIcon(actualRando: actualRando, moisText: "Dec", mois: .decembre)
                                }
                            }
                        }
                        Divider()
                        Text("Matériel Nécessaire")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.bottom)
                        VStack (alignment: .leading ,spacing: 10){
                            ForEach(actualRando.equipement) { equipement in
                                CheckListBloc(equipement: equipement)
                            }
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}


// MARK: PREVIEW
struct InfoRandoConseils_Previews: PreviewProvider {
    static var previews: some View {
        InfoRandoConseils(actualRando: DatasVM().randos[0])
    }
}


// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION



struct SeasonIcon: View {
    var actualRando : Rando
    var moisText : String
    var mois : Saisons
    var body: some View {
        VStack(spacing: 15) {
            Text(moisText)
            if actualRando.saisons.contains(mois) {
                Image(systemName: "hand.thumbsup.circle.fill")
                    .font(.title)
                    .foregroundColor(.green)
            } else {
                Image(systemName: "hand.thumbsdown.circle.fill")
                    .font(.title)
                    .foregroundColor(.red)
            }
        }
        .font(.title3)
    }
}

struct ConseilsText: View {
    let actualRando : Rando
    var body: some View {
        VStack {
            Text("Quelques conseils")
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.bottom)
            Text(actualRando.infoEquipement)
                .multilineTextAlignment(.center)
        }
    }
}

struct CheckListBloc: View {
    
   @State  var equipement : checkListEquipement
    
    var body: some View {
        HStack {
            Button {
                equipement.check.toggle()
            } label: {
                Image(systemName: equipement.check ? "checkmark.circle.fill" : "circle")
                    .font(.title)
            }
            Text(getEquipementName(equipement: equipement.equipement))
                .foregroundColor(.primary)
        }
    }
}

func getEquipementName(equipement: Equipement) -> String {
    switch equipement {
    case .chaussures:
        return "Chaussures de marche"
    case .gourde:
        return "Gourde 1L"
    case .sacADos:
        return "Sac à dos max 20L"
    case .pharmacie:
        return "Trousse à pharmacie"
    case .batons:
        return "Batons de marche"
    case .polaire:
        return "Vetement chaud"
    case .vetementsPluie:
        return "Vêtements de Pluie"
    case .couteau:
        return "Couteau"
    case .cremeSolaire:
        return "Crème Solaire"
    case .lunettes:
        return "Lunettes de Soleil"
    case .chapeau:
        return "Chapeau"
    case .boussole:
        return "Boussole"
    case .nouriture:
        return "Nouriture"
    case .carte:
        return "Carte IGN"
    case .tente:
        return "Tente"
    case .rechaud:
        return "Réchaud"
    case .frontale:
        return "Frontale"
    case .sacCouchage:
        return "Sac de Couchage"
    case .TapisSol:
        return "Tapis de Sol"
        
    }
    
}




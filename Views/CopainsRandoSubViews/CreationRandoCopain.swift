//
//  CopainRandoCreaRando.swift
//  PasAPas
//
//  Created by SwiftUI Developper on 26/04/2023.
//

//    =============================== CHRISTOPHER ==============================================


import SwiftUI

struct CreationRandoCopain: View {
 
    // MARK: VARIABLES & CONSTANTES
    
    enum Hike: String, CaseIterable, Identifiable {
        case Hike1, Hike2, Hike3, Hike4, Hike5, Hike6, Hike7, Hike8
        var id: Self { self }
    }
    @State private var selectedHike: Hike = .Hike1
    @State private var date : Date = Date()
    @State private var nombrePersonnes = 0
    @State private var description = ""
    @State private var profilVerifierSeulement : Bool = false
    
    @Environment (\.presentationMode) var presentationMode
    @EnvironmentObject private var dataVM: DatasVM
    
    
    // MARK: BODY
    var body: some View {
        ScrollView {
            VStack (spacing: 40){
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("Annuler")
                        Spacer()
                    }
                    .padding()
                }
                VStack {
                    Text("Quelle randonnée voulez-vous partager ?")
                        .font(.headline)
                    Picker("Hike", selection: $selectedHike){
                        Text("Le lac des trois Marmottes").tag(Hike.Hike1)
                        Text("Le Massif de Serrnac").tag(Hike.Hike2)
                        Text("La Cote d'Emeraude").tag(Hike.Hike3)
                        Text("Chemin de Steevenson").tag(Hike.Hike4)
                        Text("Le Pic de l'Aigle").tag(Hike.Hike5)
                        Text("La Cité Perdue").tag(Hike.Hike6)
                        Text("Le Tour du Massif de l'Ours").tag(Hike.Hike7)
                        Text("Les Trois Vallées").tag(Hike.Hike8)
                    }
                    .pickerStyle(.menu)
                }
                Divider()
                VStack {
                    Text("Quand voulez-vous partir ?")
                        .font(.headline)
                    HStack {
                        DatePicker("Choisissez une date",
                                   selection: $date,
                                   displayedComponents: .date
                        ).datePickerStyle(.compact)
                    }
                    .padding()
                }
                Divider()
                VStack (spacing: 20) {
                    Text("Avec combien de personnes ?")
                        .font(.headline)
                    VStack (spacing: 30){
                        Stepper {
                            Text("\(nombrePersonnes) personnes")
                                .font(.headline)
                                .foregroundColor(.accentColor)
                        } onIncrement: {
                            nombrePersonnes += 1
                        } onDecrement: {
                            nombrePersonnes -= 1
                        }
                        Toggle("Profil vérifiés seulement?", isOn: $profilVerifierSeulement)
                            .toggleStyle(SwitchToggleStyle(tint: Color.accentColor))
                    }
                    .padding(.horizontal)
                }
                Divider()
                VStack {
                    Text("Raconter pourquoi vous voulez partager cette randonnée")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                    TextField("Ajouter une description", text: $description, axis: .vertical)
                        .padding()
                        .textFieldStyle(.plain)
                        .lineLimit(6...6)
                        .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.accentColor, lineWidth: 2)
                            )
                        .padding(.vertical)
                }
                Button {
                    addNewCopainRando(randoProposee: selectedHike, date: date, descriptionCopainsRando: description, placeDispo: nombrePersonnes)
                } label: {
                    Text("Partager la randonnée")
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                }
                .buttonStyle(.borderedProminent)
                .padding()
                .padding(.vertical)
                .padding(.vertical)
            }
            .padding()
            Spacer()
        }
    }
}

// MARK: PREVIEWS
struct CopainRandoCreaRando_Previews: PreviewProvider {
    static var previews: some View {
        CreationRandoCopain()
            .environmentObject(DatasVM())
    }
}


// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION

extension CreationRandoCopain {
    
    func convertHike(hike: Hike) -> Rando {
        switch hike {
        case .Hike1:
           return  dataVM.randos[0]
        case .Hike2:
            return  dataVM.randos[1]
        case .Hike3:
            return dataVM.randos[2]
        case .Hike4:
            return dataVM.randos[3]
        case .Hike5:
            return  dataVM.randos[4]
        case .Hike6:
            return  dataVM.randos[5]
        case .Hike7:
            return  dataVM.randos[6]
        case .Hike8:
            return dataVM.randos[7]
        }
    }
    
    func addNewCopainRando(randoProposee : Hike, date : Date, descriptionCopainsRando : String, placeDispo: Int) {
        let newCopainRando : CopainsRando = CopainsRando(randoProposee: convertHike(hike: randoProposee), date: "17 Mai", descriptionCopainsRando: descriptionCopainsRando, placeDispo: placeDispo, organisateur: dataVM.users[0])
        dataVM.randoCopains.append(newCopainRando)
        presentationMode.wrappedValue.dismiss()
    }
}

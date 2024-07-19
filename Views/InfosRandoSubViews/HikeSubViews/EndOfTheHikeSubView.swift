//
//  EndOfTheHikeSubView.swift
//  PasAPasFinal
//
//  Created by SwiftUI Developper on 08/05/2023.
//

//    =============================== CHRISTOPHER ==============================================


import SwiftUI

struct EndOfTheHikeSubView: View {
    
    // MARK: VARIABLES & CONSTANTES
    
    @EnvironmentObject private var dataVM: DatasVM
    var actualRando : Rando
    @State var hikeNote : Int = 0
    @State var hikeDescription : String = ""
    @Environment (\.presentationMode) var presentationMode
    
    
    // MARK: BODY
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Material.ultraThick)
                .frame(width: 330, height: 480)
                .shadow(radius: 10)
            VStack {
                Text("Félicitations")
                    .font(.title)
                    .bold()
                    .font(.headline)
                    .padding()
                Text("Qu'avez vous pensé de la randonnée ?")
                    .multilineTextAlignment(.center)
                HStack {
                    Button {
                        withAnimation(.spring(response: 0.6)) {
                            hikeNote = 1
                        }
                    } label: {
                        Image(systemName: hikeNote >= 1 ? "star.fill" : "star")
                    }
                    Button {
                        withAnimation(.spring(response: 0.6)) {
                            hikeNote = 2
                        }
                    } label: {
                        Image(systemName: hikeNote >= 2 ? "star.fill" : "star")
                    }
                    Button {
                        withAnimation(.spring(response: 0.6)) {
                            hikeNote = 3
                        }
                    } label: {
                        Image(systemName: hikeNote >= 3 ? "star.fill" : "star")
                    }
                    Button {
                        withAnimation(.spring(response: 0.6)) {
                            hikeNote = 4
                        }
                    } label: {
                        Image(systemName: hikeNote >= 4 ? "star.fill" : "star")
                    }
                    Button {
                        withAnimation(.spring(response: 0.6)) {
                            hikeNote = 5
                        }
                    } label: {
                        Image(systemName: hikeNote >= 5 ? "star.fill" : "star")
                    }

                }
                .font(.title)
                .toggleStyle(SwitchToggleStyle(tint: Color.accentColor))
                .padding()
                TextField("Donnez nous votre avis", text: $hikeDescription, axis: .vertical)
                    .padding()
                    .textFieldStyle(.plain)
                    .lineLimit(6...6)
                    .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.accentColor, lineWidth: 2)
                        )
                    .padding(.vertical)
                Button {
                    shareButtonPressed()
                } label: {
                    Text("Partager")
                        .font(.headline)
                        .padding(.horizontal)
                }
                .buttonStyle(.borderedProminent)
                Button {
                    notNowButtonPressed()
                } label: {
                    Text("Pas maintenant")
                }
                .buttonStyle(.borderless)
                
            }
            .frame(width: 300, height: 500)
        .padding()
        }
    }
}


// MARK: PREVIEW
struct EndOfTheHikeSubView_Previews: PreviewProvider {
    static var previews: some View {
        EndOfTheHikeSubView(actualRando: DatasVM().randos.first!)
            .environmentObject(DatasVM())
    }
}


// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION



extension EndOfTheHikeSubView {
    
    func GetRandoIndex(Rando: Rando) -> Int {
        if let index = dataVM.randos.firstIndex(where: {$0.id == Rando.id}) {
      return index
        }
      return 0
    }
    
  func shareButtonPressed() {
        dataVM.users[0].historiqueUtilisateur.append(actualRando)
      
      dataVM.randos[GetRandoIndex(Rando: actualRando)].avis.append(Avis(utilisateur: dataVM.users[0], note: Double(hikeNote), avis: hikeDescription))
      
        presentationMode.wrappedValue.dismiss()
    }
    
    func notNowButtonPressed() {
        dataVM.users[0].historiqueUtilisateur.append(actualRando)
        presentationMode.wrappedValue.dismiss()
    }
}

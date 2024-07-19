//
//  CopainRandoListeRandosEmpty.swift
//  PasAPas
//
//  Created by SwiftUI Developper on 28/04/2023.
//

//    ===============================YASEMIN ==============================================


import SwiftUI

struct ListeRandosCopainIsEmpty: View {
    
    // MARK: VARIABLES & CONSTANTES
    
    @State var createHikeButtonPressed : Bool = false
    
    @AppStorage ("user_LoegedIn") var userIsLoged : Bool = false
    
    
    // MARK: BODY
    var body: some View {
        VStack (spacing: 0) {
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
                    .fontWeight(.semibold)
                Spacer()
                Button {
                    createHikeButtonPressed.toggle()
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.title)
                        .padding()
                }
   
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(uiColor: .tertiarySystemGroupedBackground))
            ZStack {
                backgroundImage
                VStack (spacing: 30) {
                    texte
                    createHikeButton
                }
            }
            .padding(.horizontal)
            .fullScreenCover(isPresented: $createHikeButtonPressed) {
                CreationRandoCopain()
        }
        }
    }
}


// MARK: PREVIEW
struct CopainRandoListeRandosEmpty_Previews: PreviewProvider {
    static var previews: some View {
        ListeRandosCopainIsEmpty()
    }
}



// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION


private extension ListeRandosCopainIsEmpty {
    
    var backgroundImage: some View {
        ZStack {
            Image("CopainsRandoEmpty")
                .resizable()
                .scaledToFill()
//                .offset(x: -100)
            Rectangle()
                .foregroundColor(.white.opacity(0.7))
        }
    }
    
    var texte: some View {
        Text("Aucune annonces sur CopainsRando actuellement! Voulez vous en créer une ?")
            .font(.headline)
            .multilineTextAlignment(.center)
            .padding()
            .padding(.horizontal, 20)
    }
    
    var createHikeButton: some View {
        Button {
            createHikeButtonIsPressed()
        } label: {
            Text("Créer une randonnée à partager")
                .font(.headline)
                .padding()
        }
        .buttonStyle(.borderedProminent)
    }
    
}


// MARK: FUNCTIONS

private extension ListeRandosCopainIsEmpty {
    
   func createHikeButtonIsPressed() {
   createHikeButtonPressed = true
    }
}

//
//  FavoritesIsEmpty.swift
//  PasAPasFinal
//
//  Created by SwiftUI Developper on 04/05/2023.
//
//    =============================== YASEMIN ==============================================


import SwiftUI

struct FavoritesIsEmpty: View {
    
    // MARK: VARIABLES & CONSTANTES
    
    let larguerMax = UIScreen.main.bounds.width
    var texte = "Vous n'avez pas encore mis de randonnée en favoris"
    @Binding var selectedTab : Int
    
    
    // MARK: BODY
    var body: some View {
        ZStack {
            backgroundImage
            VStack (spacing: 30) {
                Text(texte)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding()
                exploreButton
            }
            .frame(width: larguerMax)
        }
    }
}


// MARK: PREVIEW
struct FavoritesIsEmpty_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesIsEmpty(selectedTab: .constant(2))
    }
}


// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION


private extension FavoritesIsEmpty {
    
    var backgroundImage: some View {
        ZStack {
            Image("FavorisEmpty")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.top)
                .offset(x: -100)
            Rectangle()
                .foregroundColor(.white.opacity(0.7))
                .edgesIgnoringSafeArea(.top)
        }
    }
    
    var exploreButton: some View {
        Button {
            selectedTab = 1
        } label: {
            Text("Explorer les randonnées locales")
                .font(.headline)
                .padding()
        }
        .buttonStyle(.borderedProminent)
    }
}

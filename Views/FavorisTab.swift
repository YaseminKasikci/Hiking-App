//
//  FavorisTab.swift
//  PasAPasFinal
//
//  Created by SwiftUI Developper on 04/05/2023.
//

//    =============================== YASEMIN ==============================================

import SwiftUI

struct FavorisTab: View {
    
    // MARK: VARIABLES & CONSTANTES
    
    @EnvironmentObject private var dataVM: DatasVM
    @State var filterButtonIsPressed : Bool = false
    @Binding var selectedTab : Int
    
    // MARK: BODY
    var body: some View {
        ZStack {
            Color(uiColor: .tertiarySystemBackground)
                .edgesIgnoringSafeArea(.top)
            VStack (spacing: 0) {
                Text("Mes Favoris")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(uiColor: .tertiarySystemGroupedBackground))
                if dataVM.users[0].favoritesHikes.isEmpty {
                    FavoritesIsEmpty(selectedTab: $selectedTab)
                } else {
                    FavoritesList()
                }
                Spacer()
            }
        }
    }
}


// MARK: PREVIEW
struct FavorisTab_Previews: PreviewProvider {
    static var previews: some View {
        FavorisTab(selectedTab: .constant(2))
            .environmentObject(DatasVM())
    }
}


// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION

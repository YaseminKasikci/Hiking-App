//
//  AppFirstScreen.swift
//  PasAPas
//
//  Created by SwiftUI Developper on 25/04/2023.
//

//    =============================== CHRISTOPHER / YASEMIN une partie du Filter ==============================================


import SwiftUI
import MapKit

struct AppFirstScreen: View {

    // MARK: VARIABLES & CONSTANTES
    @EnvironmentObject private var dataVM: DatasVM

    @AppStorage ("first_connection") var isFirstConnection : Bool = true

    @State var firstAppear : Bool = true
    @State private var selectedTab = 1
    var actualUser : Utilisateur
    
    // MARK: BODY
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab){
              ExploreTab()
                    .tabItem({
                        Text("Explorer")
                        Image(systemName: "magnifyingglass")
                    })
                    .tag(1)
                
                FavorisTab(selectedTab: $selectedTab)
                    .tabItem({
                        Text("Favoris")
                        Image(systemName: "heart")
                    })
                    .tag(2)
                CopainsRandoTab()
                    .tabItem({
                        Text("CopainsRando")
                        Image(systemName: "person.2")
                    })
                    .tag(3)
                
                ProfileTab(actualUser: dataVM.users[0])
                    .tabItem({
                        Text("Profil")
                        Image(systemName: "person.crop.circle")
                    })
                    .tag(4)
            }
            .onAppear{
                if firstAppear {
                    dataVM.addAvis()
                    dataVM.addMadeHikes()
                    dataVM.addRandoCopain()
                    dataVM.addMembersAtRandoCopain()
                    dataVM.AddFavorites()
                    dataVM.AddFriends()
                    dataVM.addFriendsToAppUser()
                    firstAppear = false
                }
            }

        }
    }
}

// MARK: PREVIEWS
struct AppFirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        AppFirstScreen(actualUser: DatasVM().users.first!)
            .environmentObject(DatasVM())
    }
}



// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION

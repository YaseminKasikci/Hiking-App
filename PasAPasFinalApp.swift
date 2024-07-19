//

//    =============================== CHRISTOPHER ==============================================


//  PasAPasFinalApp.swift
//  PasAPasFinal
//
//  Created by SwiftUI Developper on 02/05/2023.
//

import SwiftUI

// MARK: NOTES

/*

    - Au Lancement de l'application la data des randonnées et des utilisateurs de

 
    - Ensuite elle va aller chercher dans la mémoire du téléphone pour savoir si l'application à déja été ouverte ou non grâce à la variable @AppStorage isFirstConnection.
 
    - Si l'application n'a jamais été ouverte (isFirstConnection = true), c'est la page OnBoarding() qui va s'afficher.
 
    - Si l'application à déja été ouverte au paravant (isFirstConnection = false), c'est la page  AppFirstScreen() qui se lancera. Comme celle ci demande une valeur pour sa variable actualUser, nous lui atribuons la premier valeur du tableau user (qui se trouve dans la Class DatasVM) grace à la variable : actualUser : Utilisateur = DatasVM().users.first!
 
    - L'init() ici permet de changer les couleurs de certains éléments systeme dans toute l'application pour correspondre aux couleurs de l'app.
 
 */


@main
struct PasAPasFinalApp: App {
    
    // MARK: VARIABLES & CONSTANTES
    
    @AppStorage ("first_connection") var isFirstConnection : Bool = true
    @StateObject var dataVM = DatasVM()
    var actualUser : Utilisateur = DatasVM().users.first!
    
    init() {
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(.accentColor)], for: .selected)
    }
    
    
    // MARK: BODY
    
    var body: some Scene {
        WindowGroup {
            if isFirstConnection {
                OnBoarding()
            } else {
                AppFirstScreen(actualUser: actualUser)
                    .environmentObject(DatasVM())
            }
        }
    }
}



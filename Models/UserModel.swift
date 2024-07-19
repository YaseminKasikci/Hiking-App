//
//  UserModel.swift
//  PasAPas
//
//  Created by SwiftUI Developper on 30/04/2023.
//

//    =============================== CHRISTOPHER, YASEMIN   ==============================================

import Foundation

/* MODEL Utilisateur :
 
 Voici le model Utilisateur! Il comporte toutes les variables et constantes qui caractérisent le Type d'un utilisateur dans notre application. Il est composé d'un Enum NiveauUtilisateur et plusieurs de ces variables sont de type Rando, CopainsRando ou Utilisateur. Il est conforme aux protocoles Identifiable et Equatable.

 */


struct Utilisateur: Identifiable, Equatable {
    
    var id: String = UUID().uuidString
    var nomUtilisateur : String
    var prenomUtilisateur : String
    var bioUtilisateur : String
    var ageUtilisateur : Int
    var photoProfil : String
    var photoCouverture : String
    var profileVerifierUtilisateur : Bool
    var niveauUtilisateur : NiveauUtilisateur
    var copainsUtilisateur : [Utilisateur] = []
    var historiqueUtilisateur : [Rando] = []
    var favoritesHikes : [Rando] = []
    var randosCopainAVenir : [CopainsRando] = []
}

enum NiveauUtilisateur: Equatable, Hashable {
    case debutant,intermedaire, avancé, expert
    
    
}



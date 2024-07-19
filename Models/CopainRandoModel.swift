//
//  CopainRandoModel.swift
//  PasAPas
//
//  Created by SwiftUI Developper on 30/04/2023.
//

//    =============================== CHRISTOPHER ==============================================

import Foundation


/* MODEL CopainsRando :
 
 Voici le model CopainsRando! Il comporte toutes les variables et constantes qui caractérisent le Type d'une randonnée partagée par un utilisateur. Plusieurs de ces variables sont de type Rando ou Utilisateur. Il est conforme aux protocoles Identifiable et Equatable.

 */


struct CopainsRando: Identifiable, Equatable {

    var id: String = UUID().uuidString
    var randoProposee : Rando
    var date : String
    var descriptionCopainsRando : String
    var placeDispo: Int
    var participant: [Utilisateur] = []
    var organisateur : Utilisateur

    
    
}

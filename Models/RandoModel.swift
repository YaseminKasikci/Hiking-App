//
//  RandoModel.swift
//  PasAPas
//
//  Created by SwiftUI Developper on 28/04/2023.
//


//    =============================== CHRISTOPHER ==============================================


import Foundation
import MapKit
import CoreLocation


/* MODEL Rando :
 
 Voici le model Rando! Il comporte toutes les variables et constantes qui caractérisent le Type d'une randonnée dans notre application. Il est composé des sous Types Avis, LLPoints et PointOfInterest ainsi que des Enums Saisons et DirectAlerts. Il est conforme au protocole Identifiable, et la static func nous permet également de la rendre Equatable. Comme notre model comporte une variable coordinates de Type CLLocationCoordinate2D, l'importation de MapKit et CoreLocation était nécéssaire.

 */


struct Rando: Identifiable, Equatable {
    static func == (lhs: Rando, rhs: Rando) -> Bool {
        return lhs.avis == rhs.avis && lhs.saisons == rhs.saisons
    }
    
    var id: String = UUID().uuidString
    var imageCouvertureRando : String
    var nomRando : String
    var niveauRando : Double
    var distance : Int
    var durée : Double
    var denivele : Int
    var descriptionRando : String
    var noteRando : Int = 0
    var avis: [Avis] = []
    var photosRando: [String] = []
    var equipement : [checkListEquipement] = []
    var meteo : [String] = []
    var saisons : [Saisons]
    var coordinates : CLLocationCoordinate2D
    var infoEquipement : String = ""
    var LLDatas : [[CLLocationDegrees]] = []
    var LLCovertedDatas : [LLPoints] = []
    var pointsOfInterest : [PointOfInterest] = []
//    var goodForDogs: Bool = false
//    var goodForChildren : Bool = false
//    var goodForFriends: Bool = false
}

struct Avis: Identifiable, Equatable {
    
    var id: String = UUID().uuidString
    var utilisateur : Utilisateur
    var note : Double
    var avis : String
    
}

struct LLPoints: Identifiable {
    var id: String = UUID().uuidString
    var coordinates : CLLocationCoordinate2D
    
}


enum Saisons: Equatable, Hashable {
    case  janvier ,fevrier, mars, avril, mais, juin, juillet, aout, septembre, octobre, novembre, decembre
}

enum Equipement: Equatable, Hashable {
    case  chaussures, gourde, sacADos, pharmacie, batons, polaire, vetementsPluie, couteau, cremeSolaire, lunettes, chapeau, boussole, nouriture, carte, tente, rechaud, frontale, sacCouchage, TapisSol
}

struct checkListEquipement: Identifiable, Hashable {
    var id = UUID()
    var equipement: Equipement
    var check: Bool = false
}


extension LLPoints: Hashable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.coordinates.latitude == rhs.coordinates.latitude && lhs.coordinates.longitude == rhs.coordinates.longitude
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(coordinates.latitude)
        hasher.combine(coordinates.longitude)
    }
}

enum DirectAlerts: Equatable, Hashable {
    case pointOfView, wrongWay, fauna, flora, waterSpot, dangers, bivouac
}

struct PointOfInterest: Identifiable {
    var id: String = UUID().uuidString
    var coordinates : CLLocationCoordinate2D
    var type : DirectAlerts
    var description : String
    
}

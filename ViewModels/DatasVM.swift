//
//  VM.swift
//  PasAPas
//
//  Created by SwiftUI Developper on 30/04/2023.
//

//    =============================== CHRISTOPHER ==============================================

import Foundation
import CoreLocation

/* DatasVM :
 
 Cette ViewModel(VM) sert à faire la communication entre la data et les differentes vus de l'app. Elle est composée de  :
 
    - 3 tableaux de données en @Published :
 
        - Le Tableau randos qui regroupe toutes les randos de PasAPasData
        - Le Tableau users qui regroupe toutes les utilisateurs de PasAPasData
        - Le Tableau RandoCopains qui regroupe toutes les randonnées partagée par les utilisateurs provenant de PasAPasData
 
    - un init() :
 
        - Qui permet d'imorter la data hikes de PasAPasData dans le tableau randos
        - Qui permet d'imorter la data users de PasAPasData dans le tableau users
        - Cet init() est initialisé dés l'ouverture de l'app
 
    - De 7 fonctions (Func) qui ont un rôle specifique et qui sont appelées à des moments precis de l'application.
 
        - AddFriends() : Permet d'ajouter des amis aux differents utilisateurs du tableau users. Elle est lancée lors du onAppear de la page AppFirstScreen. Celle si ne pouvais pas être placée dans l'init() car les utilisateurs n'existaient pas encore.
 
        - AddFavorites() : Permet d'ajouter des randonnées favorites aux differents utilisateurs du tableau users. Elle est lancée lors du onAppear de la page AppFirstScreen. Celle si ne pouvais pas être placée dans l'init() car les utilisateurs n'existaient pas encore.
 
        - addMadeHikes() : Permet d'ajouter des randonnées déja éffectuée aux differents utilisateurs du tableau users. Elle est lancée lors du onAppear de la page AppFirstScreen. Celle si ne pouvais pas être placée dans l'init() car les utilisateurs n'existaient pas encore.
 
        - addRandoCopain() : Permet d'ajouter des randonnées de Type CopainsRando dans le tableau randoCopains. Elle est lancée lors du onAppear de la page AppFirstScreen. Celle si ne pouvais pas être placée dans l'init() car les randonnées et les utilisateurs n'existaient pas encore.
 
        - addAvis() : Permet d'ajouter des avis d'utilisateurs au differentes randonnées. Elle est lancée lors du onAppear de la page AppFirstScreen. Celle si ne pouvais pas être placée dans l'init() car les randonnées et les utilisateurs n'existaient pas encore.
 
        - ConvertLLPoint() : Permet de convertir une donnée de type [CLLocationDegrees] provenant d'un fichier gpx en Type LLPoints (Voir model Rando) lisible par l'application. Elle est lancée lors de l'execution de la fonction convertData()
 
        - convertData() : Permet de convertir tout un tableau de donnée de type [CLLocationDegrees] provenant d'un fichier gpx en tableau de Type LLPoints (Voir model Rando) lisible par l'application. Elle est executée sur la page InfoRandoCarte lors de l'affichage de la trace gpx sur la carte.

 */


class DatasVM: ObservableObject {
    
    @Published var randos : [Rando] = []
    
    @Published var users : [Utilisateur] = []

    @Published var randoCopains : [CopainsRando] = []
    

    init() {
        let randos = PasAPasData.hikes
        let utilisateurs = PasAPasData.users
        self.randos = randos
        self.users = utilisateurs
    }

    
    func AddFriends() {
        users[1].copainsUtilisateur.append(users[0])
        users[1].copainsUtilisateur.append(users[2])
        users[1].copainsUtilisateur.append(users[4])
        users[1].copainsUtilisateur.append(users[7])
        users[2].copainsUtilisateur.append(users[0])
        users[2].copainsUtilisateur.append(users[1])
        users[2].copainsUtilisateur.append(users[6])
        users[2].copainsUtilisateur.append(users[7])
        users[3].copainsUtilisateur.append(users[0])
        users[3].copainsUtilisateur.append(users[7])
        users[4].copainsUtilisateur.append(users[7])
        users[5].copainsUtilisateur.append(users[1])
        users[5].copainsUtilisateur.append(users[0])
        users[5].copainsUtilisateur.append(users[6])
        users[5].copainsUtilisateur.append(users[4])
        users[6].copainsUtilisateur.append(users[1])
        users[6].copainsUtilisateur.append(users[7])
        users[6].copainsUtilisateur.append(users[5])
        users[6].copainsUtilisateur.append(users[3])
        users[7].copainsUtilisateur.append(users[3])
        users[7].copainsUtilisateur.append(users[1])
        users[7].copainsUtilisateur.append(users[0])
        users[7].copainsUtilisateur.append(users[5])
    }
    
    func addFriendsToAppUser() {
        users[0].copainsUtilisateur.append(users[3])
        users[0].copainsUtilisateur.append(users[4])
        users[0].copainsUtilisateur.append(users[6])
        users[0].copainsUtilisateur.append(users[2])
    }
    
    func AddFavorites() {
        users[0].favoritesHikes.append(randos[0])
        users[0].favoritesHikes.append(randos[2])
        users[0].favoritesHikes.append(randos[3])
        users[0].favoritesHikes.append(randos[7])
        users[1].favoritesHikes.append(randos[7])
        users[1].favoritesHikes.append(randos[2])
        users[1].favoritesHikes.append(randos[4])
        users[2].favoritesHikes.append(randos[7])
        users[2].favoritesHikes.append(randos[5])
        users[2].favoritesHikes.append(randos[0])
        users[3].favoritesHikes.append(randos[7])
        users[3].favoritesHikes.append(randos[0])
        users[3].favoritesHikes.append(randos[1])
        users[3].favoritesHikes.append(randos[6])
        users[3].favoritesHikes.append(randos[3])
        users[4].favoritesHikes.append(randos[1])
        users[4].favoritesHikes.append(randos[2])
        users[4].favoritesHikes.append(randos[3])
        users[4].favoritesHikes.append(randos[5])
        users[5].favoritesHikes.append(randos[7])
        users[5].favoritesHikes.append(randos[4])
        users[5].favoritesHikes.append(randos[2])
        users[6].favoritesHikes.append(randos[4])
        users[7].favoritesHikes.append(randos[5])
        users[7].favoritesHikes.append(randos[7])
        users[7].favoritesHikes.append(randos[0])
        
        
    }
    
    func addMadeHikes() {
        users[1].historiqueUtilisateur.append(DatasVM().randos[1])
        users[1].historiqueUtilisateur.append(DatasVM().randos[2])
        users[1].historiqueUtilisateur.append(DatasVM().randos[6])
        users[1].historiqueUtilisateur.append(DatasVM().randos[7])
        users[0].historiqueUtilisateur.append(DatasVM().randos[1])
        users[0].historiqueUtilisateur.append(DatasVM().randos[5])
        users[0].historiqueUtilisateur.append(DatasVM().randos[7])
        users[0].historiqueUtilisateur.append(DatasVM().randos[3])
        users[0].historiqueUtilisateur.append(DatasVM().randos[4])
        users[2].historiqueUtilisateur.append(DatasVM().randos[2])
        users[2].historiqueUtilisateur.append(DatasVM().randos[5])
        users[3].historiqueUtilisateur.append(DatasVM().randos[5])
        users[3].historiqueUtilisateur.append(DatasVM().randos[1])
        users[3].historiqueUtilisateur.append(DatasVM().randos[6])
        users[3].historiqueUtilisateur.append(DatasVM().randos[7])
        users[4].historiqueUtilisateur.append(DatasVM().randos[5])
        users[4].historiqueUtilisateur.append(DatasVM().randos[1])
        users[4].historiqueUtilisateur.append(DatasVM().randos[0])
        users[5].historiqueUtilisateur.append(DatasVM().randos[5])
        users[5].historiqueUtilisateur.append(DatasVM().randos[4])
        users[5].historiqueUtilisateur.append(DatasVM().randos[0])
        users[6].historiqueUtilisateur.append(DatasVM().randos[0])
        users[7].historiqueUtilisateur.append(DatasVM().randos[5])
        users[7].historiqueUtilisateur.append(DatasVM().randos[7])
        users[7].historiqueUtilisateur.append(DatasVM().randos[3])
    }
    
    func addRandoCopain() {

        let randoCopain1 : CopainsRando = CopainsRando(randoProposee: DatasVM().randos[1],
                                                       date: "12 Juin",
                                                       descriptionCopainsRando: "Hello tout le monde. Des motivé(e)s pour m'accompagner sur la rando du massif de Serrac? ",
                                                       placeDispo: 5,
                                                       organisateur: DatasVM().users[1])

        let randoCopain2 : CopainsRando = CopainsRando(randoProposee: DatasVM().randos[0],
                                                       date: "02 Juillet",
                                                       descriptionCopainsRando: "Je me lance dans la rando du lac des marmottes le 2 juillet, je serais ravis de la partager avec vous.",
                                                       placeDispo: 3,
                                                       participant: [DatasVM().users[1], DatasVM().users[4]],
                                                       organisateur: DatasVM().users[0])

        let randoCopain3 : CopainsRando = CopainsRando(randoProposee: DatasVM().randos[1],
                                                       date: "09 Juillet",
                                                       descriptionCopainsRando: "J'aimerais me challenger sur la rando du massif de Serrac début Juillet. Des copains de randos pour m'accompagner? Attention: Niveau de la rando expert.",
                                                       placeDispo: 4,
                                                       participant: [DatasVM().users[5], DatasVM().users[2], DatasVM().users[1]],
                                                       organisateur: DatasVM().users[6])
        
        let randoCopain4 : CopainsRando = CopainsRando(randoProposee: DatasVM().randos[7],
                                                       date: "09 Juillet",
                                                       descriptionCopainsRando: "Salut les marcheurs, des gens cool pour m'accompagner sur cette randonné ? Je paie l'apéro!",
                                                       placeDispo: 3,
                                                       participant: [DatasVM().users[3]],
                                                       organisateur: DatasVM().users[7])

        
        let randoCopain5 : CopainsRando = CopainsRando(randoProposee: DatasVM().randos[5],
                                                       date: "09 Juillet",
                                                       descriptionCopainsRando: "Jeune maman, recherche d'autres personnes pour nous accompagner et initer mes enfants à la randonnée. On vous attand.",
                                                       placeDispo: 5,
                                                       participant: [DatasVM().users[0], DatasVM().users[5]],
                                                       organisateur: DatasVM().users[4])


        self.randoCopains.append(randoCopain1)
//        DatasVM().users[1].randosCopainAVenir.append(randoCopain1)
        self.randoCopains.append(randoCopain2)
//        DatasVM().users[0].randosCopainAVenir.append(randoCopain2)
        self.randoCopains.append(randoCopain3)
//        DatasVM().users[6].randosCopainAVenir.append(randoCopain3)
        self.randoCopains.append(randoCopain4)
//        DatasVM().users[7].randosCopainAVenir.append(randoCopain4)
        self.randoCopains.append(randoCopain5)
//        DatasVM().users[4].randosCopainAVenir.append(randoCopain5)
    }
    
    func addMembersAtRandoCopain() {

        self.users[0].randosCopainAVenir.append(self.randoCopains[1])
        self.users[0].randosCopainAVenir.append(self.randoCopains[4])

    }
    
    func addAvis() {
        let avis: Avis =  Avis(utilisateur: DatasVM().users[0], note: 4, avis: "Facile et plaisante")
        let avis2: Avis =  Avis(utilisateur: DatasVM().users[0], note: 3, avis: "Sublime")
        
        let avis3: Avis =  Avis(utilisateur: DatasVM().users[2], note: 5, avis: "Une randonnée alignée au niveau des difficultés attendues. Pleines de jolies surprises on a eu la chance de voir des marmottes. Mes petits enfants ont pu les observer hors de leurs terriers🦫. Un vrai kiffe")
        
        let avis4: Avis =  Avis(utilisateur: DatasVM().users[0], note: 4, avis: "J'ai partagé cette première randonnée avec Victor de copainRando. Il nous a fait découvrir la faune et la flore de façon très ludique. Merci Victor")
        
        let avis5: Avis =  Avis(utilisateur: DatasVM().users[1], note: 3, avis: "Une randonnée en famille un peu gâchée par la pluie. Dommage que le beau temps n'ait pas été au rendez-vous. Heureusement que l'application nous a permis d'anticiper l'orage, on a pu se mettre à l'abri rapidement non loin du refuge du Mont-Ventoux.")
        
        let avis6: Avis =  Avis(utilisateur: DatasVM().users[1], note: 5, avis: "Super rando. On a marché jusqu'à la Grande Quille. J'ai particulièrement apprécié ce moment de partage avec les autres membres de copainRando.")
        
        let avis7: Avis =  Avis(utilisateur: DatasVM().users[2], note: 5, avis: "Avec les sisters 👯‍♀️ on avait envie de découvrir la région tranquillement. On a suivi les recommandations de l'application pour nous équiper merci pour les infos on a pu partir en étant sûr que nous portions des vêtements adaptés à la randonnée.")
        
        let avis8: Avis =  Avis(utilisateur: DatasVM().users[3], note: 4, avis: "Je vous conseille de partir tôt le matin pour profiter pleinement de la journée. Le repas de fin de rando à la ferme de l'auberge du côté du Mont-Cousin vous permet de vous reposer. Délicieux")
        
        let avis9: Avis =  Avis(utilisateur: DatasVM().users[4], note: 1, avis: "Balade en solo du côté des 3 vallées. Un vrai cauchemar. Un dénivelet un peu trop important pour mes petites jambes. N'étant pas une grand sportive. J'ai fini avec des ampoules aux pieds. Pouvez-vous revoir les critères d'attribution de ce niveau et préciser dans les infos à prévoir une trousse de pharmacie.")
        
        let avis10: Avis =  Avis(utilisateur: DatasVM().users[5], note: 5, avis: "Belle promenade on s'est régalé. Une journée de déconnexion totale en pleine nature pour l'enterrement de vie de garçon de notre meilleur ami. Il a adoré marcher en talons aiguilles (même si ce n'était pas recommandé dans la liste du matériel.) sur le GR 37. Si vous trouvez une perruque rose acrochée à un arbre on serait content de la récupérer")
        
        let avis11: Avis =  Avis(utilisateur: DatasVM().users[6], note: 4, avis: "Balade entre filles durant le weekend de la Pentecôte. On a téléchargé le parcours de notre rando sur nos téléphones portables avant notre périple quand on a plus eu de réseau au milieu de notre randonnée on a été contente d'avoir trouvé cette solution de repli. C'est très bien pensé merci PasAPas")
        
        let avis12: Avis =  Avis(utilisateur: DatasVM().users[6], note: 4, avis: "Balade entre filles @boyscouts on a récupéré la perruque rose elle est MAGNIFIQUE 😂. Hâte de partager nos photos respectives autour d'un verre.")
        
        let avis13: Avis =  Avis(utilisateur: DatasVM().users[7], note: 5, avis: "Une balade magique, facile à faire pour les non-initiés. Le point d'eau indiqué sur la carte sera gravé à vie dans ma mémoire mon compagnon m'a demandé en mariage et j'ai dit \"Oui\". A recommander")
        
        self.randos[0].avis.append(avis)
        self.randos[6].avis.append(avis2)
        self.randos[0].avis.append(avis3)
        self.randos[1].avis.append(avis4)
        self.randos[1].avis.append(avis5)
        self.randos[2].avis.append(avis4)
        self.randos[2].avis.append(avis)
        self.randos[2].avis.append(avis2)
        self.randos[3].avis.append(avis4)
        self.randos[3].avis.append(avis6)
        self.randos[3].avis.append(avis7)
        self.randos[3].avis.append(avis8)
        self.randos[4].avis.append(avis9)
        self.randos[4].avis.append(avis10)
        self.randos[4].avis.append(avis11)
        self.randos[4].avis.append(avis12)
        self.randos[5].avis.append(avis9)
        self.randos[5].avis.append(avis13)
        self.randos[5].avis.append(avis)
        self.randos[5].avis.append(avis4)
        self.randos[5].avis.append(avis7)
        self.randos[6].avis.append(avis7)
        self.randos[6].avis.append(avis8)
        self.randos[6].avis.append(avis12)
        self.randos[6].avis.append(avis2)
      
        
    
    }
    
    func ConvertLLPoint(llPoint: [CLLocationDegrees]) -> LLPoints {
        let coordinates : LLPoints = LLPoints(coordinates: CLLocationCoordinate2D(latitude: llPoint[1] , longitude: llPoint[0] ))
    return coordinates
    }

    func convertData(Data: [[CLLocationDegrees]]) -> [LLPoints] {
    var convertedData : [LLPoints] = []
    for data in Data {
    convertedData.append(ConvertLLPoint(llPoint: data))
    }
    return convertedData
    }

   
    
}

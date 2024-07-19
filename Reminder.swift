

// Ici, les differents marqueurs à intégrer aux vues pour ranger le code


// MARK: VARIABLES & CONSTANTES

// MARK: BODY

// MARK: PREVIEW

// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION



// Ici, quelques lignes de code classiques à réutiliser dans les vues.


// MARK: POUR CRÉER UN TYPE IDENTIFIABLE PERSONNALISÉ :
/*

 struct NomDuType: Identifiable {
 
 var id = UUID()
 var variable1 : TypeVariable1
 var variable2 : TypeVariable2
 ...
 
 }
 
 */



// MARK: POUR CRÉER UNE CLASS ET UN TABLEAU PUBLISHED :
/*

 class NomDeLaClass: ObservableObject {

     @Published var nomDuTableau : [TypeDuTableau] = []

 }
 
 */



// MARK: POUR CRÉER UNE VARIABLE STOQUÉE DANS LA MÉMOIRE DU TÉLÉPHONE :
/*
 
 @AppStorage ("nom_de_la_variable") var nomDeLaVariable : TypeDeLaVariable = VALEUR
 
 */


// MARK: POUR OBSERVER LES DONNÉES D'UNE CLASS :
/*
 
    - Sur la première vue:
    @StateObject var nomDeLaVariable = NomDeLaClass()
 
    - Sur les vues suivantes:
    @EnvironmentObject var nomDeLaVariable: NomDeLaClass
 
    - Toujours rajouter sur les previews:
    .environmentObject(DatasVM())
 
 */



// MARK: POUR AVOIR LA LARGEUR ET/OU LA HAUTEUR EXACTE DU DIVICE :
/*
 
    - LARGEUR:
    UIScreen.main.bounds.width
 
    - HAUTEUR:
    UIScreen.main.bounds.height
 
 */



// MARK: :
/*
 

 
 */

//
//  OnBoardingPage1.swift
//  PasAPasFinal
//
//  Created by SwiftUI Developper on 02/05/2023.
//

//    =============================== ASSETOU ==============================================

import SwiftUI

struct OnBoardingPage1: View {
    
    // MARK: VARIABLES & CONSTANTES
    
    private var backgroundImage : String = "OnBoarding1"
    private var titre : String = "Bienvenue"
    private var titre2 : String = "sur l'application PAS A PAS"
    private var paragraphe1 : String = "Découvrez les randonnées de votre région sortez des sentiers battus!"
    private var paragraphe2 : String = "En famille, entre amis ou en solo, trouvez LA randonnée qui vous correspond à la journée."
    
    // MARK: BODY
    var body: some View {
        ZStack {
            BackgroundImage(image: backgroundImage)
            VStack {
                Spacer()
                
                
                LogoOnBoarding(titre: titre, titre2: titre2)
                //Spacer()
                VStack (spacing: 50) {
                    Paragraphe(texte: paragraphe1)
                    Paragraphe(texte: paragraphe2)
                }
                //Spacer()
                Spacer()
                Spacer()
            }
            .padding()
        }
        //.ignoresSafeArea()
    }
}


// MARK: PREVIEW
struct OnBoardingPage1_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPage1()
    }
}


// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION

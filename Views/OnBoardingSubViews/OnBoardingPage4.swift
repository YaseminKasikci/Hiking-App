//
//  OnBoardingPage4.swift
//  PasAPasFinal
//
//  Created by SwiftUI Developper on 02/05/2023.
//

//    =============================== ASSETOU ==============================================

import SwiftUI

struct OnBoardingPage4: View {
    
    // MARK: VARIABLES & CONSTANTES
    
    private var backgroundImage : String = "OnBoarding4"
    private  var titre : String = "CopainsRando"
    private  var titre2 : String = "Une bonne idée de randonnée et vous appréhendez de partir seul."
    private var paragraphe1 : String = "Pas à Pas peut va vous guider en vous connectant avec d'autres randonneurs de la région.!"
    private var paragraphe2 : String = "Randonnez en toute sérenité avec des personnes aussi passionnées que vous."
    
    // MARK: BODY
    var body: some View {
        ZStack {
            BackgroundImage(image: backgroundImage)
            VStack {
                Spacer()
                LogoOnBoarding(titre: titre, titre2: titre2)
                VStack (spacing: 50) {
                    Paragraphe(texte: paragraphe1)
                    Paragraphe(texte: paragraphe2)
                }
                Spacer()
                Spacer()
                Spacer()
            }
            .padding()
        }
        //.ignoresSafeArea()
    }
}


// MARK: PREVIEW
struct OnBoardingPage4_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPage4()
    }
}


// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION

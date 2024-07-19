//
//  OnBoardingPage3.swift
//  PasAPasFinal
//
//  Created by SwiftUI Developper on 02/05/2023.
//

//    =============================== ASSETOU ==============================================

import SwiftUI

struct OnBoardingPage3: View {
    
    // MARK: VARIABLES & CONSTANTES
    
    private var backgroundImage : String = "OnBoarding3"
    private  var titre : String = "Anticipe"
    private  var titre2 : String = "Fais en sorte que ta randonnée sois unique"
    private var paragraphe1 : String = "On a beau tout prévoir et tout organiser on peut se retrouver dans des situations inconfortables."
    private var paragraphe2 : String = "Pas à Pas va te permettre d'anticiper les fondamentaux d'un bon randonneur pour que tu puisses passer une belle randonnée."
    
    // MARK: BODY
    var body: some View {
        ZStack {
            BackgroundImage(image: backgroundImage)
            VStack {
                Spacer()
                Spacer()
                LogoOnBoarding(titre: titre, titre2: titre2)
                Spacer()
                
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
struct OnBoardingPage3_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPage3()
    }
}


// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION

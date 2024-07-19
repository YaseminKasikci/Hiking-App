//
//  OnBoardingPage2.swift
//  PasAPasFinal
//
//  Created by SwiftUI Developper on 02/05/2023.
//

//    =============================== ASSETOU ==============================================

import SwiftUI

struct OnBoardingPage2: View {
    
    // MARK: VARIABLES & CONSTANTES
    
    private var backgroundImage : String = "OnBoarding2"
    private  var titre : String = "Explore"
    private  var titre2 : String = "Optimisez votre randonnée en toute tranquillité"
    private var paragraphe1 : String = "Pas à Pas vous donnent accès à de nombreuses randonnées!"
    private var paragraphe2 : String = "Vous pourrez gérer à votre rythme la randonnée la plus adaptée à votre niveau."
    
    // MARK: BODY
    var body: some View {
        ZStack {
            Spacer()
            BackgroundImage(image: backgroundImage)
            VStack {
                Spacer()
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
struct OnBoardingPage2_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPage2()
    }
}


// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION

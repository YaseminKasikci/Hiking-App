//
//  OnBoardingPage2.swift
//  PasAPasFinal
//
//  Created by SwiftUI Developper on 02/05/2023.
//

//    =============================== ASSETOU ==============================================

import SwiftUI

struct OnBoardingPage0: View {
    
    // MARK: VARIABLES & CONSTANTES
    
    private var backgroundImage : String = "Image6"
    private  var titre : String = "Bienvenue"
    private  var titre2 : String = ""
    private var paragraphe1 : String = ""
    private var paragraphe2 : String = ""
    
    // MARK: BODY
    var body: some View {
        ZStack {
            BackgroundImage(image: backgroundImage)
            VStack {
                Spacer()
                LogoOnBoarding(titre: titre, titre2: titre2)
                Text("Sur l'application")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Text("Pas A Pas")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                Spacer()
            }
        }
    }
}


// MARK: PREVIEW
struct OnBoardingPage0_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPage0()
    }
}


// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION


struct LogoOnBoarding: View {
    var larguerMax = UIScreen.main.bounds.width*0.9
    var titre : String
    var titre2 : String
    
    var body: some View {
        VStack {
            Image(systemName: "mountain.2.fill")
                .font(.system(size:80))
                .foregroundColor(.white)
            Text (titre)
                .font(.largeTitle)
                .foregroundColor(.white)
                .fontDesign(.serif)
                .fontWeight(.black)
            Text(titre2)
                .bold()
                .font(.body)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .font(.system(size:20))
                .frame(width: larguerMax)
                .padding(.bottom,110)
        }
    }
}

struct BackgroundImage: View {
    var image : String
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(width: .infinity, height: 900)
            .opacity(0.8)
            .overlay {
                Color.black.opacity(0.2)
            }
    }
}

struct Paragraphe: View {
    var texte : String
    var larguerMax = UIScreen.main.bounds.width*0.9
    var body: some View {
        Text(texte)
            .multilineTextAlignment(.center)
            .bold()
            .font(.body)
            .foregroundColor(.white)
            .font(.system(size:20))
            .frame(width: larguerMax)
    }
}

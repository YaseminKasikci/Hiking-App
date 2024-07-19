//
//  OnBoarding.swift
//  PasAPasFinal
//
//  Created by SwiftUI Developper on 02/05/2023.
//


//    =============================== ASSETOU ==============================================

import SwiftUI

struct OnBoarding: View {
    
    // MARK: VARIABLES & CONSTANTES
    
    @AppStorage ("first_connection") var isFirstConnection : Bool = true
    @State var actualOnBoardingPage: Int = 0
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    
    
    // MARK: BODY
    var body: some View {
        ZStack {
            TabView (selection: $actualOnBoardingPage){
                OnBoardingPage0()
                    .transition(transition)
                    .tag(0)
                OnBoardingPage1()
                    .transition(transition)
                    .tag(1)
                OnBoardingPage2()
                    .transition(transition)
                    .tag(2)
                OnBoardingPage3()
                    .transition(transition)
                    .tag(3)
                OnBoardingPage4()
                    .transition(transition)
                    .tag(4)
            }
            .tabViewStyle(.page)
            VStack {
                HStack {
                    Spacer()
                    Button {
                        isFirstConnection = false
                    } label: {
                        Text("Passer")
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                Spacer()
                Button {
                    actualOnBoardingPage += 1
                } label: {
                    OnBoardingButton
                }
                .padding(.horizontal)
            }
            .frame(height: UIScreen.main.bounds.height*0.9)
        }
        .ignoresSafeArea()
        .frame(height: UIScreen.main.bounds.height)
    }
}


// MARK: PREVIEW
struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}


// MARK: ELEMENTS EXTENTION

private extension OnBoarding {
    
    var OnBoardingButton: some View {
        Text (actualOnBoardingPage == 4 ? "Commencer" :
                actualOnBoardingPage == 0 ? "Découvrir" :
                "Suivant")
        .font (.headline)
        .foregroundColor(.white)
        .frame (height: 55)
        .frame (maxWidth: .infinity)
        .background (Color .accentColor)
        .cornerRadius (10)
        .onTapGesture {
            onBoardingButtonPressed()
        }
    }
}

// MARK: FONCTIONS EXTENTION

private extension OnBoarding {
    
    func onBoardingButtonPressed() {
        if actualOnBoardingPage == 4 {
            isFirstConnection = false
        } else {
            withAnimation (.spring()) {
                actualOnBoardingPage += 1
            }
        }
    }
}

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION



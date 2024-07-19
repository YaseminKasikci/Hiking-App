//
//  CopainsRandoTab.swift
//  PasAPasFinal
//
//  Created by SwiftUI Developper on 04/05/2023.
//

//    =============================== CHRISTOPHER ==============================================

import SwiftUI

struct CopainsRandoTab: View {
    
    @AppStorage ("user_LoegedIn") var userIsLoged : Bool = false
    @EnvironmentObject var dataVM: DatasVM
    
    var listeIsEmpty: Bool { (dataVM.randoCopains.isEmpty ? true : false)}
    
    // MARK: BODY
    var body: some View {
        NavigationStack {
            if !userIsLoged {
                LogingPage()
            } else if userIsLoged && listeIsEmpty {
                    ListeRandosCopainIsEmpty()
            } else if userIsLoged && !listeIsEmpty {
                ListeRandosCopain()
            }
        }
    }
}


// MARK: PREVIEW
struct CopainsRandoTab_Previews: PreviewProvider {
    static var previews: some View {
        CopainsRandoTab()
            .environmentObject(DatasVM())
    }
}


// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION

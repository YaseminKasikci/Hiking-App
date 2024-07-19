//
//  CopainRandoCreationCompte.swift
//  PasAPas
//
//  Created by SwiftUI Developper on 25/04/2023.
//
//    =============================== CHRISTOPHER ==============================================


import SwiftUI
import PhotosUI

struct CreationCompte: View {

    // MARK: VARIABLES & CONSTANTES
    
    @EnvironmentObject private var dataVM: DatasVM
    @AppStorage ("user_LoegedIn") var userIsLoged : Bool = false
    @Environment (\.presentationMode) var presentationMode
    @State var profilePicImported: [PhotosPickerItem] = []
    
    @State private var nomText : String = ""
    @State private var prenomText : String = ""
    @State private var emailtext : String = ""
    @State private var motDePasseText : String = ""
    @State private var motDePasseVerifText : String = ""
    @State private var niveauValue : Double = 0
    
    @State var showAlert : Bool = false
    @State var alerteMessage : String = ""
    
    // MARK: BODY
    var body: some View {
        ZStack {
            Color(uiColor: .tertiarySystemBackground)
                .edgesIgnoringSafeArea(.top)
            ScrollView{
                VStack (spacing: 20){
                    cancelButton
                    VStack {
                        addPhotoButton
                        textField(nomTextField: "Prénom", textFieldText: "Votre prénom" ,link: $prenomText)
                        textField(nomTextField: "Nom", textFieldText: "Votre nom" ,link: $nomText)
                        levelSlider
                        textField(nomTextField: "E-Mail", textFieldText: "Votre e-mail" ,link: $emailtext)
                        secureTextFieldBloc(nomTextField: "Mot de Passe",textFieldText: "Votre mot de passe" , link: $motDePasseText)
                        secureTextFieldBloc(nomTextField: "Vérification Mot de Passe",textFieldText: "Vérifiez votre mot de passe" , link: $motDePasseVerifText)
                        createProfileButton
                    }
                }
            }
            .alert(isPresented: $showAlert, content: {
                    return Alert(title: Text(alerteMessage))
        })
        }
    }
}


// MARK: PREVIEWS
struct CreationCompte_Previews: PreviewProvider {
    static var previews: some View {
        CreationCompte()
            .environmentObject(DatasVM())
    }
}


// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION


private extension CreationCompte {
    
    var cancelButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            HStack {
                Text("Annuler")
                Spacer()
            }
            .padding()
        }
    }
    
    var addPhotoButton: some View {
        PhotosPicker(selection: $profilePicImported,
                     matching: .any(of: [.images, .not(.panoramas)])) {
            ZStack {
                Circle()
                    .frame(width: 100)
                    .foregroundColor(Color(uiColor: .tertiarySystemFill))
                    .overlay {
                        Circle().strokeBorder(lineWidth: 2)
                    }
                Image(systemName: "plus")
                    .font(.title)
            }
        }
    }
    
    var levelSlider: some View {
        VStack {
            Text("Votre niveau en randonnée")
                .font(.headline)
            Slider(value: $niveauValue, in: 0...3, step: 1) {
            }
            .padding()
            .padding(.horizontal)
            Text(niveauValue == 0 ? "Débutant" : niveauValue == 1 ? "Intermediaire" : niveauValue == 2 ? "Avancé" : "Expert")
        }
        .padding(.top, 30)
    }
    
    var createProfileButton: some View {
        Button {
            createProfileButtonIsPressed(nomUtilisateur: nomText, prenomUtilisateur: prenomText, niveauUtilisateur: niveauValue)
        } label: {
            Text("Créer mon compte")
                .padding()
                .padding(.horizontal)
        }
        .buttonStyle(.borderedProminent)
        .padding()
        .padding(.vertical)
        .padding(.vertical)
    }
}

private struct textField: View {
    var nomTextField : String = "Nom"
    var textFieldText : String = "Nom"
    var link : Binding<String>
    var body: some View {
        HStack {
            Text(nomTextField)
                .font(.headline)
            Spacer()
        }
        .padding()
        TextField("\(textFieldText)", text: link)
            .padding()
            .textFieldStyle(.plain)
            .background(Color(uiColor: .tertiarySystemBackground))
            .cornerRadius(10)
            .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.accentColor, lineWidth: 2)
                )
            .padding(.horizontal)
    }
}

private struct secureTextFieldBloc: View {
    var nomTextField : String = "Nom"
    var textFieldText : String = "Nom"
    var link : Binding<String>
    
    var body: some View {
        HStack {
            Text(nomTextField)
                .font(.headline)
            Spacer()
        }
        .padding()
        SecureField(textFieldText, text: link)
            .padding()
            .textFieldStyle(.plain)
            .background(Color(uiColor: .tertiarySystemBackground))
            .cornerRadius(10)
            .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.accentColor, lineWidth: 2)
                )
            .padding(.horizontal)
    }
}


// MARK: Functions

extension CreationCompte {

    func createProfileButtonIsPressed(nomUtilisateur: String, prenomUtilisateur : String, niveauUtilisateur : Double) {
        let newUser : Utilisateur = Utilisateur(nomUtilisateur: nomUtilisateur, prenomUtilisateur: prenomUtilisateur, bioUtilisateur: "", ageUtilisateur: 20, photoProfil: "", photoCouverture: "Couv1", profileVerifierUtilisateur: false, niveauUtilisateur: niveauUtilisateur == 0 ? .debutant : niveauUtilisateur == 1 ? .intermedaire : niveauUtilisateur == 2 ? .avancé : niveauUtilisateur == 3 ? .expert : .debutant)
        if nomText.count < 3 {
              return showAlert(alertTitle: "Votre nom doit comporter au moins 3 caractères.")
         } else if prenomText.count < 3 {
             return showAlert(alertTitle: "Votre Prénom doit comporter au moins 3 caractères.")
         } else if motDePasseText.count < 8 {
             return showAlert(alertTitle: "le mot de passe doit comporter au moins 8 caratères")
         } else if motDePasseText != motDePasseVerifText {
             return showAlert(alertTitle: "La vérification du mot de passe ne correspond pas au mot de passe")
        } else {
            dataVM.users.append(newUser)
            userIsLoged = true
        }
    }
    
    func showAlert(alertTitle : String) {
        self.alerteMessage = alertTitle
        showAlert.toggle()
    }

}

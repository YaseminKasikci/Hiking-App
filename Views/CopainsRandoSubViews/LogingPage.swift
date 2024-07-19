//
//  CopainRandoLoginPage.swift
//  PasAPas
//
//  Created by SwiftUI Developper on 25/04/2023.
//

//    =============================== CHRISTOPHER ==============================================


import SwiftUI

struct LogingPage: View {

    // MARK: VARIABLES & CONSTANTES
    
    @AppStorage ("user_LoegedIn") var userIsLoged : Bool = false
    let larguerMax = UIScreen.main.bounds.width
    
    @State var emailtext : String = ""
    @State var passwordText :String = ""
    @State var creerUnCompteIsPressed : Bool = false
    @State var showAlert : Bool = false
    
    let backgroudImage : String = "CopainRandoConnection"
    
    // MARK: BODY
    var body: some View {
        ZStack {
            backgroundImage
            VStack {
                Spacer()
                textDescription
                textFields
                forgottenPasswordButton
                Spacer()
                connectionButton
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $creerUnCompteIsPressed) {
            CreationCompte()
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Identifiants Invalides"))
        }
    }
}


// MARK: PREVIEWS
struct LogingPage_Previews: PreviewProvider {
    static var previews: some View {
        LogingPage()
    }
}


// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION


private extension LogingPage {
    
    var backgroundImage: some View {
        ZStack {
            Image(backgroudImage)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.top)
            Rectangle()
                .foregroundColor(Color(uiColor: .tertiarySystemBackground).opacity(0.7))
                .edgesIgnoringSafeArea(.top)
        }
    }
    
    var textDescription: some View {
        VStack (spacing: 20) {
            Text("CopainsRando")
                .font(.largeTitle)
                .fontWeight(.black)
            Text("CopainsRando est un service qui permet aux utilisateurs de proposer ou de rejoindre des randonnées afin de permettre au plus grand nombre l’initiation au sport préféré des français.")
            Text("Pour utiliser CopainsRando, vous devez vous connecter ou créer un compte.")
        }
        .multilineTextAlignment(.center)
        .frame(width: larguerMax*0.9)
        .padding()
    }
    
    var textFields: some View {
        VStack (spacing: 5){
            textField(nomTextField: "  E-mail", textFieldText: "Votre adresse e-mail" ,link: $emailtext)
            HStack {
                Text("Mot de Passe")
                    .font(.headline)
                Spacer()
            }
            .padding()
            SecureField("Votre mot de passe ", text: $passwordText)
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
        .frame(width: larguerMax)
    }
    
    var forgottenPasswordButton: some View {
        Button {
            //
        } label: {
            HStack {
                Spacer()
                Text("Mot de passe oublié ?")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .frame(width: 330)
        }
    }
    
    var connectionButton: some View {
        VStack (spacing: 20){
            Button {
                connectionButtonIsPressed()
            } label: {
                Text("CONNECTION")
                    .font(.headline)
                    .padding(10)
                    .padding(.horizontal, 40)
            }
            .buttonStyle(.borderedProminent)
            VStack {
                Text("Vous n'avez pas de comptes ?")
                Button {
                    creerUnCompteIsPressed.toggle()
                } label: {
                    Text("Créer un compte")
                        .font(.headline)
                }
            }
        }
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
        TextField(textFieldText, text: link)
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


// MARK: FUNCTIONS
private extension LogingPage {
    
    func connectionButtonIsPressed() {
        if emailtext.lowercased() == "robinsons" && passwordText == "12345" {
           userIsLoged = true
        } else {
            showAlert.toggle()
        }
    }
}

//
//  StartHikeSubView.swift
//  PasAPasFinal
//
//  Created by SwiftUI Developper on 07/05/2023.
////    =============================== CHRISTOPHER ==============================================


import SwiftUI

struct StartHikeSubView: View {
    
    // MARK: VARIABLES & CONSTANTES
    
    @State var pointsOfViewAlert : Bool = false
    @State var wrongDirectionAlert : Bool = false
    @State var floraAlert : Bool = false
    @State var FaunaAlert : Bool = false
    @State var waterPointsAlert : Bool = false
    @State var bivouacAlert : Bool = false
    @State var dangersAlert : Bool = true
    
    @Binding var letsGoButtonPressed : Bool
    
    
    // MARK: BODY
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Material.ultraThick)
                .frame(width: 330, height: 480)
                .shadow(radius: 10)
            VStack {
                Text("Soyez avertis lorsque vous approcher des points suivants ")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding()
                VStack {
                    Toggle(isOn: $pointsOfViewAlert) {
                        Text("Points de vue")
                            .toggleStyle(.switch)
                    }
                    Toggle(isOn: $wrongDirectionAlert) {
                        Text("Mauvaises directions")
                    }
                    Toggle(isOn: $floraAlert) {
                        Text("Flores")
                    }
                    Toggle(isOn: $FaunaAlert) {
                        Text("Faunes")
                    }
                    Toggle(isOn: $waterPointsAlert) {
                        Text("Points d'eaux")
                    }
                    Toggle(isOn: $bivouacAlert) {
                        Text("Bivouacs")
                    }
                    Toggle(isOn: $dangersAlert) {
                        Text("Dangers")
                    }
                }
                .toggleStyle(SwitchToggleStyle(tint: Color.accentColor))
                .padding()
                
                Button {
                    withAnimation(.spring(response: 0.6)) {
                        letsGoButtonPressed.toggle()
                    }
                } label: {
                    Text("C'est parti")
                }
                .buttonStyle(.borderedProminent)
                
            }
            .frame(width: 300, height: 500)
            .padding()
          
        }
    }
}


// MARK: PREVIEW
struct StartHikeSubView_Previews: PreviewProvider {
    static var previews: some View {
        StartHikeSubView(letsGoButtonPressed: .constant(true))
    }
}


// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION

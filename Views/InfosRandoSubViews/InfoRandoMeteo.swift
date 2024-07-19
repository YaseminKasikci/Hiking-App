//
//  InfoRandoMeteo.swift
//  PasAPasFinal
//
//  Created by SwiftUI Developper on 05/05/2023.
//

//    =============================== BILAL ==============================================


import SwiftUI

struct InfoRandoMeteo: View {
    
    // MARK: VARIABLES & CONSTANTES
    
    
    // MARK: BODY
    var body: some View {
        ZStack {
            Color(uiColor: .tertiarySystemBackground)
                .edgesIgnoringSafeArea(.bottom)
            VStack {
                ScrollView {
                    VStack (spacing: 30) {
                        TuileMeteo(temperatureMoyenne: 21, weatherIconBig: "sun.max.fill", jour: "Mardi 16 Mai")
                        TuileMeteo(temperatureMoyenne: 21, weatherIconBig: "cloud.sun.fill", jour: "Mercredi 17 Mai")
                        TuileMeteo(temperatureMoyenne: 24, weatherIconBig: "sun.max.fill", jour: "Jeudi 18 Mai")
                        TuileMeteo(temperatureMoyenne: 22, weatherIconBig: "cloud.sun.rain.fill", jour: "Vendredi 19 Mai")
                        TuileMeteo(temperatureMoyenne: 18, weatherIconBig: "cloud.rain.fill", jour: "Samedi 20 Mai")
                    }
                }
                .padding(.vertical)
            }
        }
    }
}


// MARK: PREVIEW
struct InfoRandoMeteo_Previews: PreviewProvider {
    static var previews: some View {
        InfoRandoMeteo()
    }
}


// MARK: ELEMENTS EXTENTION

// MARK: FONCTIONS EXTENTION

// MARK: COMPOSANTS

// MARK: COMPOSANTS EXTENTION


struct MeteoJournee: View {
    
    let heure : String
    let temperature : String
    let weatherIcon : String
    
    var body: some View {
        VStack (spacing: 10){
            Text(heure)
            Image(systemName: weatherIcon)
                .font(.title)
                .symbolRenderingMode(.multicolor)
            Text("\(temperature)°")
        }
        .font(.headline)
    }
}

struct TuileMeteo : View {
    
    let backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.white, Color.accentColor]),
        startPoint: .topLeading, endPoint: .bottom)
    let temperatureMoyenne : Int
    let weatherIconBig : String
    let jour : String
    
    var body: some View {
        VStack(alignment: .trailing,spacing: 15){
            HStack (alignment: .lastTextBaseline){
                Spacer()
                Text(jour)
                    .font(.title3)
                    .fontWeight(.bold)
                Spacer()
                Text("\(temperatureMoyenne)°")
                    .font(.system(size: 50))
                Image(systemName: weatherIconBig)
                    .symbolRenderingMode(.multicolor)
                    .font(.system(size: 60))
                Spacer()
            }
            ScrollView (.horizontal, showsIndicators: false){
                HStack(spacing: 15){
                    Group {
                        MeteoJournee(heure: "1:00", temperature: "3", weatherIcon: "cloud.moon.fill")
                        MeteoJournee(heure: "2:00", temperature: "3", weatherIcon: "cloud.moon.fill")
                        MeteoJournee(heure: "3:00", temperature: "4", weatherIcon: "cloud.moon.fill")
                        MeteoJournee(heure: "4:00", temperature: "4", weatherIcon: "cloud.moon.fill")
                        MeteoJournee(heure: "5:00", temperature: "4", weatherIcon: "cloud.moon.fill")
                        MeteoJournee(heure: "6:00", temperature: "4", weatherIcon: "cloud.moon.fill")
                        MeteoJournee(heure: "7:00", temperature: "5", weatherIcon: "cloud.moon.fill")
                        MeteoJournee(heure: "8:00", temperature: "5", weatherIcon: "cloud.moon.fill")
                        MeteoJournee(heure: "9:00", temperature: "6", weatherIcon: "cloud.moon.fill")
                        MeteoJournee(heure: "10:00", temperature: "7", weatherIcon: "cloud.moon.fill")
                    }
                    Group {
                        MeteoJournee(heure: "11:00", temperature: "8", weatherIcon: "cloud.moon.fill")
                        MeteoJournee(heure: "12:00", temperature: "10", weatherIcon: "cloud.moon.fill")
                        MeteoJournee(heure: "13:00", temperature: "11", weatherIcon: "cloud.moon.fill")
                        MeteoJournee(heure: "14:00", temperature: "15", weatherIcon: "cloud.moon.fill")
                        MeteoJournee(heure: "15:00", temperature: "18", weatherIcon: "cloud.moon.fill")
                        MeteoJournee(heure: "15:00", temperature: "21", weatherIcon: "cloud.moon.fill")
                        MeteoJournee(heure: "17:00", temperature: "21", weatherIcon: "cloud.moon.fill")
                        MeteoJournee(heure: "18:00", temperature: "18", weatherIcon: "cloud.moon.fill")
                        MeteoJournee(heure: "19:00", temperature: "13", weatherIcon: "cloud.moon.fill")
                        MeteoJournee(heure: "20:00", temperature: "9", weatherIcon: "cloud.moon.fill")
                    }
                    Group {
                        MeteoJournee(heure: "21:00", temperature: "7", weatherIcon: "cloud.moon.fill")
                        MeteoJournee(heure: "22:00", temperature: "6", weatherIcon: "cloud.moon.fill")
                        MeteoJournee(heure: "23:00", temperature: "4", weatherIcon: "cloud.moon.fill")
                        MeteoJournee(heure: "00:00", temperature: "4", weatherIcon: "cloud.moon.fill")
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding()
        .background(backgroundGradient.opacity(0.9))
        .cornerRadius(20)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}

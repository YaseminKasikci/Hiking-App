//
//  FullSizePhotosView.swift
//  PasAPasFinal
//
//  Created by SwiftUI Developper on 15/05/2023.
//

import SwiftUI

struct FullSizePhotosView: View {
    
    @EnvironmentObject private var dataVM: DatasVM
    @Binding var photoIndex : Int
    var actualRando: Rando
    
    var body: some View {
        TabView(selection: $photoIndex) {
            ForEach(actualRando.photosRando.indices) { index in
                Image(actualRando.photosRando[index])
                    .resizable()
                    .scaledToFit()
                    .tag(index)
            }
        }
        .tabViewStyle(.page)
    }
}

struct FullSizePhotosView_Previews: PreviewProvider {
    static var previews: some View {
        FullSizePhotosView(photoIndex: .constant(0), actualRando: DatasVM().randos[0])
            .environmentObject(DatasVM())
    }
}

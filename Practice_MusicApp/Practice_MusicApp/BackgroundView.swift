//
//  BackgroundView.swift
//  Practice_MusicApp
//
//  Created by Kazuhide Izawa on 31/12/22.
//

import SwiftUI

struct BackgroundView: View {
    
    let imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .ignoresSafeArea()
            .scaledToFill()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(imageName: "background")
    }
}

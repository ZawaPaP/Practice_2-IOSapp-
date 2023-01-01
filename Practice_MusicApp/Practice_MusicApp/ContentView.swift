//
//  ContentView.swift
//  Practice_MusicApp
//
//  Created by Kazuhide Izawa on 31/12/22.
//

import SwiftUI

struct ContentView: View {
    let soundPlayer = SoundPlayer()
    
    var body: some View {
        ZStack {
            BackgroundView(imageName: "background")
        
            HStack {
                Button {
                    soundPlayer.cymbalPlay()
                } label: {
                    Image("cymbal")
                }
                Button {
                    soundPlayer.guitarPlay()
                } label :{
                    Image("guitar")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

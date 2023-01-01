//
//  ContentView.swift
//  MyMap
//
//  Created by Kazuhide Izawa on 1/1/23.
//

import SwiftUI

struct ContentView: View {
    @State var inputText: String = ""
    @State var displaySearchKey: String = ""
    @State var displayMapType: MapType = .standard
    
    var body: some View {
        VStack {
            TextField ("Keyword", text: $inputText, prompt: Text("Please input your keyword"))
                .onSubmit {
                    displaySearchKey = inputText
                }
                .padding()
            
            
            ZStack(alignment: .bottomTrailing) {
                MapView(searchKey: displaySearchKey, mapType: displayMapType)
                
                Button {
                    if displayMapType == .standard {
                        displayMapType = .satelite
                    } else if displayMapType == .satelite {
                        displayMapType = .hybrid
                    } else {
                        displayMapType = .standard
                    }
                } label: {
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 35.0, height: 35.0)
                }
                
                .padding(.trailing, 20.0)
                .padding(.bottom, 30.0)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

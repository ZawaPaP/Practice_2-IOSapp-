//
//  ContentView.swift
//  MyTimer
//
//  Created by Kazuhide Izawa on 1/1/23.
//

import SwiftUI

struct ContentView: View {
    @State var timerHandler : Timer?
    @State var count = 0
    @AppStorage("timer_value") var timerValue = 10
    @State var showAlert = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("backgroundTimer")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                
                VStack(spacing: 30.0) {
                    Text("last \(timerValue - count) sec")
                        .font(.largeTitle)
                    
                    HStack {
                        Button {
                            startTimer()
                        } label: {
                            Text("start")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 140, height: 140)
                                .background(Color("startColor"))
                                .clipShape(Circle())
                        }
                        Button {
                            if let unwrapedTimerHandler = timerHandler {
                                if unwrapedTimerHandler.isValid == true {
                                    unwrapedTimerHandler.invalidate()
                                }
                            }
                        } label: {
                            Text("stop")
                                .font(.largeTitle)
                                .foregroundColor(Color.white)
                                .frame(width: 140, height: 140)
                                .background(Color("stopColor"))
                                .clipShape(Circle())
                        }
                    }
                }
            }
            .onAppear {
                count = 0
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        SettingView()
                    } label: {
                        Text("setting")
                    }
                }
            }
            .alert("End", isPresented: $showAlert){
                Button ("OK") {
                    print ("tapped OK")
                }
            } message: {
                Text ("Time up!")
            }
        }
    }
    func countDownTimer(){
        count += 1
        if timerValue - count <= 0 {
            timerHandler?.invalidate()
            showAlert = true
        }
    }
    
    func startTimer(){
        if let unwrapedTimerHandler = timerHandler {
            if unwrapedTimerHandler.isValid == true {
                return
            }
        }
        if timerValue - count <= 0 {
            count = 0
        }
        timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            countDownTimer()
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

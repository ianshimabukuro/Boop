//
//  ContentView.swift
//  Boop Watch App
//
//  Created by Ian Shimabukuro on 2025/05/26.
//

import SwiftUI


struct ContentView: View {
    @State var isDead : Bool = false
    @State var currentTime: Int = 8*3600
    @State private var isAnimating: Bool = false
    @State var tapCount : Int = 0
    var formattedTime: String {
        let hours = currentTime / 3600
        let minutes = (currentTime % 3600) / 60
        if hours > 0 {
            return "\(hours)h \(minutes)m"
        } else {
            return "\(minutes) min"
        }
    }
    
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
   
    var body: some View {
        ZStack {
            Image("BackgroundCute")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Text("Time Left: \(formattedTime)")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                if isDead{
                    Image("DeadDog")
                        .resizable()
                        .frame(width: 120,height: 120)
                    Text("He DED :((((((")}
                else{
                    AliveDogView(tapCount: $tapCount)
                    
                    HStack {
                        Text("Pets: \(tapCount)")
                        Button("Feed Me"){
                            currentTime = 8*3600
                        }
                        .font(.system(size: 30)) // Explicitly use a small font size
                        .padding(.vertical, 4)   // Minimal vertical padding
                        .padding(.horizontal, 8) // Minimal horizontal padding
                        .background(Color.brown)
                        .foregroundColor(.white)
                        .cornerRadius(6)
                        .buttonStyle(PlainButtonStyle()) // Removes default button styling
                        .minimumScaleFactor(0.5)
                    }  // Makes the text smaller
                }
                
            }
            .onReceive(timer){
                _ in
                if currentTime>0 {
                    currentTime -= 1
                }
                if currentTime == 0{
                    isDead = true
                }
                
                
            }
        }
    }
   
}


#Preview {
    ContentView()
}

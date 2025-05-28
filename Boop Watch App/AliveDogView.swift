//
//  AliveDogView.swift
//  Boop
//
//  Created by Ian Shimabukuro on 2025/05/27.
//
import SwiftUI
import AVFoundation

struct AliveDogView: View{
    @State private var isAnimating: Bool = false
    @State private var audioPlayer : AVAudioPlayer?
    var body : some View{
        Image("AliveDog")
            .resizable()
            .frame(width: 120,height: 120)
            .scaleEffect(isAnimating ? 1.2 : 1.0)
            .onTapGesture{
                            playSound()
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                                        isAnimating = true
                                    }
                                    // Reset animation after delay
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        withAnimation {
                                            isAnimating = false
                                        }
                                    }
                                }
    }
    func playSound() {
           guard let soundURL = Bundle.main.url(forResource: "boop_bark", withExtension: "mp3") else {
               print("Sound file not found")
               return
           }
           do {
               audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
               audioPlayer?.play()
           } catch {
               print("Failed to play sound: \(error)")
           }
       }
}

#Preview{
    AliveDogView()
}

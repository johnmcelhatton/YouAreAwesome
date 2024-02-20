//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by John McElhatton on 10/6/23.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
  @State private var messageString = ""
  @State private var imageName = ""
  @State private var imageNumber = 0
  @State private var messageNumber = 0
  @State private var audioPlayer : AVAudioPlayer!
  @State private var lastSoundNumber = -1
  var body: some View {
    
    
    VStack {
      
      Text(messageString)
        .font(.largeTitle)
        .fontWeight(.heavy)
        .minimumScaleFactor(0.5)
        .multilineTextAlignment(.center)
        .foregroundColor(.red)
        .padding()
        .frame(height: 150)
        .frame(maxWidth: .infinity)
        .padding()
      
      
      Image(imageName)
        .resizable()
        .scaledToFit()
        .cornerRadius(30)
        .shadow(radius: 30)
        .padding()
      
      Spacer()
      
      
      
      
      
      
      Button("Show Message") {
        let messages = [ "You are Awesome!",
                         "You are great",
                         "You are Fabulous",
                         "Fabulous, thats you !" ]
        
        
        messageString = messages [Int.random(in: 0...messages.count - 1)]
        
        imageName = "image\(Int.random(in: 0...9) )"
        
        var soundName = "sound0"
        var soundNumber: Int
        
        repeat{
          soundNumber = Int.random(in: 0...5)
          
          
          
          while soundNumber == lastSoundNumber {
            lastSoundNumber = soundNumber
            soundName = "sound \(soundNumber)"
          }
          
          guard  let soundFile = NSDataAsset(name: soundName) else {
            print(" 😡  Could not read file named \(soundName)")
            
            return
          }
          do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
          }
          catch {
            print(" 😡  ERROR: \(error.localizedDescription) creating audioPlayer")
            
          }
          
          
          //Show message Button end
          
            .buttonStyle(.borderedProminent)
          
          
          
          
          
        }
        .padding()
      }
      
      
      struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
          ContentView()
        }
      }
      
      
    }
  }
}

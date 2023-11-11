//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by John McElhatton on 10/6/23.
//

import SwiftUI

struct ContentView: View {
  @State private var messageString = ""
  @State private var imageName = ""
  @State private var imageNumber = 0
  
  var body: some View {
    
    
    VStack {
      
      Image(imageName)
        .resizable()
        .scaledToFit()
        .cornerRadius(30)
        .shadow(radius: 30)
        .padding()
      
      Spacer()
      
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
      
      
      Spacer()
      
      Button("Show Message") {
        
        
        
        let message1 = "You are Awesome"
        let message2 = "You are Great"
        
        
        messageString = (messageString == message1 ? message2 : message1 )
        
        //         imageName = (imageName == "image0" ? "image1" : "image0")
        
        
        //TODO: UPDATE VARIABLE
        
        imageNumber = imageNumber + 1
        if imageNumber > 9{
          imageNumber = 0
        }
        print(imageNumber)
      }
      
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

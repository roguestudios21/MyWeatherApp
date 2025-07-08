//
//  MainWeatherView.swift
//  MyWeatherApp
//
//  Created by Atharv  on 07/07/25.
//

import SwiftUI
import AVFoundation

struct MainWeatherView: View {
    @State private var showDetails = false
    private let player = AVPlayer(url: Bundle.main.url(forResource: "sunny", withExtension: "mp4")!)
    
    var body: some View {
        ZStack{
            
            BackgroundVideoView(player: AVPlayer(url: Bundle.main.url(forResource: "sunny", withExtension: "mp4")!))
                        .ignoresSafeArea()
                        .opacity(0.9)
                        .blur(radius: 2)
            VStack{
                Spacer(minLength: 75)
                Text("Mumbai,IND")
                    .font(.largeTitle)
                Text("Tuesday")
                    .font(.title)
                    .fontWeight(.medium)
                Image(systemName: "sun.max.fill")
                    .symbolRenderingMode(.multicolor)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                Text("28°C")
                    .font(.system(size: 80))
                Text("Sunny")
                    .font(.title)
                    .fontWeight(.semibold)
                Button{
                    showDetails = true
                } label: {
                    Text("Details")
                        .frame(width: 280, height: 50)
                        .background(.blue.opacity(0.7))
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(10)
                        .padding()
                }
                Spacer()
                HStack{
                    Spacer()
                    Button {
                        print("left Swipe")
                    } label: {
                        Image(systemName: "chevron.backward.2")
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                Capsule()
                                    .fill(Color.blue.opacity(0.7)) // subtle capsule background
                            )
                    }

                    Spacer(minLength: 200)
                    Button {
                        print("left Swipe")
                    } label: {
                        Image(systemName: "chevron.forward.2")
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                Capsule()
                                    .fill(Color.blue.opacity(0.7)) // subtle capsule background
                            )
                    }
                    Spacer()
                }
                Spacer()
                
            }
        }.blur(radius: showDetails ? 20:0)
            .overlay(
                Group {
                    if showDetails {
                        DetailWeatherView(dismiss: {
                            withAnimation {
                                showDetails = false
                            }
                        })
                    }
                }
            )
            .animation(.easeInOut(duration: 0.3), value: showDetails)
    }
}

#Preview {
    MainWeatherView()
}





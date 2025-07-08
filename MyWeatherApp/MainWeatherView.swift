//
//  MainWeatherView.swift
//  MyWeatherApp
//
//  Created by Atharv  on 07/07/25.
//

import SwiftUI

struct MainWeatherView: View {
    var body: some View {
        VStack{
            Spacer()
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
                print("done")
            } label: {
                Text("Details")
                    .frame(width: 280, height: 50)
                    .background(.blue)
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .cornerRadius(10)
                    .padding()
            }
            Spacer()
            HStack{
                Button{
                    print("left Swipe")
                } label: {
                    HStack{
                        Image(systemName: "chevron.backward.2")
                        Image(systemName: "chevron.backward.2")
                    }
                }.padding()
                Spacer()
                Button{
                    print("left Swipe")
                } label: {
                    HStack{
                        Image(systemName: "chevron.forward.2")
                        Image(systemName: "chevron.forward.2")
                    }
                }.padding()
            }
            
        }
    }
}

#Preview {
    MainWeatherView()
}





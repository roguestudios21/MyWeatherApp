//
//  XDismissButton.swift
//  MyWeatherApp
//
//  Created by Atharv  on 07/07/25.
//


import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 45,height: 44)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    XDismissButton()
}

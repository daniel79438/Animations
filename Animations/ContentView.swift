//
//  ContentView.swift
//  Animations
//
//  Created by Daniel Harris on 19/05/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    
    
    var body: some View {
        print(animationAmount)
        return VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            
            Button("tap Me") {
                withAnimation(.spring(duration: 1, bounce: 0.5)) {
                    animationAmount += 360
                }
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
//            .scaleEffect(animationAmount)
            //        .blur(radius: (animationAmount - 1) * 3)
            //        .overlay(
            //            Circle()
            //                .stroke(.red)
            //                .scaleEffect(animationAmount)
            //                .opacity(2 - animationAmount)
            //                .animation(
            //                    .easeInOut(duration: 1)
            //                    .repeatForever(autoreverses: false),
            //                    value: animationAmount
            //        )
            //            )
            //        .onAppear {
            //            animationAmount = 2
        }
    }
}

#Preview {
    ContentView()
}

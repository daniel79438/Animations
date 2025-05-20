//
//  ContentView.swift
//  Animations
//
//  Created by Daniel Harris on 19/05/2025.
//

import SwiftUI

//struct ContentView: View {
//    let letters = Array("Hello SwiftUI")
//    @State private var animationAmount = 0.0
//    @State private var enabled = false
//    @State private var dragAmount = CGSize.zero
//    @State private var isShowingRed = false
//    
//    
//    var body: some View {
//        VStack(spacing: 0) {
////            ForEach(0..<letters.count, id: \.self) { num in
////                Text(String(letters[num]))
////                    .padding(5)
////                    .font(.title)
////                    .background(enabled ? .blue : .red)
////                    .offset(dragAmount)
////                    .animation(.linear.delay(Double(num) / 20), value: dragAmount)
////            }
//            Button("tap Me") {
//                //                enabled.toggle()
//                withAnimation {
//                    isShowingRed.toggle()
//                }
//            }
//            if isShowingRed {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 200, height: 200)
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
//            }
//        }
////        .gesture(
////            DragGesture()
////                .onChanged { dragAmount = $0.translation }
////                .onEnded { _ in
////                    dragAmount = .zero
////                    enabled.toggle()
////                }
////            )
//            
////            Button("tap Me") {
////                enabled.toggle()
////
////            LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
////                .frame(width: 300, height: 200)
////                .clipShape(.rect(cornerRadius: 10))
////                .offset(dragAmount)
////                .animation(.bouncy, value: dragAmount)
////                .gesture(
////                    DragGesture()
////                    //run whenever the user moves their finger
////                        .onChanged { dragAmount = $0.translation }
////                    //run a closure whenever the user lifts their finger off the screen
////                        .onEnded { _ in dragAmount = .zero }
////                )
////
//                
////            }
////            .frame(width: 200, height: 200)
////            .background(enabled ? .blue : .red)
////            .animation(nil, value: enabled)
////            .foregroundStyle(.white)
////            .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
////            .animation(.spring(duration: 1, bounce: 0.6), value: enabled)
////
//            
//            
//            
//            
//            //            .scaleEffect(animationAmount)
//            //        .blur(radius: (animationAmount - 1) * 3)
//            //        .overlay(
//            //            Circle()
//            //                .stroke(.red)
//            //                .scaleEffect(animationAmount)
//            //                .opacity(2 - animationAmount)
//            //                .animation(
//            //                    .easeInOut(duration: 1)
//            //                    .repeatForever(autoreverses: false),
//            //                    value: animationAmount
//            //        )
//            //            )
//            //        .onAppear {
//            //            animationAmount = 2
//        }
//    }

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct ContentView: View {
    @State private var isShowingRed = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}

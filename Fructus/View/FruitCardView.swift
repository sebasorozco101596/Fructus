//
//  FruitCardView.swift
//  Fructus
//
//  Created by Juan Sebastian Orozco Buitrago on 1/18/22.
//

import SwiftUI

struct FruitCardView: View {
    
    //MARK: - PROPERTIES
    
    var fruit: Fruit
    
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                
                // FRUIT: IMAGE
                Image(fruit.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                    .scaleEffect(isAnimating ? 1.0 : 0.6) // Animation
                    .scaleEffect(imageScale)
                    .gesture(
                        MagnificationGesture()
                            .onChanged({ value in
                                withAnimation(.linear(duration: 1)) {
                                    imageScale = value
                                }
                            })
                            .onEnded({ _ in
                                withAnimation(.linear(duration: 1)) {
                                    imageScale = 1
                                }
                            })
                    
                    )
                    .zIndex(1)
                
                // FRUIT: TITLE
                Text(fruit.title)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
                
                // FRUIT: HEADLINE
                Text(fruit.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)
                // BUTTON: START
                StartButtonView()
            }//: VSTACK
        }//: ZSTACK
        .onAppear(perform: {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        })
        .onDisappear(perform: {
            isAnimating = false
        })
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(LinearGradient(
            gradient: Gradient(colors: fruit.gradientColors),
            startPoint: .top,
            endPoint: .bottom))
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
}

//MARK: - PREVIEW

struct FruitCardView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCardView(fruit: fruitsData[0])
            .previewLayout(.fixed(width: 340, height: 640))
    }
}

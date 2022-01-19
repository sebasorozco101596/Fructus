//
//  OnboardingView.swift
//  Fructus
//
//  Created by Juan Sebastian Orozco Buitrago on 1/19/22.
//

import SwiftUI

struct OnboardingView: View {
    
    //MARK: - PROPERTIES
    
    var fruits: [Fruit] = fruitsData
    
    //MARK: - BODY
    
    var body: some View {
        
        TabView {
            ForEach(fruits[0...5]) { item in
                FruitCardView(fruit: item)
//                Text("Cards")
            } //: LOOP
            
        } //: TAB
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
        
    }
}

//MARK: - PREVIEW

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

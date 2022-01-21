//
//  SettingsRowView.swift
//  Fructus
//
//  Created by Juan Sebastian Orozco Buitrago on 1/21/22.
//

import SwiftUI

struct SettingsRowView: View {
    
    //MARK: - PROPERTIES
    
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    //MARK: - BODY
    
    var body: some View {
        HStack {
            Text(name)
                .foregroundColor(.gray)
            Spacer()
            if content != nil {
                Text(content!)
            } else if linkLabel != nil && linkDestination != nil {
                Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
                Image(systemName: "arrow.up.right.square")
                    .foregroundColor(.pink)
            } else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        }
    }
}

//MARK: - PREVIEW

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(name: "Developer", content: "Juan S Orozco Buitrago")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}

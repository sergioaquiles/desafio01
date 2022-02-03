//
//  FavoriteButton.swift
//  DesafioBTG01
//
//  Created by Sergio Cardoso on 03/02/22.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button(action: {
            isSet.toggle()
        }, label: {
            Image(systemName: isSet ? "heart.fill" : "heart")
                .font(.system(size: 25))
                .foregroundColor(isSet ? .red : .gray)
        })
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
    

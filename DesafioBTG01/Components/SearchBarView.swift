//
//  SearchBarView.swift
//  Iovex
//
//  Created by Sergio Cardoso on 17/04/21.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var text: String
    @State private var isEditing = false
	let placeHolder: String
    
    var body: some View {
        
        HStack {
            TextField(placeHolder, text: $text)
                .padding(15)
                .padding(.horizontal, 25)
				.background(
					RoundedRectangle(cornerRadius: 10).fill(Color.red)
						.frame(height: 2)
						.offset(y: 25)
				)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
							.foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 15)
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }, label: {
                                Image(systemName: "multiply.circle.fill")
									.foregroundColor(.red)
                                    .padding(.trailing, 10)
                            })
                        }
                    }
                ).onTapGesture(){
					withAnimation(.easeIn) {
						self.isEditing = true
					}
                }
            if isEditing{
                Button(action: {
					withAnimation(.easeOut) {
						self.isEditing = false
						self.text = ""
						
						UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
					}
                }, label: {
                    Text("Cancel")
						.foregroundColor(.red)
                       
                })
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
            }
        }
        .padding()
    }
}

struct SearchBarView_Previews: PreviewProvider {
	static var previews: some View {
		SearchBarView(text: .constant(""), placeHolder: "")
			.preferredColorScheme(.dark)
			
	}
}

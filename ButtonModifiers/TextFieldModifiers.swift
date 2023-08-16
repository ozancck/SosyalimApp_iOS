//
//  TextFieldModifiers.swift
//  SosyalimApp
//
//  Created by Ozan Çiçek on 30.07.2023.
//

import Foundation

import SwiftUI

enum TextFieldStyle {
    case roundedBorder(Color)
    case underline(Color, String)
    case noBorder
    case passField(Color)
   

    var borderColor: Color {
        switch self {
        case let .roundedBorder(color):
            return color
        case let .underline(color, icon):
            return color
        case .noBorder:
            return .clear
        case let .passField(color):
            return color
        }
    }

    var cornerRadius: CGFloat {
        switch self {
        case .roundedBorder:
            return 15
        default:
            return 0
        }
    }
    
    var width: Double {
        switch self {
            
        case .roundedBorder(_):
            return 0.8
        case .underline(_):
            return 0.8
            
        case .passField(_):
            return 0.8
        case .noBorder:
            return 0.8
        }
    }
}

extension View {
    func textFieldStyle(_ style: TextFieldStyle) -> some View {
        modifier(TextFieldModifier(style: style))
    }
}

struct TextFieldModifier: ViewModifier {
    var style: TextFieldStyle

    func body(content: Content) -> some View {
        switch style {
        case let .roundedBorder(color):
            return AnyView(content
                .padding()
                .background(RoundedRectangle(cornerRadius: style.cornerRadius).stroke(color))
                .padding(.horizontal)
            )
        case let .underline(color, icon):
                   return AnyView(
                    ZStack(alignment: .leading) {
                        
                        Image(systemName: "\(icon)")
                        
                        content
                            .multilineTextAlignment(.center)
                            .foregroundColor(.blue)
                           .frame(width: UIScreen.main.bounds.width * style.width)
                           .overlay(
                               Rectangle()
                                   .frame(height: 1)
                                   .padding(.top, 10)
                                   .foregroundColor(color)
                                   .padding(.bottom, -20) // Alt çizgiyi placeholder'ın altına itmek için padding ekledik.
                               , alignment: .bottom
                           )
                    }
                   )
            
        case let .passField(color):
            return AnyView(
                ZStack(alignment: .leading) {
                    
                    Image(systemName: "lock")
                    
                    content
                        
                        .multilineTextAlignment(.center)
                        .foregroundColor(.blue)
                       .frame(width: UIScreen.main.bounds.width * style.width)
                       .overlay(
                           Rectangle()
                               .frame(height: 1)
                               .padding(.top, 10)
                               .foregroundColor(color)
                               .padding(.bottom, -20) // Alt çizgiyi placeholder'ın altına itmek için padding ekledik.
                           , alignment: .bottom
                       )
                }
                
            )
        case .noBorder:
            return AnyView(content)
        }
    }
}

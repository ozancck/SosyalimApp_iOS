//
//  SecureFieldModifiers.swift
//  SosyalimApp
//
//  Created by Ozan Çiçek on 30.07.2023.
//

import Foundation
import SwiftUI

enum SecureFieldStyle {
    case passField(Color)

    var borderColor: Color {
        switch self {
        case let .passField(color):
            return color
        }
    }

    var width: Double {
        switch self {
        case .passField(_):
            return 0.8
        }
    }
}

extension View {
    func secureFieldStyle(_ style: SecureFieldStyle) -> some View {
        modifier(SecureFieldModifier(style: style))
    }
}

struct SecureFieldModifier: ViewModifier {
    var style: SecureFieldStyle

    func body(content: Content) -> some View {
        switch style {
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
                                .padding(.bottom, -20),
                            alignment: .bottom
                        )
                }
            )
        }
    }
}

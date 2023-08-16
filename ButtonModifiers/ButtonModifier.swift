//
//  Button_Type.swift
//  SosyalimApp
//
//  Created by Ozan Çiçek on 30.07.2023.
//

import Foundation
import SwiftUI

enum ButtonType {
    case primary
    case secondary
    case whiteButton
    case noBackground
    case blueButton

    var foreground: Color {
        switch self {
        case .primary:
            return .white
        case .secondary:
            return .black
        case .whiteButton:
            return Color("primary")

        case .noBackground:
            return .white

        case .blueButton:
            return .white
        }
    }

    var bacground: Color {
        switch self {
        case .primary:
            return .black
        case .secondary:
            return .white
        case .whiteButton:
            return .white

        case .noBackground:
            return Color.clear

        case .blueButton:
            return Color("primary")
        }
    }

    var cornerRadius: CGFloat {
        switch self {
        case .primary:
            return 9
        case .secondary:
            return 9
        case .whiteButton:
            return 9
        case .noBackground:
            return 9
        case .blueButton:
            return 9
        }
    }

    var widthFrame: Double {
        switch self {
        case .primary:
            return 0.8
        case .secondary:
            return 0.8
        case .whiteButton:
            return 0.8
        case .noBackground:
            return 0.8
        case .blueButton:
            return 0.8
        }
    }
}

extension View {
    func button(_ buttonType: ButtonType) {
        modifier(ButtonModifier(buttonType: buttonType))
    }
}

struct ButtonModifier: ViewModifier {
    var buttonType: ButtonType
    func body(content: Content) -> some View {
        content
            .font(.callout)
            .frame(width: UIScreen.main.bounds.width * buttonType.widthFrame, height: UIScreen.main.bounds.height * 0.02)
            .padding()
            .background(buttonType.bacground)
            .clipShape(RoundedRectangle(cornerRadius: buttonType.cornerRadius))
            .foregroundColor(buttonType.foreground)
    }
}

struct RadiusButton: View {
    let title: String
    let color: Color

    var body: some View {
        Text(title)
            .foregroundColor(color)
            .font(.callout)
            .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.02)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 9)
                    .stroke(color, lineWidth: 1.5)
            )
    }
}

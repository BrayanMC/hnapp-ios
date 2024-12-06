//
//  CustomNavigationBar.swift
//  HNApp
//
//  Created by Brayan Munoz on 4/12/24.
//

import SwiftUI
import Extensions

public struct CustomNavigationBar: View {
    let title: String
    let showBackButton: Bool
    let backAction: () -> Void
    
    public init(title: String, showBackButton: Bool, backAction: @escaping () -> Void) {
        self.title = title
        self.showBackButton = showBackButton
        self.backAction = backAction
    }
    
    public var body: some View {
        HStack {
            if showBackButton {
                Button(action: backAction) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                        Text("Back")
                            .font(.interMedium(size: 16))
                            .foregroundColor(.black)
                    }
                }
            } else {
                Spacer().frame(width: 44)
            }
            Spacer()
            Text(title)
                .font(.interBold(size: 24))
                .foregroundColor(.primary)
            Spacer()
            if showBackButton {
                Spacer().frame(width: 44)
            }
        }
        .padding()
        .background(Color(UIColor.systemBackground))
    }
}

#Preview {
    CustomNavigationBar(
        title: "Prueba",
        showBackButton: true) {
            debugPrint("backAction tapped !")
        }
}

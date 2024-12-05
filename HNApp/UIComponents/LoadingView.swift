//
//  LoadingView.swift
//  HNApp
//
//  Created by Brayan Munoz on 4/12/24.
//

import SwiftUI

struct LoadingView: View {
    
    let text: String
    
    var body: some View {
        VStack(spacing: 10) {
            ProgressView()
            Text(text)
                .font(.interMedium(size: 16))
        }
    }
}

#Preview {
    LoadingView(
        text: "Cargando..."
    )
}


//
//  WebView.swift
//  HNApp
//
//  Created by Brayan Munoz on 4/12/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    var url: String
    @Binding var isLoading: Bool

    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator(parent: self, isLoading: $isLoading)
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // If it were necessary to update the WebView, we would do it here
    }
}

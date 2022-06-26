//
//  FacebookPage.swift
//  @NCHS
//
//  Created by Advaith Vijayakumar on 06/05/2022.
//

import SwiftUI
import WebKit

// UIViewRepresentable struct to create and manage a UIView object.
struct WebView: UIViewRepresentable {
    
    let webView: WKWebView
    
    // Conform WebView to the View protocol.
    func makeUIView(context: Context) -> WKWebView {
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) { }
}

// WebViewModel object that displays the interactive web content.
class WebViewModel: ObservableObject {
    
    let webView: WKWebView
    let url: URL
 
    // WebView Initializer
    init() {
        webView = WKWebView(frame: .zero)
        url = URL(string: "https://www.facebook.com/pages/category/High-School/North-Creek-High-School-2700399939972400")!
        loadUrl()
    }
    
    // Loads the web content that the url property references.
    func loadUrl() {
        webView.load(URLRequest(url: url))
    }
}
                  
struct FacebookPage: View {
    @StateObject var model = WebViewModel()
    var body: some View {
        WebView(webView: model.webView)
    }
}

struct FacebookPage_Previews: PreviewProvider {
    static var previews: some View {
        FacebookPage()
    }
}

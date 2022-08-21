//
//  ContentView.swift
//  Dex
//
//  Created by Thomas Jenkins on 8/21/22.
//

import SwiftUI
import JPSVolumeButtonHandler


struct ContentView: View {
    @State private var showWebView = false
    @State private var volumeHandler: JPSVolumeButtonHandler?
    @State private var showHUD = true
    
    let webView = WebView(request: URLRequest(url: URL(string: "https://www.mangadex.org")!))
    
    
    var body: some View {
        ZStack {
            webView
            
            VStack{
                Spacer()
                HStack{
                    Button(action: {
                        self.webView.goBack()
                    }) {
                        Image(systemName:"arrow.backward.circle")
                            .foregroundColor(.purple)
                            .font(.system(size: 40))
                            .opacity(showHUD == true ? 0.7 : 0.0)
                    }
                    Spacer()
                }
                
                
                
            }
        }
        .onAppear {
                    // Setup capture of volume buttons
                    volumeHandler = JPSVolumeButtonHandler(up: {
                        
                    }, downBlock: {showHUD.toggle()                    })

                    // Start capture of volume buttons
                    volumeHandler?.start(true)
                }
        .onDisappear{
            volumeHandler?.start(false)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

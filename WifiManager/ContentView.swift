//
//  ContentView.swift
//  WifiManager
//
//  Created by Gany Ganesh on 21/03/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var wifiManager = WifiManager()
    var body: some View {
        ZStack {
            Color(uiColor: .orange).ignoresSafeArea()
            VStack(alignment:.center,spacing: 8) {
                Image(systemName: wifiManager.isShowConnectedImg)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150,height: 150)
                    .foregroundColor(.white)
                    .padding()
                Text(wifiManager.isShowConnected)
                    .bold()
                    .font(.title3)
                    .foregroundStyle(.white)
                Text(wifiManager.isShowDes)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                if !wifiManager.isConnected {
                    Button{
                        
                    }label: {
                        Text("Retry")
                            .padding()
                            .font(.headline)
                            .foregroundColor(.orange)
                    }
                    .frame(width: 140)
                    .background(.white)
                    .clipShape(Capsule())
                    .padding()
                }
               
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

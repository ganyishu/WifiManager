//
//  WifiManager.swift
//  WifiManager
//
//  Created by Gany Ganesh on 21/03/24.
//

import Foundation
import Network
final class WifiManager: ObservableObject {
    
    let monitor = NWPathMonitor()
    let queue =  DispatchQueue(label: "WifiManager")
    @Published var isConnected = true
    
    var isShowConnected: String {
        if isConnected {
            return "Internet connection is looks good"
        } else {
            return "YOUR INTERNET IS A LITTLE WONKY"
        }
    }
    var isShowConnectedImg : String {
        return isConnected ? "wifi" : "wifi.slash"
    }
    
    var isShowDes: String {
        return isConnected ? "The internet connection seems to be functioning properly." : "Try switching to different connection or reset your internet"
    }
    
    init(){
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        
        monitor.start(queue: queue)
    }
}

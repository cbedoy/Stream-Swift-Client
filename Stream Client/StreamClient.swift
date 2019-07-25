//
//  StreamClient.swift
//  Stream Client
//
//  Created by Carlos Bedoy on 7/25/19.
//  Copyright © 2019 iambedoy. All rights reserved.
//

import Foundation
import GetStream

class StreamClient {
    
    static let shared = StreamClient()
    
    func register(nickname: String) {
        let user = User(id: "system")
        
        Client.config = .init(apiKey: "pxq7kudd57xc", appId: "55595", token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyZXNvdXJjZSI6IioiLCJhY3Rpb24iOiIqIiwiZmVlZF9pZCI6IioifQ.p31LovjFsSEfSrAv-Np0diPENZ3c21Rfr3nxBFn_ukA")
        
        Client.shared.create(user: user) { result in
            if let _createdUser = try? result.get() {
                Client.shared.currentUser = _createdUser
                
                self.createActivity()
            }
        }
    }
    
    func createActivity() {
        let flatFeed = Client.shared.flatFeed(feedSlug: "user", userId: "system")
        
        let actitity = Activity(actor: User.current!, verb: "ADD", object: "SOMETHING")
        
        flatFeed.add(actitity, completion:{ result in
            print(result)
        })
    }
    
    func loadActivity() {
        
    }
}

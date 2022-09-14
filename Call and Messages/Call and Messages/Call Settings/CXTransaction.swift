//
//  CallHandler.swift
//  Call and Messages
//
//  Created by Aurelio Le Clarke on 14.09.2022.
//

import Foundation
import CallKit

let callController = CXCallController()

// Запрос транзакции

private func requestTransaction(with action: CXCallAction, completionHandler: ((NSError?) -> Void)?) {
    let transaction = CXTransaction(action: action)
    
    callController.request(transaction) { error in
        completionHandler?(error as NSError?)
        func startCall(with uuid: UUID, calleeID: String, hasVideo: Bool, completionHandler: ((NSError?) -> Void)? = nil) {
            
            let handle = CXHandle(type: .generic, value: calleeID)
            let startCallAction = CXStartCallAction(call: uuid, handle: handle)
            
            
            startCallAction.isVideo = hasVideo
            
          
            requestTransaction(with: startCallAction, completionHandler: completionHandler)
        }
    }
    
    
}


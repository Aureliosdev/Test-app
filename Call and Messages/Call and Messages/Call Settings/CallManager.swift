//
//  CallManager.swift
//  Call and Messages
//
//  Created by Aurelio Le Clarke on 14.09.2022.
//

import Foundation
import CallKit

class CallManager {
    
    
    static let shared = CallManager()

    let callController = CXCallController()

   
    private(set) var callIDs: [UUID] = []

    // MARK: Управление вызовами
    
    func containsCall(uuid: UUID) -> Bool {
        return CallManager.shared.callIDs.contains(where: { $0 == uuid })
    }

    func addCall(uuid: UUID) {
        self.callIDs.append(uuid)
    }

    func removeCall(uuid: UUID) {
        self.callIDs.removeAll { $0 == uuid }
    }

    func removeAllCalls() {
        self.callIDs.removeAll()
    }

    

}


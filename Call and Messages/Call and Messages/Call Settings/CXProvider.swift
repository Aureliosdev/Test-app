//
//  CXProvider.swift
//  Call and Messages
//
//  Created by Aurelio Le Clarke on 14.09.2022.
//

import UIKit
import CallKit
import AVKit

class ProviderDelegate: NSObject {

    var callManager = CallManager()
    
    private let provider: CXProvider

    override init() {
        provider = CXProvider(configuration: CXProviderConfiguration.custom)

        super.init()

        
        //Если очередь равна nil, делегат будет выполняться в основном потоке.
        provider.setDelegate(self, queue: nil)
    }
   
    


    func reportIncomingCall(uuid: UUID, callerID: String, hasVideo: Bool, completionHandler: ((NSError?) -> Void)? = nil) {

        // Обновить вызов на основе объекта DirectCall
        let update = CXCallUpdate()

        // Информация для журнала вызовов
        
//        let callerID = call.caller?.userId ?? "Unknown"
        update.remoteHandle = CXHandle(type: .generic, value: callerID)
        update.localizedCallerName = callerID
        update.hasVideo = hasVideo

        // Сообщить о новом входящем звонке и добавить его в callManager.calls
        provider.reportNewIncomingCall(with: uuid, update: update) { error in
            guard error == nil else {
                completionHandler?(error as NSError?)
                return
            }

            
            CallManager.shared.addCall(uuid: uuid)
        }
    }

    
    func connectedCall(uuid: UUID, startedAt: Int64) {
        let connectedAt = Date(timeIntervalSince1970: Double(startedAt)/1000)
        self.provider.reportOutgoingCall(with: uuid, connectedAt: connectedAt)
    }

    
    func endCall(uuid: UUID, endedAt: Date, reason: CXCallEndedReason) {
        self.provider.reportCall(with: uuid, endedAt: endedAt, reason: reason)
    }
}



extension ProviderDelegate: CXProviderDelegate {
    func providerDidReset(_ provider: CXProvider) {
        
        CallManager.shared.removeAllCalls()
        
    }
    func provider(_ provider: CXProvider, perform action: CXStartCallAction) {
            // Получаем обьекты вызова
            // настраиваем аудиосессию
            // сообщить о начале подключение
        
            action.fulfill()
        }
    func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
        
            // Принимаем звонок
            // Уведомим о принятом входящем звонке
            action.fulfill()
        }

        func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
            // Замутить звонок
            // Закончить звонок
            action.fulfill()

            // Удаляем завершенный вызов из callManager.callID
            CallManager.shared.removeCall(uuid: action.callUUID)
        }

        func provider(_ provider: CXProvider, perform action: CXSetHeldCallAction) {
        
            action.fulfill()
        }

        func provider(_ provider: CXProvider, perform action: CXSetMutedCallAction) {
        
            action.fulfill()
        }

        func provider(_ provider: CXProvider, didActivate audioSession: AVAudioSession) {
         //начинаем аудиозвонок
        }

        func provider(_ provider: CXProvider, didDeactivate audioSession: AVAudioSession) {
            // Перезапускает любой звук, не связанный с вызовом
            
        }
    }


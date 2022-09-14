//
//  ChatViewController.swift
//  Call and Messages
//
//  Created by Aurelio Le Clarke on 14.09.2022.
//

import UIKit
import MessageKit

/*
 фреймворк достаточно удобен, можно настроить все данные , добавить базы данных и  кастомизировать ячейки,
 документация есть в github
 
 */




struct Sender: SenderType {
    var senderId: String
    var displayName: String
}

struct Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}

class ChatViewController: MessagesViewController,MessagesDataSource,MessagesDisplayDelegate,MessagesLayoutDelegate {

    let currentUser = Sender(senderId: "self", displayName: "Aurelio")
    let secondUser = Sender(senderId: "Bro", displayName: "Dimash")
    var messages =  [MessageType]()
    
    
    func currentSender() -> SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section ]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messages.append(Message(sender: currentUser, messageId: "1", sentDate: Date().addingTimeInterval(-86400), kind: .text("Hey bro!")))
        messages.append(Message(sender: secondUser, messageId: "2", sentDate: Date().addingTimeInterval(-86400), kind: .text("Hi Aurelio!")))
        messages.append(Message(sender: currentUser, messageId: "3", sentDate: Date().addingTimeInterval(-86400), kind: .text("Hows going?")))
        messages.append(Message(sender: secondUser, messageId: "4", sentDate: Date().addingTimeInterval(-86400), kind: .text("Great! And u?")))
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
       
      

    }
    

  

}

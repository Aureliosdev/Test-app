//
//  CallsViewController.swift
//  Call and Messages
//
//  Created by Aurelio Le Clarke on 14.09.2022.
//

import UIKit
import CallKit

/*
 для начала нужно скачать сертификат voice over IP
 (voIP)
 
 
 
 */


class CallsViewController: UIViewController {

    let providerDelegate = ProviderDelegate()

        // UUID для исходящих вызовов
        var callID: UUID?
   
    
    //кпонки для нажатия отмены, принятия и вызова
    private let outgoingCall: UIButton = {
        
        let button = UIButton()
        button.setTitle("Call", for: .normal)
        button.tintColor = .label
        button.backgroundColor = .systemGreen
        
        return button
        
    }()
    
    private let EndCall: UIButton = {
        
        let button = UIButton()
        button.setTitle("End", for: .normal)
        button.tintColor = .label
        button.backgroundColor = .systemBlue
        
        return button
        
    }()
    
    private let IncomingCall: UIButton = {
        
        let button = UIButton()
        button.setTitle("Answer", for: .normal)
        button.tintColor = .label
        button.backgroundColor = .systemGreen
        
        return button
        
    }()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
 
    }
    private func configureButtons() {
        outgoingCall.addTarget(self, action: #selector(didTapOutGoing), for: .touchUpInside)
        EndCall.addTarget(self, action: #selector(didTapEnd), for: .touchUpInside)
        IncomingCall.addTarget(self, action: #selector(didTapIncoming), for: .touchUpInside)
    }
    
    //настроить кнопки не успел
    
    @objc private func didTapOutGoing() {
      
    }
    
    
    @objc private func didTapEnd() {
       
    }
    
    @objc private func didTapIncoming() {
      
    }
   
    
}

//
//  CXProviderConfiguration.swift
//  Call and Messages
//
//  Created by Aurelio Le Clarke on 14.09.2022.
//
import UIKit
import CallKit




/*
 Объект CXProviderConfiguration управляет собственным пользовательским интерфейсом для
 входящих и исходящих вызовов
 
 */

extension CXProviderConfiguration {
    static var custom: CXProviderConfiguration {
    
    let configuration = CXProviderConfiguration()

    
    
    //отображается значок видео если это был видеовызов
    
    configuration.supportsVideo = true

    // поддержка универсального типа для подджерки User ID
    configuration.supportedHandleTypes = [.generic]

    // картинка значка при звонке
    if let iconImage = UIImage(named: "spiderman") {
        configuration.iconTemplateImageData = iconImage.pngData()
    }
    return configuration
    }

}

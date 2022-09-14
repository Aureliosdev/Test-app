//
//  MessageViewController.swift
//  Call and Messages
//
//  Created by Aurelio Le Clarke on 14.09.2022.
//

import UIKit

/*
 Реализация чтение смс и отправка происходит отсюда. Когда пользователь выбирает собеседника срабатывает push и перекидывает на другой VC.
 
 
 
 */


class MessageViewController: UIViewController {

    private let messageTableView: UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        return table
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        messageTableView.frame = view.bounds
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTableView.delegate = self
        messageTableView.dataSource = self
        view.addSubview(messageTableView)
        view.backgroundColor = .systemBackground
        
    }
    
}
extension MessageViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = messageTableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = "Aurelio Le Clarke"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //показываем раздел сообщениии
        let vc = ChatViewController()
        vc.title = "SMS"
        navigationController?.pushViewController(vc, animated: true)
    }
    

    
    
    
    
    
}

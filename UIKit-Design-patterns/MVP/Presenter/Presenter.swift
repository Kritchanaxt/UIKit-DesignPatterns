//
//  Presenter.swift
//  MVP-UIKit
//
//  Created by Kritchanaxt_. on 28/4/2567 BE.
//

import Foundation
import UIKit

// https://jsonplaceholder.typicode.com/users

// ใช้ Protocol UserPresenterDelegate เพื่อสื่อสารกับ View. Presenter รับข้อมูลผู้ใช้จาก API ผ่าน URLSession และแสดงผลข้อมูลผู้ใช้ใน View โดยอัปเดต TableView ด้วยข้อมูลใหม่.
protocol UserPresenterDelegate: AnyObject {
    func presentUsers(users: [User])
    func presentAlert(title: String, messge: String)
}

typealias PresenterDelegate = UserPresenterDelegate & UIViewController

class UserPresenter {
    
    weak var delegate: PresenterDelegate?
    
    public func getUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                self?.delegate?.presentUsers(users: users)
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
    
    public func setViewDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
    }
    
    public func didTap(user: User) {
//        delegate?.presentAlert(
//            title: user.name,
//            messge: "\(user.name) has an email of \(user.email) & a username of \(user.username)")
        
        let title = user.name
        let messgae = "\(user.name) has an email of \(user.email) & a username of \(user.username)"
        
        let alert = UIAlertController(title: title, message: messgae, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        delegate?.present(alert, animated: true)
    }
}

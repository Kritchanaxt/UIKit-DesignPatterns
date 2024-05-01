//
//  Interactor.swift
//  UIKit-Design-patterns
//
//  Created by Kritchanaxt_. on 1/5/2567 BE.
//

import Foundation
import UIKit

// http://jsonplaceholder.typicode.com/users

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    
    func getUsers()
}

class UserInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    
    func getUsers() {
        print("Start fetching")
        guard let url = URL(string: "http://jsonplaceholder.typicode.com/users") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
                return
            }
            
            do {
                let entites = try JSONDecoder().decode([Users].self, from: data)
                self?.presenter?.interactorDidFetchUsers(with: .success(entites))
            }
            catch {
                self?.presenter?.interactorDidFetchUsers(with: .failure(error))
            }
        }
        task.resume()
    }
}

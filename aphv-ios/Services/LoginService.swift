//
//  LoginService.swift
//  aphv-ios
//
//  Created by Mark Kea on 29/12/2020.
//

import SwiftUI
import Foundation
import Combine

final class LoginService: ObservableObject {
    
    static let shared = LoginService()
    
    private var cancellable: AnyCancellable?
    
    func Login(userModel : UserModel, completion: @escaping (Result<LoginResponse, RequestError>) -> Void) {
        
        let api = "https://aphv.azurewebsites.net"
        let endpoint = "/api/login/?environment=user"
        let url = URL(string: api + endpoint)!
        
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        
        let parameters = LoginRequest(
            email: userModel.email ?? "",
            password: userModel.password ?? ""
        )
        
        urlRequest.httpBody = try! JSONEncoder().encode(parameters)
        
        cancellable = URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map({ $0.data })
            .decode(type: LoginResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    switch error {
                    case let urlError as URLError:
                        completion(.failure(.urlError(urlError)))
                    case let decodingError as DecodingError:
                        completion(.failure(.decodingError(decodingError)))
                    default:
                        completion(.failure(.genericError(error)))
                    }
                }
            }) {(response) in
                completion(.success(response))
            }
    }
}

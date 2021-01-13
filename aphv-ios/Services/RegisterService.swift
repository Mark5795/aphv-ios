//
//  RegistreerService.swift
//  aphv-ios
//
//  Created by Mark Kea on 25/11/2020.
//

import SwiftUI
import Foundation
import Combine
//import KeychainAccess


final class RegisterService: ObservableObject {
    
    static let shared = RegisterService()
    
    private var cancellable: AnyCancellable?
    
    func Register(userModel : UserModel, completion: @escaping (Result<RegisterUserResponse, RequestError>) -> Void) {
        
        let api = "https://aphv.azurewebsites.net"
        let endpoint = "/api/users/child"
        let url = URL(string: api + endpoint)!
        
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        
        let parameters = RegisterUserRequest(
            email: userModel.email ?? "",
            firstName: userModel.firstName ?? "",
            lastName: userModel.lastName ?? "",
            password: userModel.password ?? "",
            dateOfBirth: userModel.dateOfBirth ?? "",
            gender: userModel.gender ?? "",
            sport: userModel.sport ?? ""
        )
        
        urlRequest.httpBody = try! JSONEncoder().encode(parameters)
        
        cancellable = URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map({ $0.data })
            .decode(type: RegisterUserResponse.self, decoder: JSONDecoder())
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
    
    func RegisterCoach(userModel : UserModel, completion: @escaping (Result<RegisterCoachResponse, RequestError>) -> Void) {
        
        let api = "https://aphv.azurewebsites.net"
        let endpoint = "/api/users/coach"
        let url = URL(string: api + endpoint)!
        
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        
        
        let parameters = RegisterCoachRequest(
            email: userModel.email ?? "",
            firstName: userModel.firstName ?? "",
            lastName: userModel.lastName ?? "",
            password: userModel.password ?? "",
            role: userModel.sport ?? ""
        )
        
        urlRequest.httpBody = try! JSONEncoder().encode(parameters)
        
        cancellable = URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map({ $0.data })
            .decode(type: RegisterCoachResponse.self, decoder: JSONDecoder())
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

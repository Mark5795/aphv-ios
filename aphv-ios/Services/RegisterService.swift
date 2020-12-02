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

enum RequestError: Error {
    case urlError(URLError)
	case decodingError(DecodingError)
    case genericError(Error)
}

final class RegisterService: ObservableObject {
    
    static let shared = RegisterService()
        
    private var cancellable: AnyCancellable?
    
//    func Register(role: String, email: String, firstName: String, lastName: String, password: String, dateOfBirth: String, gender: String, sport: String, completion: @escaping (Result<RegisterResponse, RequestError>) -> Void) {
    func Register(userModel : UserModel, completion: @escaping (Result<RegisterResponse, RequestError>) -> Void) {

        var role = userModel.role
        if role == "Sporter" {
            role = "child"
        }

        let api = "https://aphv.azurewebsites.net"
        let endpoint = "/api/users/\(role)"
        let url = URL(string: api + endpoint)!

        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"


                let parameters = RegisterRequest(
                    email: userModel.email,
                    firstName: userModel.firstName,
                    lastName: userModel.lastName,
                    password: userModel.password,
                    dateOfBirth: userModel.dateOfBirth,
                    gender: userModel.gender,
                    sport: userModel.sport
                )

                urlRequest.httpBody = try! JSONEncoder().encode(parameters)

                cancellable = URLSession.shared.dataTaskPublisher(for: urlRequest)
                    .map({ $0.data })
                    .decode(type: RegisterResponse.self, decoder: JSONDecoder())
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

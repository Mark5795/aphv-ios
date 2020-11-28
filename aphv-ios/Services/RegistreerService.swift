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

struct APIRequest {
    let resourceURL : URL
    
    init(endpoint: String) {
        let resourceString = "https://aphv.azurewebsites.net/api/\(endpoint)"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        
        self.resourceURL = resourceURL
    }
}

final class RegistreerService: ObservableObject {
    static let shared = RegistreerService()
    private var cancellable: AnyCancellable?
    
    func Registeer(role: String, email: String, firstName: String, lastName: String, password: String, dateOfBirth: String, gender: String, sport: String, completion: @escaping (Result<RegistreerResponse, RequestError>) -> Void) {

        var role = role
        if role == "Sporter" {
            role = "child"
        }

        let api = "https://aphv.azurewebsites.net"
        let endpoint = "/api/users/\(role)"
        let url = URL(string: api + endpoint)!

        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"


                let parameters = RegistreerRequest(
                    email: email,
                    firstName: firstName,
                    lastName: lastName,
                    password: password,
                    dateOfBirth: dateOfBirth,
                    gender: gender,
                    sport: sport
                )

                urlRequest.httpBody = try! JSONEncoder().encode(parameters)

                cancellable = URLSession.shared.dataTaskPublisher(for: urlRequest)
                    .map({ $0.data })
                    .decode(type: RegistreerResponse.self, decoder: JSONDecoder())
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

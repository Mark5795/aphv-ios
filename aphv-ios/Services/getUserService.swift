//
//  getUsersService.swift
//  aphv-ios
//
//  Created by Mark Kea on 10/01/2021.
//

import SwiftUI
import Foundation
import Combine


// nog niet af

final class getUserService: ObservableObject {
    
    static let shared = getUserService()
    
    private var cancellable: AnyCancellable?
    
    func GetUser(userModel : UserModel, accessToken : String, completion: @escaping (Result<GetUsersResponse, RequestError>) -> Void) {
        
        let api = "https://aphv.azurewebsites.net"
        let endpoint = "/api/users/\(userModel.email ?? "")"
        let url = URL(string: api + endpoint)!
        
        let accessToken = "Bearer \(accessToken)"
        
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "GET"
        urlRequest.setValue(accessToken, forHTTPHeaderField: "authorization")
        
        cancellable = URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map({ $0.data })
            .decode(type: GetUsersResponse.self, decoder: JSONDecoder())
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
                        print(decodingError)
                    default:
                        completion(.failure(.genericError(error)))
                    }
                }
            }) {(response) in
                completion(.success(response))
            }
    }
}

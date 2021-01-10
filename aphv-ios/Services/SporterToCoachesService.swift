//
//  SporterToCoachesService.swift
//  aphv-ios
//
//  Created by Mark Kea on 10/01/2021.
//

import SwiftUI
import Foundation
import Combine

final class SporterToCoachesService: ObservableObject {
    
    static let shared = SporterToCoachesService()
    
    private var cancellable: AnyCancellable?
    
    func AddCoach(emailCoach : String, emailUser : String, accessToken : String, completion: @escaping (Result<AddCoachesResponse, RequestError>) -> Void) {
        
        
        let api = "https://aphv.azurewebsites.net"
        let endpoint = "/api/users/\(emailUser)/coaches"
        let url = URL(string: api + endpoint)!
        
        let accessToken = "Bearer \(accessToken)"
        
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        urlRequest.setValue(accessToken, forHTTPHeaderField: "authorization")
        
        let parameters = AddCoachRequest(
            email: emailCoach
        )
        
        urlRequest.httpBody = try! JSONEncoder().encode(parameters)
        
        cancellable = URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map({ $0.data })
            .decode(type: AddCoachesResponse.self, decoder: JSONDecoder())
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
    
    
    func GetListOfCoaches(userModel : UserModel, completion: @escaping (Result<GetCoachesResponse, RequestError>) -> Void) {
        
        let api = "https://aphv.azurewebsites.net"
        let endpoint = "/api/users/\(userModel.email ?? "")/coaches"
        let url = URL(string: api + endpoint)!
        
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "GET"
        
//        let parameters = GetCoachesRequest(
//            email: userModel.email ?? "",
//            password: userModel.password ?? ""
//        )
        
//        urlRequest.httpBody = try! JSONEncoder().encode(parameters)
        
        cancellable = URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map({ $0.data })
            .decode(type: GetCoachesResponse.self, decoder: JSONDecoder())
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

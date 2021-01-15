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
    
    //Sporter deletes coach from coaches list
    func DeleteSporterToCoach(emailCoach : String, emailUser : String, accessToken : String, completion: @escaping (Result<String, RequestError>) -> Void) {
        
        let api = "https://aphv.azurewebsites.net"
        let endpoint = "/api/users/\(emailUser)/coaches/\(emailCoach)"
        let url = URL(string: api + endpoint)!
        
        let accessToken = "Bearer \(accessToken)"
        
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "DELETE"
        urlRequest.setValue(accessToken, forHTTPHeaderField: "authorization")
        
        
        cancellable = URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map({ $0.data })
//            .decode(type: [CoachModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    switch error {
                    case let urlError as URLError:
                        completion(.failure(.urlError(urlError)))
//                    case let decodingError as DecodingError:
//                        completion(.failure(.decodingError(decodingError)))
                    default:
                        completion(.failure(.genericError(error)))
                    }
                }
            }) {(response) in
                completion(.success("Succes"))
            }
    }
    
    //Add a coacht to a sporter
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
    
    //retreives list of coaches from a specific child
    //if you look at .decode you see we store the data in an array of CoachModel
    func GetListOfCoaches(emailUser : String, accessToken : String, completion: @escaping (Result<[CoachModel], RequestError>) -> Void) {
        
        let api = "https://aphv.azurewebsites.net"
        let endpoint = "/api/users/\(emailUser)/coaches"
        let url = URL(string: api + endpoint)!
        
        let accessToken = "Bearer \(accessToken)"
        
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "GET"
        urlRequest.setValue(accessToken, forHTTPHeaderField: "authorization")
        
        
        cancellable = URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map({ $0.data })
            .decode(type: [CoachModel].self, decoder: JSONDecoder())
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
                print(response)
            }
    }
    
}

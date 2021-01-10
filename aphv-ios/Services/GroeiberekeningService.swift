//
//  GroeiberekeningService.swift
//  aphv-ios
//
//  Created by Mark Kea on 09/01/2021.
//

import SwiftUI
import Foundation
import Combine

final class GroeiberekeningService : ObservableObject {
    
    static let shared = GroeiberekeningService()
    
    
    private var cancellable: AnyCancellable?
    
    func GroeiberekeningWithoutAccount(groeiberekeningModel : GroeiberekeningModel, completion: @escaping (Result<GroeiberekeningResponse, RequestError>) -> Void) {
        
        let api = "https://aphv.azurewebsites.net"
        let endpoint = "/api/anonymous/growthcalculation"
        let url = URL(string: api + endpoint)!
        
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        
        let parameters = GroeiberekeningRequest(
            dateOfBirth: groeiberekeningModel.dateOfBirth ?? "",
            gender: groeiberekeningModel.gender ?? "",
            dateOfMeasurement: groeiberekeningModel.dateOfMeasurement ?? "",
            weight: groeiberekeningModel.weight ?? 0,
            sittingHeight: groeiberekeningModel.sittingHeight ?? 0,
            standingHeight: groeiberekeningModel.standingHeight ?? 0
        )
        
        urlRequest.httpBody = try! JSONEncoder().encode(parameters)
        
        cancellable = URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map({ $0.data })
            .decode(type: GroeiberekeningResponse.self, decoder: JSONDecoder())
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
    
    func GroeiberekeningWithAccount(groeiberekeningModel : GroeiberekeningModel, accessToken : String?, completion: @escaping (Result<GroeiberekeningResponse, RequestError>) -> Void) {
        
        let api = "https://aphv.azurewebsites.net"
        let endpoint = "/api/anonymous/growthcalculation"
        let url = URL(string: api + endpoint)!
        
        let accessToken = "Bearer \(accessToken ?? "")"
        print(accessToken)
        
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        urlRequest.addValue(accessToken, forHTTPHeaderField: "authorization")
        
        let parameters = GroeiberekeningWithAccountRequest(
            dateOfMeasurement: groeiberekeningModel.dateOfMeasurement ?? "",
            weight: groeiberekeningModel.weight ?? 0,
            sittingHeight: groeiberekeningModel.sittingHeight ?? 0,
            standingHeight: groeiberekeningModel.standingHeight ?? 0
        )
        
        urlRequest.httpBody = try! JSONEncoder().encode(parameters)
        
        cancellable = URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map({ $0.data })
            .decode(type: GroeiberekeningResponse.self, decoder: JSONDecoder())
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


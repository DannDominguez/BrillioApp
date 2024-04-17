//
//  APIClient.swift
//  BrillioApp
//
//  Created by Daniela Ciciliano on 16/04/24.
//

import Foundation

class APIClient {
    
    func getQuotes(completion: @escaping (Result<QuoteModel, Error>) -> Void) {
        
        
        var request = URLRequest(url: URL(string: "https://api.quotable.io/random")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data,
            response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error)")
                } else {
                    print("No data received")
                }
                return
            }
            print(String(data: data, encoding: .utf8)!)
            
            do {
                let result = try JSONDecoder().decode(QuoteModel.self, from: data)
                completion(.success(result))
            } catch {
                print("Error decoding JSON:\(error)")
                completion(.failure(error))
            }
        }.resume()
    }
    
}

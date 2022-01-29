//
//  NetworkManager.swift
//  BreakingBadApp
//
//  Created by Pandos on 04.03.2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()

    private init() {}
    
    func fetchData(from url: String?, with complition: @escaping ([Character]) -> Void) {
        guard let stringURL = url else { return }
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            if let response = response {
                print(response)
            }

            guard let data = data else { return }

            do {
                let characters = try JSONDecoder().decode([Character].self, from: data)
                DispatchQueue.main.async {
                    complition(characters)
                }
            } catch let error {
                print(error)
            }

        } . resume()

    }

}

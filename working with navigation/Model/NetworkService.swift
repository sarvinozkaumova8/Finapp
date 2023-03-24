//
//  NetworkService.swift
//  working with navigation
//
//  Created by Sarvinoz Kayumova on 23/03/23.
//

import Foundation

class NetworkService {
    func fetchData(urlString: String, completion: @escaping(Result<ServicesData, Error>) -> Void) {
    
        
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            //print(url)
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else {return}
                do {
                    let urlData = try JSONDecoder().decode(ServicesData.self, from: data)
                    //print(urlData)
                    completion(.success(urlData))
                }catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}

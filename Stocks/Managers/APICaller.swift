//
//  APICaller.swift
//  Stocks
//
//  Created by Alex Cruz on 2022-09-19.
//

import Foundation

final class APICaller{
    
    //MARK: - Properties
    static let shared = APICaller()
    private struct Constants{
        static let apiKey = ""
        static let sandBoxKey = ""
        static let baseUrl = ""
    }
    
    private init(){
    }
    
    //MARK: - Public
    
    //MARK: - Private
    
    private enum Endpoint: String{
        case search
    }
    private enum APIError: Error{
        case noDataReturned
        case invaildURL
    }
    private func url(for endPoint: Endpoint, queryParms: [String:String] = [:]) -> URL? {
        return nil
    }
    
    private func request<T:Codable>(url: URL?, expecting: T.Type, completion: @escaping(Result<T, Error>) -> Void){
        
        guard let url = url else {
            completion(.failure(APIError.invaildURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                if let error = error {
                    completion(.failure(error))
                }else{
                    completion(.failure(APIError.noDataReturned))
                }
                return
            }
            
            do{
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            }catch{
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}

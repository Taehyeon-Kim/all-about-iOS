//
//  Service.swift
//  GithubJobs
//
//  Created by taehy.k on 2021/01/08.
//

import Foundation

class Service {
    // 이게 싱글톤 패턴(Singleton Pattern)이라는 것이구나
    // 생성된 객체를 어디서든 참조할 수 있도록 하는 패턴, Thread safe하게 작성해서 multi-thread에서 사용해도 문제가 없어야 함.
    static let shared = Service()
    
    // github 홈페이지에서 job api를 받아오는 함수
    func getResults(description: String, completed: @escaping (Result<[Jobs], ErrorMessage>) -> Void) {
        let urlString = "https://jobs.github.com/positions.json?description=\(description.replacingOccurrences(of: " ", with: "+"))"
        guard let url = URL(string: urlString) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completed(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            do {
                let deconder = JSONDecoder()
                deconder.keyDecodingStrategy = .convertFromSnakeCase
                let results = try deconder.decode([Jobs].self, from: data)
                completed(.success(results))
               
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}

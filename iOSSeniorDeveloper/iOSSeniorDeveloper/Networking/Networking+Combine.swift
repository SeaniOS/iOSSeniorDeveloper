//
//  Networking+Combine.swift
//  iOSSeniorDeveloper
//
//  Created by DO HOANG SON on 14/12/25.
//

import Foundation
import Combine
import Alamofire

private struct Repo: Decodable {
    let id: Int
    let name: String
    let fullName: String
    let htmlURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case htmlURL = "html_url"
    }
}

class LearningNetworking {
    private var cancellables: Set<AnyCancellable> = []
    private init() {}
    static let shared = LearningNetworking()
    private let urlString = "https://api.github.com/users/SeaniOS/repos"
}

extension LearningNetworking {
    func demoAlamofire() {
        Task {
            /// MockURLProtocol: URLProtocol
            let response = try await AF.request(urlString)
                .validate()
                .serializingDecodable([Repo].self)
                .value
            print("⚡️ response: \(response)")
        }

        
        /*
        AF.request(urlString)
            .validate()
            .responseDecodable(of: [Repo].self) { response in
                switch response.result {
                case .success(let repos):
                    repos.forEach {
                        print($0.name)
                    }
                    
                case .failure(let error):
                    print("Error:", error)
                }
            }
        */
    }
}

extension LearningNetworking {
    func demoCombine() {
        guard let url = URL(string: urlString) else {
            print("⚡️ Invalid URL")
            return
        }
        
        URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Repo.self, decoder: JSONDecoder())
            /*.tryMap { data, _ in
                try JSONDecoder().decode(Repo.self, from: data)
            }*/
            .sink { completion in
                if case .failure(let err) = completion {
                    print("⚡️ Retrieving data failed with error \(err)")
                }
            } receiveValue: { object in
                print("⚡️ Retrieved object \(object)")
            }
            .store(in: &cancellables)
        
        /*
        URLSession.shared
            .dataTaskPublisher(for: url)
            .sink { completion in
                if case .failure(let err) = completion {
                    print("⚡️ Retrieving data failed with error \(err)")
                }
            } receiveValue: { (data: Data, response: URLResponse) in
                print(
                    "⚡️ Retrieved data of size \(data.count), response = \(response)"
                )
            }
            .store(in: &cancellables)
        */
    }
}

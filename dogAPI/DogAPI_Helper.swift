

import Foundation

class DogAPI_Helper{
    static var baseURL = "https://dog.ceo/api/breeds/list/all"
    
    static var session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    static func fetchBreeds() async throws -> [String:[String]]{
        guard
            let url = URL(string: baseURL)
        else{throw("Cannot convert baseURL to an actual URL" as! Error)}
        let request = URLRequest(url: url)
        let (data, _) = try await session.data(for: request)
        let jsonObject = try JSONSerialization.jsonObject(with: data)
        guard
            let jsonDictionary = jsonObject as? [AnyHashable: Any],
            let breeds = jsonDictionary["message"] as? [String:[String]]
        else {throw("could not parse data") as! Error}
        return breeds
    }
}

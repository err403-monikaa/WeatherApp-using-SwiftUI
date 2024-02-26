//
//  WebServiceManager.swift
//  Weather
//
//  Created by Monikaa on 24/02/24.
//

import Foundation
import Alamofire

class WebServiceManager {
    func getRequestData(urlString: String, completion: @escaping(Weather) -> Void) {
        let request = AF.request(urlString)
        request.responseDecodable(of: Weather.self) { response in
            let result = response.result
            switch result {
            case .success(let value):
                completion(value)
            case .failure(let error):
                print(error)
            }
        }
    }
}


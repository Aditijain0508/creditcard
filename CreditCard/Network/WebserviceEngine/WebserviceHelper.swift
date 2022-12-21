//
//  WebserviceHelper.swift
//  NetworkLayerDemo
//

import Foundation

protocol DataHelper {
  func requestAPI(apiModel: APIModelType, completion: @escaping WebServiceCompletionBlock)
}

enum NetworkError: Error {
    case incorrectData(Data)
    case incorrectURL
    case unknown
}

typealias WebServiceCompletionBlock = (Result<Data, Error>) -> Void

/// Helper class to prepare request(adding headers & clubbing base URL) & perform API request.
class WebserviceHelper {
    
    public static let shared = WebserviceHelper()
    private init () {}
    
    /// Performs a API request which is called by any service request class.
    /// It also performs an additional task of validating the auth token and refreshing if necessary
    ///
    /// - Parameters:
    ///   - apiModel: APIModelType which contains the info about api endpath, header & http method type.
    ///   - completion: Request completion handler.
    /// - Returns: Returns a URLSessionDataTask instance.
    func requestAPI(apiModel: APIModelType, completion: @escaping WebServiceCompletionBlock){
        guard let url = createAPIPath(basePath: apiModel.api.apiBasePath(), endPoint: apiModel.api.apiEndPath()) else{ return }
        var request = URLRequest(url: url)

        request.httpMethod = apiModel.api.httpMthodType().rawValue
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? NetworkError.unknown))
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse,  ![200, 201].contains(httpStatus.statusCode) {
                completion(.failure(NetworkError.incorrectData(data)))
            }
            completion(.success(data))
            
        }
        
        task.resume()
    }
    
    func createAPIPath(basePath:String, endPoint:String)-> URL?{
        return  URL(string: (basePath+endPoint))
        
    }
    
}

extension WebserviceHelper: DataHelper{}

////
////  NetworkLayer.swift
////  Dashboard
////
////  Created by Aditi Jain 3 on 28/05/22.
////
//
//import Foundation
//
//
///// An enum for various HTTPMethod. I've implemented GET and POST. I'll update the code and add the rest shortly :D
//fileprivate enum HTTPMethod: String {
//    case get     = "GET"
//    case post    = "POST"
//    case put     = "PUT"
//    case patch   = "PATCH"
//    case delete  = "DELETE"
//}
//
///// to provide data to the API Calls
//typealias Parameters = [String : Any]
//
//
///// for encoding the Query Parameters in case of a GET call. Queries are passed in the ?q=<>&<> format
//fileprivate enum URLEncoding {
//    case queryString
//    case none
//    
//    func encode(_ request: inout URLRequest, with parameters: Parameters)  {
//        switch self {
//        /// In case we need to pass Query Params to GET / Rarely for POST requests too
//        case .queryString:
//            guard let url = request.url else { return }
//            if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false),
//               !parameters.isEmpty {
//                
//                urlComponents.queryItems = [URLQueryItem]()
//                for (k, v) in parameters {
//                    let queryItem = URLQueryItem(name: k, value: "\(v)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
//                    urlComponents.queryItems?.append(queryItem)
//                }
//                request.url = urlComponents.url
//            }
//            
//        /// default case f
//        case .none:
//            break
//        }
//    }
//}
//
//protocol APIRequestProtocol {
//    static func makeRequest(session: URLSession, request: URLRequest, onCompletion: @escaping(Data?, Error?) -> ())
//    static func makeGetRequest (path: String, queries: Parameters, onCompletion: @escaping(Data?, Error?) -> ())
//}
//
//
//fileprivate enum APIRequestManager: APIRequestProtocol {
//    case getAPI(path: String, data: Parameters)
//    
//    static var baseURL: URL = URL(string: "https://xpfdwo4mp6.execute-api.us-east-1.amazonaws.com/default/")!
//    
//    private var path: String {
//        switch self {
//        case .getAPI(let path, _):
//            return path
//        }
//    }
//    
//    private var method: HTTPMethod {
//        switch self {
//        case .getAPI:
//            return .get
//    
//        }
//    }
//    
//    
//    // MARK:- functions
//    fileprivate func addHeaders(request: inout URLRequest) {
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//    }
//    
//    fileprivate func asURLRequest() -> URLRequest {
//        /// appends the path passed to either of the enum case with the base URL
//        var request = URLRequest(url: Self.baseURL.appendingPathComponent(path))
//        
//        /// appends the httpMethod based on the enum case
//        request.httpMethod = method.rawValue
//        
//        var parameters = Parameters()
//        
//        switch self {
//        case .getAPI(_, let queries):
//            queries.forEach({parameters[$0] = $1})
//            URLEncoding.queryString.encode(&request, with: parameters)
//
//        }
//        self.addHeaders(request: &request)
//        return request
//    }
//    
//    /// This function calls the URLRequest passed to it, maps the result and returns it. It is called by GET and POST.
//    fileprivate static func makeRequest(session: URLSession, request: URLRequest, onCompletion: @escaping(Data?, Error?) -> ()) {
//        session.dataTask(with: request) { data, response, error in
//            guard error == nil, let responseData = data else { onCompletion(nil, error) ; return }
//            onCompletion(responseData, nil)
//        }.resume()
//    }
//    
//    /// Generic GET Request
//    fileprivate static func makeGetRequest(path: String, queries: Parameters, onCompletion: @escaping(Data?, Error?) -> ()) {
//        let session = URLSession.shared
//        let request: URLRequest = Self.getAPI(path: path, data: queries).asURLRequest()
//        
//        makeRequest(session: session, request: request) { (result, error) in
//            onCompletion(result, error)
//        }
//    }
//}
//
//
////open class NetworkManager {
////    
////    // MARK:- functions
////    
////    public init() {}
////    
////    public func getPosts(onCompletion: @escaping (Data?, Error?) -> ()) {
////        APIRequestManager.makeGetRequest(path: "helloWorld", queries: [:]) { (result: Data?, error) in
////            onCompletion(result, error)
////        }
////    }
////}

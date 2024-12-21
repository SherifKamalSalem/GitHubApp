//
//  BaseAPIClient.swift
//  GithubUsers
//
//  Created by Sherif Kamal Salem on 19/12/2024.
//

import Foundation

protocol BaseAPIClientProtocol {
    func perform<T: Decodable>(_ configuration: APIRequestConfiguration) async throws -> T?
}

struct BaseAPIClient: BaseAPIClientProtocol {
    private func logRequest(_ request: URLRequest) {
        if let headers = request.allHTTPHeaderFields {
            headers.forEach { print("  \($0.key): \($0.value)") }
        } else {
            print("  No Headers")
        }
        if let body = request.httpBody,
           let bodyString = String(data: body, encoding: .utf8) {
            print("  \(bodyString)")
        } else {
            print("  No Body")
        }
    }
    
    private func logResponse(_ response: HTTPURLResponse, data: Data) {
        response.allHeaderFields.forEach { print("  \($0.key): \($0.value)") }
        if let jsonObject = try? JSONSerialization.jsonObject(with: data),
           let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted),
           let prettyString = String(data: jsonData, encoding: .utf8) {
            print(prettyString)
        } else if let rawString = String(data: data, encoding: .utf8) {
            print(rawString)
        } else {
            print("  No Response Body or Invalid JSON")
        }
    }
    
  @discardableResult
  func perform<T>(_ configuration: APIRequestConfiguration) async throws -> T? where T : Decodable {
    let request = try configuration.asURLRequest()
      logRequest(request)
    let (data, response) = try await URLSession.shared.data(for: request)
    guard let response = response as? HTTPURLResponse,
          response.statusCode == 200
    else {
      if let response = response as? HTTPURLResponse {
          logResponse(response, data: data)
        let statusCode = response.statusCode
        switch statusCode {
            /// 1020 means dataNotAllowed -> Internet is closed
            /// 1009 Internet is opened but no connection happens
          case 1009, 1020:
            throw SessionDataTaskError.noInternetConnection
          case 404:
            throw SessionDataTaskError.notFound
          case 400:
            throw SessionDataTaskError.notAuthorized
          case 500 ... 599:
            throw SessionDataTaskError.server
          default:
            throw SessionDataTaskError.noData
        }
      }
      return [] as? T
    }
    let decoder = JSONDecoder()
    let decodedData = try decoder.decode(T.self, from: data)
    return decodedData
  }
}

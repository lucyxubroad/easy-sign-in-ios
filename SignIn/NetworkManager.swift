//
//  NetworkManager.swift
//  SignIn
//
//  Created by Lucy Xu on 1/23/19.
//  Copyright © 2019 Xu, Lucy L. All rights reserved.
//

import Foundation

import Alamofire

class NetworkManager {
    private static let endpointBase = "http://localhost:5000/"
    private static let eventsEndpoint = "http://localhost:5000/api/events/"

    
    
    static func getEvents(completion: @escaping ([Event2]) -> Void) {
        Alamofire.request(eventsEndpoint, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let eventResponse = try? jsonDecoder.decode(EventResponse.self, from: data) {
                    completion(eventResponse.data)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func createEvent(event: String, club: String, building: String, room: String, completion: @escaping (Event2) -> Void) {
        let parameters: [String: Any] = [
            "event": event,
            "club": club,
            "building": building,
            "room": room
        ]
        
        Alamofire.request(eventsEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let eventResponse = try? jsonDecoder.decode(EventReturnResponse.self, from: data) {
                    completion(eventResponse.data)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print("There was an error!")
                print(error.localizedDescription)
            }
        }
    }
    
//    static func registerUser(email: String, password: String, completion: @escaping (RegisterUserResponse) -> Void) {
//        let parameters: [String: Any] = [
//            "email": email,
//            "password": password
//        ]
//
//        Alamofire.request(registerUserEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).validate().responseData { (response) in
//            switch response.result {
//            case .success(let data):
//                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
//                    print(json)
//                }
//                let jsonDecoder = JSONDecoder()
//                if let postResponse = try? jsonDecoder.decode(RegisterUserResponse.self, from: data) {
//                    completion(postResponse)
//                } else {
//                    print("Invalid Response Data")
//                }
//            case .failure(let error):
//                print("There was an error!")
//                print(error.localizedDescription)
//            }
//        }
//    }
    
//    static func loginUser(email: String, password: String, completion: @escaping (RegisterUserResponse) -> Void) {
//        let parameters: [String: Any] = [
//            "email": email,
//            "password": password
//        ]
//
//        Alamofire.request(loginUserEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).validate().responseData { (response) in
//            switch response.result {
//            case .success(let data):
//                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
//                    print(json)
//                }
//                let jsonDecoder = JSONDecoder()
//                if let postResponse = try? jsonDecoder.decode(RegisterUserResponse.self, from: data) {
//                    completion(postResponse)
//                } else {
//                    print("Invalid Response Data")
//                }
//            case .failure(let error):
//                print("There was an error!")
//                print(error.localizedDescription)
//            }
//        }
//    }
}


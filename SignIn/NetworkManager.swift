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
    private static let eventsEndpoint = "http://35.229.55.231/api/events/"
    private static let registerUserEndpoint = "http://35.229.55.231/register/"
    private static let loginUserEndpoint = "http://35.229.55.231/login/"
    
    static func getEvents(completion: @escaping ([Event]) -> Void) {
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
    
    static func getEventsByUserId(userId: Int, completion: @escaping ([Event]) -> Void) {
        let eventsEndpoint = "http://35.229.55.231/api/\(userId)/events/"
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
    
    static func getEventsAttendees(event_id: Int, completion: @escaping ([User]) -> Void) {
        let eventsEndpoint = "http://35.229.55.231/api/event/\(event_id)/attendees/"
        Alamofire.request(eventsEndpoint, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let eventResponse = try? jsonDecoder.decode(EventAttendeeResponse.self, from: data) {
                    completion(eventResponse.data)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func createEvent(event: String, club: String, location: String, description: String, event_creator: Int, photo: String, completion: @escaping (Event) -> Void) {
        let parameters: [String: Any] = [
            "event": event,
            "club": club,
            "location": location,
            "description": description,
            "event_creator": event_creator,
            "photo": photo
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
    
    static func signInEvent(event_id: Int, user_id: Int, completion: @escaping (Event) -> Void) {
        print(user_id)
        print(event_id)
        let parameters: [String: Any] = [
            "user_id": user_id
        ]
        let signInEndpoint = "http://35.229.55.231/api/event/\(event_id)/signin/"
        
        Alamofire.request(signInEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).validate().responseData { (response) in
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
    
    static func registerUser(email: String, password: String, first_name: String, last_name: String, completion: @escaping (RegisterUserResponse) -> Void) {
        let parameters: [String: Any] = [
            "email": email,
            "password": password,
            "first_name": first_name,
            "last_name": last_name
        ]

        Alamofire.request(registerUserEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let jsonDecoder = JSONDecoder()
                if let postResponse = try? jsonDecoder.decode(RegisterUserResponse.self, from: data) {
                    completion(postResponse)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print("There was an error!")
                print(error.localizedDescription)
            }
        }
    }
    
    static func loginUser(email: String, password: String, completion: @escaping (RegisterUserResponse) -> Void) {
        print("loginUser")
        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]

        Alamofire.request(loginUserEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                print("Success in loginUser")
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let jsonDecoder = JSONDecoder()
                if let postResponse = try? jsonDecoder.decode(RegisterUserResponse.self, from: data) {
                    completion(postResponse)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print("There was an error!")
                print(error.localizedDescription)
            }
        }
    }
}


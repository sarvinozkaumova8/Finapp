//
//  ServicesModel.swift
//  working with navigation
//
//  Created by Sarvinoz Kayumova on 23/03/23.
//

import Foundation

struct Services: Codable {
    var category: String?
    var subs: [Subs]
    
    enum CodingKeys: Codable, CodingKey {
        case category, subs
    }
}

struct Subs: Codable {
    var name: String?
}

typealias ServicesData = [Services]

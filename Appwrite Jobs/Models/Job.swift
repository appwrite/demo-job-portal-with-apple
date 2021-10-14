//
//  Job.swift
//  Appwrite Jobs
//
//  Created by Damodar Lohani on 14/10/2021.
//

import Foundation

class Job: Identifiable {
    public let id: String
    public let title: String
    public let link: String
    public let logo: String
    public let company: String
    public let description: String
    public let location: String
    
    init(
        id: String,
        title: String,
        link: String,
        logo: String,
        company: String,
        description: String,
        location: String
    ) {
        self.id = id
        self.title = title
        self.link = link
        self.logo = logo
        self.company = company
        self.description = description
        self.location = location
    }
    
    public static func from(map: [String: Any]) -> Job {
        return Job(
            id: map["$id"] as! String,
            title: map["title"] as! String,
            link: map["link"] as! String,
            logo: map["logo"] as! String,
            company: map["company"] as! String,
            description: map["description"] as! String,
            location: map["location"] as! String
        )
    }
    
    public func toMap() -> [String: Any] {
        return [
            "title": title as Any,
            "link": link as Any,
            "logo": logo as Any,
            "company": company as Any,
            "description": description as Any,
            "location": location as Any
        ]
    }
}

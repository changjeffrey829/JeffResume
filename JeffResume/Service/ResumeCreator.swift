//
//  ResumeCreator.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 2/3/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import Foundation

struct ResumeCreator {
    
    static func bio() -> String {
        return
"""
Hi potential employer
        My name is Jeffrey and I am a self-taught developer with roughly 2 years of experience. This app is for me to demonstrate some of my skillsets I learned. You can find the source codes on Github. As you can see software development is my passion, and I would love to use my passion to build your project.
"""
    }
    
    static func jobHistory() -> [Job] {
        let mei = Job(
            companyName: "Mei",
            jobTitle: "Contractor/iOS developer",
            startDate: "Jul 2019",
            endDate: "Jan 2020",
            description:
"""
- Peaked 10,000 active users.
- Built persistent storage solution with CoreData and UserDefaults.
- Converted zipped text file to CSV file.
- Supported 30 different languages.
- Implemented Crashlytics, Firebase Analytics and branch.io
""",
            technology: "Swift, MVVM, In app purchase, SCRUM, Branch, Firebase authentication, CoreData, Unit-Testing.",
            appStoreLink: "https://apps.apple.com/us/app/mei-ai-for-relationships/id1375607916")
        let coloTek = Job(
            companyName: "ColoTek",
            jobTitle: "Intern/iOS developer",
            startDate: "Jan 2019",
            endDate: "Mar 2019",
            description:
"""
- Break features down into user stories.
- Leveraged SwiftLint for consistent code styling.
- Created client side for chat message application.
""",
            technology: "Swift, MVC, Continuous Integration, Alamofire, SCRUM, Firebase cloud messaging",
            appStoreLink: nil)
        let aride = Job(
            companyName: "Aride",
            jobTitle: "Intern/iOS developer",
            startDate: "Aug 2018",
            endDate: "Dec 2018",
            description:
"""
- Transitioned code base from MVC to MVVM.
- Converted payment system and map view from Objective-C code to Swift.
- Used Google Map and geocoding to track user's current location and address.
- Created and replaced a third party slide view menu.
""",
            technology: "Objective-C, Swift, MVVM, Unit-testing, Google Map, Geocoding, Stripe, Firebase Cloud Messaging, Alamofire",
            appStoreLink: nil)
        let myBrowniePoints = Job(
            companyName: "My BrowniePoints",
            jobTitle: "Self-employed/iOS developer",
            startDate: "Jun 2017",
            endDate: "Aug 2018",
            description:
"""
- Sole developer for iOS and backend.
- Implemented application design based on MVC architecture.
- Setup firebase NoSQL as backend.
- Used Node.js for firebase cloud function and push notification.
- Designed and developed the login process, User's profile, and core minimal viable product.
""",
            technology: "Technology: Swift, Node.js, Atom, Firebase, APNS, MVC, CocoaPods, Github.",
            appStoreLink: "https://itunes.apple.com/us/app/mybrowniepointz/id1418854178?mt=8")
        let navy = Job(
            companyName: "Navy",
            jobTitle: "Petty officer 2nd class",
            startDate: "Mar 2006",
            endDate: "Mar 2014",
            description:
"""
- Security Team for Crud Oil transport in Iraq
- Security Team supervisor for Entry Control Point in Kuwait
- Directly in charge of 6 subordinates training and mission readiness
""",
            technology: "",
            appStoreLink: nil)
        return [mei, coloTek, aride, myBrowniePoints, navy]
    }
}

//
//  data.swift
//  iKid
//
//  Created by GeFrank on 10/24/18.
//  Copyright © 2018 GeFrank. All rights reserved.
//

import Foundation
import UIKit

struct jokeData {
    static let jokeType = ["Knock Knock", "Good", "Punny", "Dad"]
    static let jokes: [String: [String]] = ["Why couldn't the blond add 10 and seven on a calculator?": ["She couldn't find the 10 key"],
                 "Why did the calf cross the road?": ["To get to the udder side."],
                 "Why are North Koreans good at geometry?": ["They have a supreme ruler"],
                 "Knock Knock": ["Who's there", "Jamaican",  "Jamaican who?", "Jamaican me crazy with these knock knock jokes!"]]
    static var currentJoke: String?
}

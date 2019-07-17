//
//  StringFunctions.swift
//  DictionaryMVC
//
//  Created by Shubhang Dixit on 23/01/18.
//  Copyright © 2018 Shubhang Dixit. All rights reserved.
//

import Foundation
import UIKit
class StringFunctions {
    static func keyformatter(word : String) -> String {
        return word.replacingOccurrences(of: " ", with: "", options: NSString.CompareOptions.literal, range:nil)
    }
}

//
//  ApiUrl.swift
//  DictionaryMVC
//
//  Created by Shubhang Dixit on 06/02/18.
//  Copyright © 2018 Shubhang Dixit. All rights reserved.
//

import Foundation
import UIKit
func getApiUrl(word : String) -> String {
    return "https://owlbot.info/api/v2/dictionary/\(word)?format=json"
}


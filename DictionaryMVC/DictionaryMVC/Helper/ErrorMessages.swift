//
//  ErrorMessages.swift
//  DictionaryMVC
//
//  Created by Shubhang Dixit on 06/02/18.
//  Copyright © 2018 Shubhang Dixit. All rights reserved.
//

import Foundation

enum ErrorAlert : String {
    case noResults = "No Results"
    case networkError = "Network Error"
    
    func getDetail() -> String {
        switch self {
        case .noResults:
            return "Sorry! We couldnt get any meanings for this word"
        case .networkError:
            return "Not able to fetch any api response"
        }
    }
}


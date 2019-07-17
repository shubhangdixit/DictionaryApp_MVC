//
//  ApiResponse.swift
//  DictionaryMVC
//
//  Created by Shubhang Dixit on 19/01/18.
//  Copyright © 2018 Shubhang Dixit. All rights reserved.
//

import Foundation
class ApiResponse
{
    
    static func getDefinitions(word : String, completion: @escaping ([Word]?) -> Void)
    {
        let constants = ApiConstants()
        var definitionsList = [Word]()
        let wordkey = StringFunctions.keyformatter(word: word)
        let urlString = getApiUrl(word: wordkey)
        let jsonURL = URL(string :urlString)
        
        URLSession.shared.dataTask(with:jsonURL!) { (data, response, error) in
            if error != nil {
                print(error ?? "error")
            } else {
                do {
                    let parsedData = try JSONSerialization.jsonObject(with: data!) as! [[String:Any]]
                    for item in parsedData {
                        if let type = item[constants.meaningType] as? String {
                            if let definition = item[constants.meaningDefinition] as? String {
                            var exampleKey : String = "NA"
                            if let example = item[constants.meaningExample] as? String
                            {
                                exampleKey = example
                            }
                            let definition = Word(type: type, definition: definition, example: exampleKey)
                        definitionsList.append(definition)
                            }
                        }
                    }
                } catch let error as NSError {
                    print(error)
                    completion(nil)
                }
                completion(definitionsList)
            }
            }.resume()
        }
}

//
//  main.swift
//  JsonRead
//
//  Created by MacStudent on 2020-02-19.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation

func readTextFile(fileName: String)
{
    print(Bundle.main.bundlePath)
    if let path = Bundle.main.path(forResource: fileName, ofType: "txt")
    {
       // print(path)
        let str = try! String(contentsOfFile: path)
        print(str)
    }
}

readTextFile(fileName: "data")

func readJSONUserInfo(fileName: String)
{
    let filePath = Bundle.main.url(forResource: fileName, withExtension: "json")
    guard  let path = filePath
        else {
        print("Invalid File path")
        return
    }
    guard let data = try? Data(contentsOf: path) else
    {
        print("Error while read from URL")
        return
    }
    
    guard let json = try? JSONSerialization.jsonObject(with: data, options: [])
        else {
            print("error")
            return
    }
    print(json)
}

readJSONUserInfo(fileName: "Singleuser")

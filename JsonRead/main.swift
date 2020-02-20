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
            print("error while reading json from file")
            return
    }
    //print(json)
    
    if let userDictionary = json as? [String: Any]
    {
        print(userDictionary)
        let id = userDictionary["id"] ?? "No ID Found"
            print(id)
        let name = userDictionary["name"] ?? "Name not Found"
            print(name)
        let username = userDictionary["username"] ?? "UserName not Found"
        print(username)
        let email = userDictionary["email"] ?? "email not Found"
        print(email)
        if let addressDictionary = userDictionary["address"] as? [String: Any]
        {
            print(addressDictionary["street"]!)
            print(addressDictionary["suite"]!)
            print(addressDictionary["city"]!)
            print(addressDictionary["zipcode"]!)
            if let geoDictionary = addressDictionary["geo"] as? [String: Any]
            {
                print(geoDictionary["lat"]!)
                print(geoDictionary["lng"]!)
            }
        }
        let phone = userDictionary["phone"] ?? "phone number not Found"
        print(phone)
        let website = userDictionary["website"] ?? "website not Found"
        print(website)
        if let companyDictionary = userDictionary["company"] as? [String: Any]
        {
            print(companyDictionary["name"]!)
            print(companyDictionary["catchPhrase"]!)
            print(companyDictionary["bs"]!)
    
        }
    }
}
    readJSONUserInfo(fileName: "Singleuser")


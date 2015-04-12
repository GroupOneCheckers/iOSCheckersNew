//
//  API.swift
//  Checkers
//
//  Created by William McDuff on 2015-02-17.
//  Copyright (c) 2015 Cal. All rights reserved.
//

import Foundation

//
//  API.swift
//  RailsRequest
//
//  Created by William McDuff on 2015-02-17.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

import Foundation


// username: githubName: Will16 email: Will16@aol.com
// token: 'S6pYAYpPEgDGjfxg-B4m"

// taken from the postman app, next to post
let API_URL = "https://ninja-checkers.herokuapp.com/"


protocol SignedInProtocol {
    func goToApp()
    func signInUnsuccesful(error: String)
    
    
    
}

protocol validMoveProtocol {
    
    func validMove(isValid: Bool) -> Bool
    
}

class APIRequest {
    
    
    var delegate: SignUpViewController?
    
    var delegate2: LoginViewController?
    
    // (responseInfo: [String:AnyObject]) -> ()
    
    // that class func gets called in the user class
    
    //from options, take the body string, change it in json and the nchange the json to data
    
    // USEFULNESS OF BLOCKS VS CREATING A FUNCTION AT THE END: WITH BLOCK, CAN DO SOMETHING SPECIFIC AT THEN END EVERYTIME WE CALL A FUNCTION
    class func requestWithOptions(options: [String: AnyObject], andCompletion completion: (responseInfo: [String:AnyObject]?, error: String?) -> ()) {
        
        
        // wrapping it in a parenthesis otherwise the + sign doesn't see the as String
        // the url + users
        var url = NSURL(string: API_URL + (options["endpoint"] as String))
        var request = NSMutableURLRequest(URL: url!)
        
        // method is post
        request.HTTPMethod = options["method"] as String
        
        
        let bodyInfo = options["body"] as [String: AnyObject]
        
        let requestData = NSJSONSerialization.dataWithJSONObject(bodyInfo, options: NSJSONWritingOptions.allZeros, error: nil)
        
        let jsonString = NSString(data: requestData!, encoding: NSUTF8StringEncoding)
        
        let postLength = "\(jsonString!.length)"
        
        request.setValue(postLength, forHTTPHeaderField: "Content-Length")
        
        let postData = jsonString?.dataUsingEncoding(NSASCIIStringEncoding, allowLossyConversion: true)
        
        
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.HTTPBody = postData
        
        // mainQueue is not the main thread (just a queue)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            
            if error == nil {
                
                // do something with data
                
                // mutable containers so we can change something with it
                let json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: nil) as [String:AnyObject]
                
                // WE CALL THE COMPLETION BLOCK
                completion(responseInfo: json, error: nil)
            }
                
            else {
                
                
                var errorString =  error.description
                
                println(errorString)
                
                
            }
            
        }
        
    }
    
    
    
    
}

// create a singleton of the user
// to do that we need an initializer: two ways, make user inherit from nsobject or create an init() function (NOTHING NEEDS TO BE IN IT SWIFT KNOWS IT IS FOR INITIALIZATION
private let _currentUser = User()
// properties like token, email, password. We pass the token to the request class and when api receive after completion resend to the user class
class User {
    
    var delegate: SignUpViewController?
    
    var delegate2: LoginViewController?
    
    var delegate3: GameBoardView?
    
    var token: String? {
        
        didSet {
            
            // do that so we can get that token value when we open the app
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(token, forKey: "token")
            
            // synchronize = save
            defaults.synchronize()
        }
        
    }
    
    
    init() {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        token = defaults.objectForKey("token") as? String
        
        
    }
    
    // getter: will return our singleton object
    class func currentUser() -> User {
        return _currentUser
    }
    
    
    // Change To GET INSTEAD OF POST
    func getUserToken(username: String, email: String, password: String) {
        
        
        // the key names are for us (we chose the name of the keynames, the values are going to be used for url request)
        let options: [String:AnyObject] = [
            
            "endpoint": "users",
            "method": "POST",
            "body": [
                
                "user": [ "username": username, "email": email, "password": password ]
                
                
            ]
        ]
        
        
        // responseInfo will be set at the end of the requestwithoptions function: (completion: requestWithoptions), then we will print responseInfo
        APIRequest.requestWithOptions(options, andCompletion: { (responseInfo, error) -> () in
            
            
            println(responseInfo)
            
            if error != nil {
                
                println("Error != nil")
                self.delegate?.signInUnsuccesful(error!)
            }
                
            else {
                
                
                println(responseInfo!)
                if let dataInfo: AnyObject = responseInfo!["user"] {
                    if let token = dataInfo["authentication_token"] as? String {
                        self.token = token
                    }
                    
                    
                    
                    
                    self.delegate?.goToApp()
                    
                }
                    
                    
                    
                    
                    
                else {
                    
                    println("No data Info")
                    self.delegate?.signInUnsuccesful(responseInfo!.description)
                }
            }
            
            // do something here after request is done
            
        })
    }
    
    
    
    func sendMove(token: String, id:Int, start: (Int, Int), end: (Int, Int)) -> Bool {
        // the key names are for us (we chose the name of the keynames, the values are going to be used for url request)
        
        var (startRow, startCol) = start
        var (endRow, endCol) = end
        
        
        var idString = id.description
        
        var validMove = false
        
        let options: [String: AnyObject] = [
            
            "endpoint": "games/\(idString)",
            "method": "PATCH",
            "body": [
                
                "authentication_token": token,
                "pick": ["token_start": "[\(startRow.description),\(startCol.description)]", "token_end": "[\(endRow.description),\(endCol.description)]"]
            ]
            
            
        ]
        
        
        
        
        
        // responseInfo will be set at the end of the requestwithoptions function: (completion: requestWithoptions), then we will print responseInfo
        APIRequest.requestWithOptions(options, andCompletion: { (responseInfo, error) -> () in
            if error != nil {
                
                println("Error != nil")
                self.delegate3?.validMove(false)
                
            }
            else {
                
                
                
                println(responseInfo)
                if let delegate = self.delegate3 {
                    delegate.validMove(true)
                    validMove = true
                }
                
                
            }
            
            // do something here after request is done
            
        })
        
        return validMove
        
    }
    
    func newGame(token: String) {
        
        let joinOptions: [String:AnyObject] = [
            
            "endpoint" : "games/id",
            "method" : "POST",
            "body" : [
                
                "authentication_token" : token
                
            ]
            
        ]
        
        let createOptions: [String:AnyObject] = [
            
            "endpoint" : "games",
            "method" : "POST",
            "body" : [
                
                "authentication_token" : token
                
            ]
            
        ]
        
        APIRequest.requestWithOptions(joinOptions, andCompletion: { (responseInfo, error) -> () in
            
            if error != nil {
                
                // create a game
                
                // TODO: see what error this prints. be more specific about in what case(s) we should move on to create a game
                println(error)
                
                APIRequest.requestWithOptions(createOptions, andCompletion: { (responseInfo, error) -> () in
                    
                    if error != nil {
                        
                        println("Error != nil")
                        
                    } else {
                        
                        if let dataInfo: AnyObject = responseInfo!["game"] {
                            
                            if let board = dataInfo["board"] as? [[Int]] {
                                
                                // TODO: This probably should work differently, especially once we have multiple games to keep track of at once
                                GameModel().boardSquares = board
                                
                            }
                            
                            if let id = dataInfo["id"] as? Int {
                                
                                GameModel().id = id
                                
                            }
                            
                        }
                        
                    }
                    
                })
                
            } else {
                
                // you can join a game
                
                if let dataInfo: AnyObject = responseInfo!["game"] {
                    
                    if let board = dataInfo["board"] as? [[Int]] {
                        
                        // TODO: This probably should work differently, especially once we have multiple games to keep track of at once
                        GameModel().boardSquares = board
                        
                    }
                    
                    if let id = dataInfo["id"] as? Int {
                        
                        GameModel().id = id
                        
                    }
                    
                }
                
            }
            
        })
        
    }
    
    
    
    func login(email: String, password: String) {
        
        
        // the key names are for us (we chose the name of the keynames, the values are going to be used for url request)
        let options: [String:AnyObject] = [
            
            "endpoint": "/users/sign_in",
            "method": "POST",
            "body": [
                
                "user": [ "email": email, "password": password ]
                
                
            ]
        ]
        
        
        // responseInfo will be set at the end of the requestwithoptions function: (completion: requestWithoptions), then we will print responseInfo
        APIRequest.requestWithOptions(options, andCompletion: { (responseInfo, error) -> () in
            if error != nil {
                
                println("Error != nil")
                self.delegate?.signInUnsuccesful(error!)
            }
            else {
                
                
                println(responseInfo!)
                if let dataInfo: AnyObject = responseInfo!["user"] {
                    if let token = dataInfo["authentication_token"] as? String {
                        self.token = token
                    }
                    
                    
                    
                    if let delegate = self.delegate2 {
                        delegate.goToApp()
                    }
                    
                    
                    
                }
                    
                    
                    
                    
                    
                else {
                    
                    println("No data Info")
                    
                    self.delegate2?.signInUnsuccesful(responseInfo!.description)
                }
            }
            
            // do something here after request is done
            
        })
    }
    
}
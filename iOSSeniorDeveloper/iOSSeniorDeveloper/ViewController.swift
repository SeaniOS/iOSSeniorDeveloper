//
//  ViewController.swift
//  iOSSeniorDeveloper
//
//  Created by Đỗ Hoàng Sơn on 17/03/2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let framgiaUrl = infoForKey("Framgia Url") {
            print(framgiaUrl)
        }
    }
    
    func infoForKey(_ key: String) -> String? {
        return (Bundle.main.infoDictionary?[key] as? String)?
            .replacingOccurrences(of: "\\", with: "")
    }
}


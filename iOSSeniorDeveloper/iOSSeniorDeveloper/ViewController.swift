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
        
        print(infoForKey("Framgia Url") ?? "")
        defineTargetConfig()
    }
}

extension ViewController {
    func infoForKey(_ key: String) -> String? {
        return (Bundle.main.infoDictionary?[key] as? String)?
            .replacingOccurrences(of: "\\", with: "")
    }
}

extension ViewController {
    private func defineTargetConfig() {
#if DEBUG
        print("DEBUG")
#elseif STAGING
        print("STAGING")
#elseif RELEASE
        print("RELEASE")
#elseif DEBUG_DEV
        print("DEBUG_DEV")
#elseif STAGING_DEV
        print("STAGING_DEV")
#elseif RELEASE_DEV
        print("RELEASE_DEV")
#endif
    }
}


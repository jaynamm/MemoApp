//
//  UIViewController+Alert.swift
//  MemoApp
//
//  Created by 남정현 on 2020/07/05.
//  Copyright © 2020 jaynam. All rights reserved.
//

import UIKit

extension UIViewController {
    func alert(title: String = "알림", messages: String) {
        let alert = UIAlertController(title: title, message: messages, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}

//
//  ComposedViewController.swift
//  MemoApp
//
//  Created by 남정현 on 2020/07/05.
//  Copyright © 2020 jaynam. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    
    @IBAction func close(_ sender: Any) {
        // 닫기 후 별도로 값을 전달하려면 completion 부분을 활용
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

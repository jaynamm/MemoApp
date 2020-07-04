//
//  ComposeViewController.swift
//  MemoApp
//
//  Created by 남정현 on 2020/07/05.
//  Copyright © 2020 jaynam. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    var editTarget: Memo?
    
    @IBAction func close(_ sender: Any) {
        // 닫기 후 별도로 값을 전달하려면 completion 부분을 활용
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var memoTextView: UITextView!
    
    @IBAction func save(_ sender: Any) {
        
        guard let memo = memoTextView.text,
            memo.count > 0 else {
                alert(messages: "메모를 입력하세요 !")
            return
        }
        
//        let newMemo = Memo(contents: memo)
//        Memo.dummyMemoList.append(newMemo)
        
        if let target = editTarget {
            target.contents = memo
            DataManager.shared.saveContext()
            NotificationCenter.default.post(name: ComposeViewController.memoDidChange, object: nil)
        } else {
            DataManager.shared.addNewMemo(memo)
            NotificationCenter.default.post(name: ComposeViewController.newMemoDidInsert, object: nil)
        }
        
        // 메모를 수정하고 나서 바로 수정이 안되기 때문에 위에 target 을 설정해주면서 같이 설정한다.
        //NotificationCenter.default.post(name: ComposeViewController.newMemoDidInsert, object: nil)
        
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let memo = editTarget {
            navigationItem.title = "메모 수정"
            memoTextView.text = memo.contents
        } else {
            navigationItem.title = "새 메모"
            memoTextView.text = ""
        }

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

extension ComposeViewController {
    static let newMemoDidInsert = Notification.Name(rawValue: "newMemoDidInseret")
    static let memoDidChange = Notification.Name(rawValue: "memoDidChange")
}

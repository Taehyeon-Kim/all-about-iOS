//
//  WriteVC.swift
//  memoApp
//
//  Created by taehy.k on 2020/12/05.
//

import UIKit

protocol writeDataDelegate {
    func writeData(title: String, content: String)
}

class WriteVC: UIViewController {
    var delegate: writeDataDelegate?

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        // 게임 시작하면 튜토리얼하는 것처럼 안내를 나타내고 싶었음
        // 근데 글쓸때마다 매번 이렇게 하는 건 비효율적일듯..
//        let alert = UIAlertController(title: "안내", message: "제목과 내용을 입력하고 완료 버튼을 누르면 메모가 작성됩니다.", preferredStyle: UIAlertController.Style.alert)
//        let okAction = UIAlertAction(title: "OK", style: .default)
//        alert.addAction(okAction)
//        present(alert, animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        print("writeVC disapper")
        
        // 사라질 때 알림을 어떻게 띄우지..?
        // 이미 viewWillDisappear이 호출되었을때는 알림이 안띄어짐..
        
        // + back 할 때 데이터 저장 (실수로 뒤로 가는 경우 임시 저장)
        let titleData = titleTextField.text ?? ""
        let contentData = contentTextView.text ?? ""
        delegate?.writeData(title: titleData, content: contentData)
        
        // 키보드 활성화 해제
        contentTextView.resignFirstResponder()
    }

    @IBAction func writeButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

//
//  ViewController.swift
//  ScreenTransitionExample
//
//  Created by 김인영 on 2022/03/27.
//

import UIKit

class ViewController: UIViewController, SendDataDelegate {
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController 뷰가 로드되었다.")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController 뷰가 나타날 것이다.")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewController 뷰가 나타났다.")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ViewController 뷰가 사라질 것이다.")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ViewController 뷰가 사라졌다.")
    }
    
    
    
    @IBAction func CodePushViewController(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "codePushViewController") as? CodePushViewController else { return }
        viewController.name = "Inyoung"
        viewController.delegate = self
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func btnCodePresent(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePresentViewController") as? CodePresentViewController else {return}
        viewController.modalPresentationStyle = .fullScreen
        viewController.name = "Inyoung"
        self.present(viewController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segue를 실행하기 직전에 시스템에 의해 prepare 메소드가 자동으로 호출
        if let viewController = segue.destination as? SeguePushViewController {
            viewController.name = "Inyoung"
        }
    }
    
    func sendData(name: String) {
        self.nameLabel.text = name
    }
}


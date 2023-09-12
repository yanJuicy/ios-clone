//
//  LoginViewController.swift
//  CatStaGram
//
//  Created by lyanju on 2023/09/07.
//

import UIKit

class LoginViewController: UIViewController {
    
    var email = String()
    var password = String()
    
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttributes()
    }
    
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.email = text
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.password = text
    }
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        
    }
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        // 화면 전환
        // 1. 스토리보드 생성
        // 2. 뷰 컨트롤러 생성
        // 3. 화면전환 메소드를 이용해 화면 전환
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
//        self.present(registerViewController, animated: true)
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    private func setupAttributes() {
        
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor
        
        let attributes = generateButtonAttribute(self.registerButton, texts: text1, text2, fonts: font1, font2, colors: color1, color2)
        
        self.registerButton.setAttributedTitle(attributes, for: .normal)
    }
    
}

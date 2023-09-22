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
    var userInfo : UserInfo?
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttributes()
    }
    
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.email = text
        self.loginButton.backgroundColor = text.isValidEmail() ? .facebookColor : .disabledButtonColor
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.password = text
        self.loginButton.backgroundColor = text.count > 2 ? .facebookColor : .disabledButtonColor
    }
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        // 회원가입정보를 전달받아서, 그것과 textField 데이터가 일치하면 로그인이 되어야 한다.
        guard let userInfo = self.userInfo else { return }
        
        if userInfo.email == self.email && userInfo.password == self.password {
            let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        } else {
        }
        
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
        
        // ARC -> 강한참조 / 약한참조 -> ARC 낮춰줌
        registerViewController.userInfo = { [weak self] (userInfo: UserInfo) in
            self?.userInfo = userInfo
        }
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

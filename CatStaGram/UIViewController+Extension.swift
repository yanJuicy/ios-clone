//
//  UIViewController+Extension.swift
//  CatStaGram
//
//  Created by lyanju on 2023/09/12.
//

import UIKit

extension UIViewController {
    
    func generateButtonAttribute(_ button: UIButton, texts: String..., fonts: UIFont..., colors: UIColor...) -> NSMutableAttributedString {
        
        // UIButton에 입력된 text를 가져온다.
        guard let wholeText = button.titleLabel?.text else {
            fatalError("버튼에 텍스트가 없음.")
        }
        
        // 폰트들
        let customFonts: [UIFont] = fonts
        
        // 설정하고자 하는 String의 NRanges
        let customTextsRanges = texts.indices.map { index in
            (wholeText as NSString).range(of: texts[index])
        }
        
        // 설정하고자 하는 색상들
        let customColors = colors
    
        // attribute 객체 생성
        let attributeString = NSMutableAttributedString(string: wholeText)
        
        
        texts.indices.forEach { index in
            attributeString.addAttribute(.font, value: customFonts[index], range: customTextsRanges[index])
            attributeString.addAttribute(.foregroundColor, value: customColors[index], range: customTextsRanges[index])
        }
        
        return attributeString
    }
    
    
}

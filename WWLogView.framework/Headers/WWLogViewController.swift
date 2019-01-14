//
//  NewViewController.swift
//  UIWindow_Demo
//
//  Created by William-Weng on 2019/1/11.
//  Copyright © 2019年 William-Weng. All rights reserved.
//

import UIKit

class WWLogViewController: UIViewController {

    @IBOutlet var dragView: UIView!
    @IBOutlet weak var logTextView: UITextView!
    @IBOutlet weak var zoomView: UIImageView!
    @IBOutlet weak var clearView: UIImageView!
    @IBOutlet weak var testView: UIImageView!
    
    private let miniumSize = CGSize(width: 100, height: 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initGestureRecognizer()
    }
}

// MARK: - 公開的函數
extension WWLogViewController {
    
    /// 顯示Log (會自動往下移動)
    func showLog(_ log: String) {
        
        DispatchQueue.main.async {
            self.logTextView.text += "\(log)\n"
            self.updateTextViewScrollRange()
        }
    }
    
    /// UITextView自動向下移動
    private func updateTextViewScrollRange() {
        
        let count = logTextView.text.count
        
        if(count > 0) {
            let bottom = NSMakeRange(count - 1, 1)
            logTextView.scrollRangeToVisible(bottom)
        }
    }
}

// MARK: - @objc
extension WWLogViewController {
    
    /// 清除文字內容
    @objc private func handleClear(_ tap: UITapGestureRecognizer) {
        DispatchQueue.main.async { self.logTextView.text = "" }
    }
    
    /// 移動Window (歸零)
    @objc private func handleDrag(_ pan: UIPanGestureRecognizer) {
        
        let panLocation = pan.translation(in: pan.view)
        let nowWindow = view.window!
        let center = nowWindow.center
        
        nowWindow.center = CGPoint(x: center.x + panLocation.x, y: center.y + panLocation.y)
        pan.setTranslation(.zero, in: pan.view)
    }
    
    /// 放大Window (歸零)
    @objc private func handleZoom(_ pan: UIPanGestureRecognizer) {
        
        let panLocation = pan.translation(in: pan.view)
        let nowWindow = view.window!
        let frame = nowWindow.frame
        let newFrame = CGRect(origin: frame.origin, size: zoomSize(with: frame, panLocation: panLocation))
        
        nowWindow.frame = newFrame
        pan.setTranslation(.zero, in: pan.view)
    }
    
    /// 產生測試文字
    @objc private func handleTest(_ pan: UIPanGestureRecognizer) {
        showLog("https://github.com/William-Weng/")
    }
}

// MARK: - 小工具
extension WWLogViewController {
    
    private func initGestureRecognizer() {
        
        let dragPan = UIPanGestureRecognizer(target: self, action: #selector(handleDrag(_:)))
        let movePan = UIPanGestureRecognizer(target: self, action: #selector(handleZoom(_:)))
        let clearTap = UITapGestureRecognizer(target: self, action: #selector(handleClear(_:)))
        let testTap = UITapGestureRecognizer(target: self, action: #selector(handleTest(_:)))

        dragView.addGestureRecognizer(dragPan)
        zoomView.addGestureRecognizer(movePan)
        clearView.addGestureRecognizer(clearTap)
        testView.addGestureRecognizer(testTap)
    }
    
    /// 計算放大的Size
    private func zoomSize(with frame: CGRect, panLocation: CGPoint) -> CGSize {
        
        let nowSize = CGSize(width: frame.size.width + panLocation.x, height: frame.size.height + panLocation.y)
        return CGSize(width: max(nowSize.width, miniumSize.width), height: max(nowSize.height, miniumSize.height))
    }
}


//
//  MKPieProgressView.swift
//  MKPieProgressView
//
//  Created by Himal Madhushan on 10/25/18.
//  Copyright © 2018 Himal Madhushan. All rights reserved.
//

import UIKit

class MKPieProgressView: UIView {
    
    private let animation = CABasicAnimation(keyPath: "strokeEnd")
    
    /// Line width for shape path and progress path
    @IBInspectable var lineWidth: CGFloat = 15 {
        willSet(newValue) {
            shapeLayer.lineWidth    = newValue
            progressLayer.lineWidth = newValue
        }
    }
    
    
    /// Sets the stroke end value. Make sure to set the value in percentage. Ex: 55/100.0
    @IBInspectable var progress: CGFloat = 0 {
        willSet(newValue) {
            // Disabling implicit animations initialization from Core Animation
            CATransaction.setDisableActions(true)
            self.progressLayer.strokeEnd = CGFloat(newValue)
            CATransaction.setDisableActions(false)
        }
    }
    
    /// Shape path color (track color)
    @IBInspectable var pathColor: UIColor = UIColor.pathColor {
        willSet(newValue) {
            shapeLayer.strokeColor = newValue.cgColor
        }
    }
    
    /// Progress path color
    @IBInspectable var progressColor: UIColor = UIColor.progressColor {
        willSet(newValue) {
            progressLayer.strokeColor = newValue.cgColor
        }
    }
    
    /// Sets the line cap. Default is set to `round`
    var lineCap: CAShapeLayerLineCap = .round {
        willSet(newValue) {
            self.shapeLayer.lineCap = newValue
            self.progressLayer.lineCap = newValue
        }
    }
    
    /// Sets progress path animation duration. Default is set to 1
    var animationDuration: Double = 1 {
        willSet(newValue) {
            animation.duration = newValue
        }
    }
    
    private lazy var shapeLayer: CAShapeLayer = {
        var shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = nil
        shapeLayer.lineCap = self.lineCap
        shapeLayer.strokeColor = self.pathColor.cgColor
        return shapeLayer
    }()
    private lazy var progressLayer: CAShapeLayer = {
        var progressLayer = CAShapeLayer()
        progressLayer.lineCap = self.lineCap
        progressLayer.fillColor = nil
        progressLayer.strokeColor = self.progressColor.cgColor
        progressLayer.strokeEnd = 0.0
        return progressLayer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addShapes()
        shapeLayer.path = createCirclePath().cgPath
        progressLayer.path = self.createCirclePath().cgPath
    }
    
    private func addShapes() {
        shapeLayer.lineWidth    = lineWidth
        progressLayer.lineWidth = lineWidth
        self.layer.addSublayer(shapeLayer)
        self.layer.addSublayer(progressLayer)
        
        // Adding animation layer
        animation.fromValue = 0
        animation.duration = self.animationDuration
        progressLayer.add(animation, forKey: nil)
    }
    
    private func createCirclePath() -> UIBezierPath {
        let x = self.frame.width/2
        let y = self.frame.height/2
        let center = CGPoint(x: x, y: y)
        let path = UIBezierPath(arcCenter: center, radius: CGFloat(x)/1.1, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true)
        path.close()
        return path
    }
}

extension Int {
    var degreesToRadians : CGFloat {
        return CGFloat(self) * .pi / 180
    }
}

extension UIColor {
    fileprivate static let pathColor     = #colorLiteral(red: 0.9295833111, green: 0.9381603599, blue: 0.9596741796, alpha: 1)
    fileprivate static let progressColor = #colorLiteral(red: 1, green: 0.2652484775, blue: 0.3893374205, alpha: 1)
}

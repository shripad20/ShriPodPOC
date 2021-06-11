//
//  SteppedProgressBar.swift
//  SteppedProgressBar
//
//  Created by Shripad on 17/12/20.
//  Copyright © 2020 Shripad Chidrawar. All rights reserved.
//

import UIKit

public class SteppedProgressBar: UIView {
    
    var numberOfSteps: Int = 3
    let nibName = "SteppedProgressBar"
    var view: UIView!
    let StepSize = 30
    @IBOutlet weak var barView: UIView!
    var viewWidth: CGFloat! = 0
    
    public  var completedSteps: Int = 0 {
        didSet {
            updateStepCircles()
        }
    }
    
    public func xibSetup() {
        
        view.frame = bounds
        view.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleWidth.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue)
        addSubview(view)
        viewWidth = self.frame.size.width
        setUpSteppedCircle()
    }
    
    public func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        // set nibName to be xib file's name
        let nib = UINib(nibName: nibName, bundle: bundle)
        _ = nib.instantiate(withOwner: self, options: nil)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        view = loadViewFromNib()
        xibSetup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    public  func setUpSteppedCircle() {
        let height = (Int(self.frame.size.height) / 2) - (StepSize/2)
        let distance = (viewWidth - CGFloat(StepSize * 2)) / CGFloat((numberOfSteps-1)) //(viewWidth - CGFloat(StepSize)) / CGFloat((numberOfSteps-1))
        
        print("Distance: \(distance)")
        print("Width: \((viewWidth - CGFloat(StepSize)))")
        
        for i in 0...numberOfSteps - 1 {
            var isFilled = false
            if i < completedSteps {
                isFilled = true
            }
            let circleImage = addCircularView(isFilled: isFilled, index: i)
            let x = (CGFloat(i) * distance) + CGFloat(StepSize/2)
            print("X(\(i+1)): \(x)")
            circleImage.frame = CGRect(x: Int(x), y: height, width: StepSize, height: StepSize)
            print("Frame: \(circleImage.frame)")
            self.addSubview(circleImage)
        }
    }
    
    public func updateStepCircles() {
        removeStepCircles()
        setUpSteppedCircle()
    }
    
    public func removeStepCircles() {
        let arr = self.subviews
        for view in arr {
            if view.tag == 10 {
                view.removeFromSuperview()
            }
        }
    }
    
    public func addCircularView(isFilled: Bool, index: Int) -> UIView {
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: StepSize, height: StepSize))
        myView.layer.borderWidth = 4
        myView.layer.borderColor = UIColor.orange.cgColor
        myView.layer.cornerRadius = CGFloat(StepSize / 2)
        myView.tag = 10
        
        let label = UILabel(frame: myView.frame)
        label.backgroundColor = UIColor.orange
        label.layer.cornerRadius = label.frame.size.width/2
        label.text = "\(index+1)"
        label.backgroundColor = .clear
        label.textAlignment = .center
        myView.addSubview(label)
        
        if isFilled {
            myView.backgroundColor = UIColor.orange
            label.textColor = .white
        } else {
            myView.backgroundColor = .white
            label.textColor = .black
        }
        return myView
    }
}

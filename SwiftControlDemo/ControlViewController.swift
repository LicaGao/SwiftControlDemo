//
//  ControlViewController.swift
//  SwiftControlDemo
//
//  Created by 高鑫 on 2017/11/24.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class ControlViewController: UIViewController {
    let imgs = ["1","2","3","4","5"]
    var imgViewWidth : CGFloat!
    @IBOutlet weak var selectControl: UISegmentedControl!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var bgSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        imgViewWidth = imgView.frame.size.width
        selectControl.addTarget(self, action: #selector(selectAction(selectControl:)), for: .valueChanged)
        slider.addTarget(self, action: #selector(sliderAction(slider:)), for: .valueChanged)
        stepper.addTarget(self, action: #selector(stepperAction(stepper:)), for: .valueChanged)
        bgSwitch.addTarget(self, action: #selector(switchAction(bgSwitch:)), for: .valueChanged)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func selectAction(selectControl: UISegmentedControl) {
        let index = selectControl.selectedSegmentIndex
        self.imgView.image = UIImage(named: imgs[index])
    }
    
    @objc func sliderAction(slider: UISlider) {
        let value = slider.value
        self.stepper.value = Double(value)
        let center = self.imgView.center
        let w = UIScreen.main.bounds.width
        let precent = (w - self.imgViewWidth) / (1 - 0.5)
        let changeW = self.imgViewWidth + CGFloat(value - 0.5)*precent
        self.imgView.frame.size = CGSize(width: changeW, height: changeW)
        self.imgView.center = center
    }
    
    @objc func stepperAction(stepper: UIStepper) {
        let value = stepper.value
        self.slider.value = Float(value)
        let center = self.imgView.center
        let w = UIScreen.main.bounds.width
        let precent = (w - self.imgViewWidth) / (1 - 0.5)
        let changeW = self.imgViewWidth + CGFloat(value - 0.5)*precent
        self.imgView.frame.size = CGSize(width: changeW, height: changeW)
        self.imgView.center = center
    }
    
    @objc func switchAction(bgSwitch: UISwitch) {
        if bgSwitch.isOn == false {
            UIView.animate(withDuration: 0.2, animations: {
                self.view.backgroundColor = UIColor.white
            })
        } else {
            UIView.animate(withDuration: 0.2, animations: {
                self.view.backgroundColor = UIColor(named: "colorGray")
            })
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

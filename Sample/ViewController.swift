//
//  ViewController.swift
//  Sample
//
//  Created by 法師人大基 on 2019/01/07.
//  Copyright © 2019年 法師人大基. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer: Timer?
    var currentsec=0.0
    //var currentStr:String
    var formatter = DateFormatter()
    @IBOutlet weak var Timer_L: UILabel!
    @IBOutlet weak var StartB: UIButton!
    var flg=true
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        StartB.setTitle("Start", for: .normal)
         formatter.dateFormat="%.2f"
    }
    
    
    
    
    @IBAction func StartB_Tapped(_ sender: UIButton) {
        StartB.setTitle("Stop",for: .normal)
        
        if flg{
           flg=false
           start(second:5.00)
        }else{
            flg=true
        }
        
        
    }
    
    
    
    @objc func start(second: Double){
        currentsec=0.00
        Timer_L.text="\(currentsec)"
        
        
        timer=Timer.scheduledTimer(timeInterval:0.01,
            target:self,
            selector:  #selector(ViewController.update),
            userInfo:nil,
            repeats:true)
        
    }
    
    @objc func update(){
        
        currentsec+=0.01
        //currentStr=String(format:formatter.dateFormat,currentsec)
        Timer_L.text="\(String(format:formatter.dateFormat,currentsec))"
        
        if(currentsec>=3){
            Timer_L.text=""
        }
        
        
        if flg{
            
            Timer_L.text="result: \(String(format:formatter.dateFormat,currentsec))"
            
            timer?.invalidate()
            
            StartB.setTitle("Start",for: .normal)
        }
        
    }
    
    
    
   
    
}


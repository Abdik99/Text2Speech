//
//  ViewController.swift
//  text2speech
//
//  Created by Abdi on 3/21/20.
//  Copyright © 2020 Abdi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITextViewDelegate{
 
    @IBOutlet weak var field: UITextView!

    

    var speak = AVSpeechUtterance();
    var synthesizer = AVSpeechSynthesizer();
  
      
    
      override func viewDidLoad() {
        
    
         
            field.frame = CGRect(x: 45, y: 109, width: 325, height: 274)
            field.backgroundColor = .black
            field.textColor = .white
        
            field.becomeFirstResponder()



            view.addSubview(field)
        
            self.field.delegate = self
 

        
          
          
      
      }
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

   
    
    @IBAction func speech(_ sender: Any)
    {
        

            speak = AVSpeechUtterance(string:field.text! )

            speak.voice = AVSpeechSynthesisVoice(language: "en-GB")
            speak.rate = 0.5

            synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(speak)
            
            
        
    }
    
    @IBAction func clear(_ sender: Any) {
        field.text=""
        speech(field.text!)
        
        
        
    }
    
    @IBAction func stop(_ sender: Any) {
        synthesizer.pauseSpeaking(at:AVSpeechBoundary.immediate)
        
    }
    
    @IBAction func cont(_ sender: Any) {
        synthesizer.continueSpeaking()
    }


}


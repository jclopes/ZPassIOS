//
//  ViewController.swift
//  ZPassIOS
//
//  Created by João Lopes on 2015/10/03.
//  Copyright © 2015 João Lopes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var saltField: UITextField!
    @IBOutlet var secretField: UITextField!
    @IBOutlet var urlField: UITextField!
    @IBOutlet var passwordField: UITextField!

    let encodingModel = EncodingModel(salt: "salt", secret: "secret", url: "url.com")
    
    func refreshUI() {
        saltField.text = encodingModel.salt
        secretField.text = encodingModel.secret
        urlField.text = encodingModel.url
        passwordField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func genPassword(sender: AnyObject) {
        passwordField.text = encodingModel.password
    }
    
    @IBAction func valueChanged(sender: AnyObject) {
        encodingModel.salt = saltField.text!
        encodingModel.secret = secretField.text!
        encodingModel.url = urlField.text!
        refreshUI()
    }
    
    @IBAction func viewTapped(sender: AnyObject) {
        saltField.resignFirstResponder()
        secretField.resignFirstResponder()
        urlField.resignFirstResponder()
    }

}


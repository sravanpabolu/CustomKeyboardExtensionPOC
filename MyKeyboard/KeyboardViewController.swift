//
//  KeyboardViewController.swift
//  MyKeyboard
//
//  Created by Sravan on 31/05/17.
//  Copyright © 2017 Sravan. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

//    @IBOutlet var nextKeyboardButton: UIButton!
    
    var loginView: UIView!
    var menuView: UIView!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load the nib file
        let loginNib = UINib(nibName: "LoginView", bundle: nil)
        // instantiate the view
        loginView = loginNib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        // add the interface to the main view
        view.addSubview(loginView)
        
        // copy the background color
        view.backgroundColor = loginView.backgroundColor
        
        
        /*
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
 
    */
        
    }
    
    @IBAction func buttonGoTapped(button: UIButton) {
        (textDocumentProxy as UIKeyInput).insertText("\n")
        
        //Go to next screen
        
        //get menu view
        let menuNib = UINib(nibName: "MenuView", bundle: nil)
        menuView = menuNib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        //remove login view
        loginView.removeFromSuperview()
        
        //add menu view
        view.addSubview(menuView)
    }
    
    @IBAction func buttonBackSpaceTapped(button: UIButton) {
        (textDocumentProxy as UIKeyInput).deleteBackward()
    }
    
    @IBAction func buttonTapped(button: UIButton) {
//        let button = sender as UIButton
//        let title = button.titleForState(.Normal)
//        (textDocumentProxy as UIKeyInput).insertText(title!)
        let string = button.titleLabel!.text
        (textDocumentProxy as UIKeyInput).insertText("\(string!)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.

        
        
//        var textColor: UIColor
//        let proxy = self.textDocumentProxy
//        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
//            textColor = UIColor.white
//        } else {
//            textColor = UIColor.black
//        }
//        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

}

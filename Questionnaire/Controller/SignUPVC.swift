//
//  ViewController.swift
//  Apicalling2
//
//  Created by MAC OS 4 on 07/04/22.
//

import UIKit
class SignUPVC: UIViewController {
    @IBOutlet weak var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }

    @IBAction func btnClicked(_ sender: UIButton) {
        if let name = txtName.text {
            if name.isEmpty {
                openAlert(title: "Alert", message: "Your Text Field is Empty.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in print("Okay clicked")}])
            }
            else {
                print("Taped")
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: "QuestionVC") as! QuestionVC
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}



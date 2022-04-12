//
//  ThankYouVC.swift
//  Pods
//
//  Created by MAC OS 4 on 08/04/22.
//

import UIKit

class ThankYouVC: UIViewController {
    
    var completionHandler: ((String)->(Void))?
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    func handler(_ block: @escaping ((String) -> (Void))){
        self.completionHandler = block
    }
    
    @IBAction func btnRestart(_ sender: Any) {
        self.completionHandler?("Done")
        dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

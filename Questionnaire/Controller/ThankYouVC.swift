//
//  ThankYouVC.swift
//  Pods
//
//  Created by MAC OS 4 on 08/04/22.
//

import UIKit

class ThankYouVC: UIViewController {
    
    var PlayerName: String = ""
    var TotalScore: Int = 0
    //MARK: - Outlet
   
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var lblPlayer: UILabel!
    
    //MARK: - Variable
    var completionHandler: ((String)->(Void))? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblScore.text = String(self.TotalScore)
        lblPlayer.text = self.PlayerName

        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    @IBAction func btnNewGame(_ sender: Any) {
        dismiss(animated: true)
        self.completionHandler?("NewGame")
        print("Clicked")
//        dismiss(animated: true)
    }
    //MARK: - Custom Function
    func handler(_ block: @escaping ((String) -> (Void))){
        self.completionHandler = block
    }
    //MARK: - Action Method
    @IBAction func btnRestart(_ sender: Any) {
        self.completionHandler?("Done")
        print("Clicked")
        dismiss(animated: true)
        
        
    }
    

    
}

//
//  ThankYouVC.swift
//  Pods
//
//  Created by MAC OS 4 on 08/04/22.
//

import UIKit
import Lottie

class ThankYouVC: UIViewController {
    
    var PlayerName: String = ""
    var TotalScore: Int = 0
    
    private var animationView: AnimationView?
    //MARK: - Outlet
   
    @IBOutlet weak var cardView: UIView!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var lblPlayer: UILabel!
    
    //MARK: - Variable
    var completionHandler: ((String)->(Void))? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblPlayer.text = "\(self.PlayerName) \(String(self.TotalScore))"
        setShadow(view: cardView)
        
        
        // 2. Start AnimationView with animation name (without extension)
        
        animationView = .init(name: "party2")
        
        animationView!.frame = view.bounds
        
        // 3. Set animation content mode
        
        animationView!.contentMode = .scaleAspectFit
        
        // 4. Set animation loop mode
        
        animationView!.loopMode = .loop
        
        // 5. Adjust animation speed
        
//        animationView!.animationSpeed = 0.5
        
        cardView.addSubview(animationView!)
        
        // 6. Play animation
        
        animationView!.play()
        
        
        
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

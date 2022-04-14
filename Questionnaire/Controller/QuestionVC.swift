
import UIKit
import SRCountdownTimer
import Alamofire


class QuestionVC: UIViewController{
    
    // MARK: - Outlet
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var ScoreView: UILabel!
    @IBOutlet weak var QusetionCounter: UILabel!
    
    @IBOutlet weak var qvwContainer: UIView!
    
    @IBOutlet weak var viewTimer: SRCountdownTimer!
    @IBOutlet weak var NoBtn: UIButton!
    @IBOutlet weak var YesBtn: UIButton!
    
    //MARK: - Variable
    var PlayedPlayerName: String = ""
    var Questionnaire = [Questions]()
    var questionNumber: Int = 0
    var score: Int = 0
    var SelectedAnswer: Int = 0
    var secondsRemaining = 10
    var arrQuestionary:[Questions] = []
    let url = URL(string: "https://raw.githubusercontent.com/surajbhardwaj12/Question/main/Question.json")
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiCall()
        timmer()
        update()
        viewTimer.delegate = self
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        // shadow to Question View
        qvwContainer.layer.cornerRadius = 15.0
        qvwContainer.layer.masksToBounds = false
        qvwContainer.layer.shadowColor = UIColor.darkGray.cgColor
        qvwContainer.layer.shadowOffset = .zero
        qvwContainer.layer.shadowOpacity = 1.0
        qvwContainer.layer.shadowRadius = 10.0
        
     //   qvwContainer.layer.shadowPath = UIBezierPath(rect: qvwContainer.bounds).cgPath
        qvwContainer.layer.shouldRasterize = true
        qvwContainer.layer.rasterizationScale = UIScreen.main.scale
        
    }
    
    //MARK: - API Call
    func apiCall() {
        arrQuestionary = []
        score = 0
        questionNumber = 0
        
        AF.request(url!).responseJSON { [self] (response) in
            let result = response.data
            print(result)
            do {
                self.Questionnaire = try JSONDecoder().decode([Questions].self, from: result!)
                self.arrQuestionary = self.Questionnaire
                updateQuestion()
            }catch {
                print("error")
            }
        }
    }
    
    //MARK: - Action Method
    
    @IBAction func PressedAnswer(_ sender: UIButton) {
        if sender.tag == 0 {
            if arrQuestionary[questionNumber - 1].Answer == "Yes" {
                score += 1
            }
            
            // updateQuestion()
        }else {
            if arrQuestionary[questionNumber - 1].Answer == "No" {
                score += 1
            }
            
            //updateQuestion()
        }
        
        
        updateQuestion()
        
    }
    
    //MARK: - Custom Function
    func updateQuestion() {
        
        if questionNumber <= arrQuestionary.count - 1 {
            questionNumber += 1
            QuestionLabel.text =  arrQuestionary[questionNumber - 1].Question
            timmer()
        } else {
            
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ThankYouVC") as! ThankYouVC
            vc.handler { [weak self] doneStatus in
                guard let `self` = self else {return}
                if doneStatus == "Done"{
                    self.apiCall()
                }else{
                    
                    self.navigationController?.popToRootViewController(animated: true)
                    
                }
                
            }
            vc.modalPresentationStyle = .overFullScreen

            vc.TotalScore = self.score
            vc.PlayerName = self.PlayedPlayerName
            self.present(vc, animated: true, completion: nil)
        }
        update()
    }
    func update() {
        
        ScoreView.text = "Score:- \(score)"
        QusetionCounter.text = "\(questionNumber)/\(arrQuestionary.count)"
    }
    
    func timmer() {
        viewTimer.labelFont = UIFont(name: "Arial", size: 60)
        viewTimer.labelTextColor = UIColor.red
        viewTimer.timerFinishingText = "0"
        viewTimer.lineWidth = 10
        viewTimer.start(beginingValue: 10, interval: 1)
        
    }
    
}
//MARK: - Extention
extension QuestionVC: SRCountdownTimerDelegate {
    func timerDidEnd(sender: SRCountdownTimer, elapsedTime: TimeInterval) {
        updateQuestion()
    }
    
}






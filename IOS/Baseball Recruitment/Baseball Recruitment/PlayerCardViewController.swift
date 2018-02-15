//
//  PlayerCardViewController.swift
//  Baseball Recruitment
//
//  Created by Sergey Scott Nall  on 2/9/18.
//  Copyright © 2018 Team Bard. All rights reserved.
//

import UIKit

class PlayerCardViewController: UIViewController {
    //MARK: Properties
    var hrefPath : String?
    var playerCard = PlayerCard()
    
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hsGradLabel: UILabel!
    @IBOutlet weak var currentAgeLabel: UILabel!
    @IBOutlet weak var ageAtDraftLabel: UILabel!
    @IBOutlet weak var positionsLabel: UILabel!
    @IBOutlet weak var heightWeightLabel: UILabel!
    @IBOutlet weak var batThrowLabel: UILabel!
    @IBOutlet weak var highSchoolLabel: UILabel!
    @IBOutlet weak var homeTownLabel: UILabel!
    @IBOutlet weak var summerTeamLabel: UILabel!
    @IBOutlet weak var fallTeamLabel: UILabel!
    @IBOutlet weak var commitmentLabel: UILabel!
    
    //MARK: Override functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let href = hrefPath {
            playerCard.requestPlayerCard(hrefPath: href) {
                let imagePath = self.playerCard.imagePath
                if !imagePath.isEmpty {
                    self.playerCard.requestPlayerImage(url: imagePath) {
                        DispatchQueue.main.async {
                            self.playerImage.image = self.playerCard.image
                        }
                    }
                }
                
                self.nameLabel.text = "Name: \(self.playerCard.name)"
                self.hsGradLabel.text = "HS Grad: \(self.playerCard.hsGrad)"
                self.currentAgeLabel.text = "Current Age: \(self.playerCard.age)"
                self.ageAtDraftLabel.text = "Age at Draft: \(self.playerCard.ageAtDraft)"
                
                var positions = "Position(s): \(self.playerCard.position)"
                if !self.playerCard.positionOther.isEmpty {
                    positions += " \(self.playerCard.positionOther)"
                }
                
                self.positionsLabel.text = positions
                
                let height = self.playerCard.height
                let weight = self.playerCard.weight
                self.heightWeightLabel.text = "Height/Weight: \(height), \(weight)"
                
                self.batThrowLabel.text = "Bat/Throw: \(self.playerCard.battingAndThrowing)"
                self.highSchoolLabel.text = "High School: \(self.playerCard.highSchool)"
                self.homeTownLabel.text = "Home Town: \(self.playerCard.homeTown)"
                self.summerTeamLabel.text = "Summer Team: \(self.playerCard.summerTeam)"
                self.fallTeamLabel.text = "Fall Team: \(self.playerCard.fallTeam)"
                self.commitmentLabel.text = "Commitment: \(self.playerCard.commitment)"
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

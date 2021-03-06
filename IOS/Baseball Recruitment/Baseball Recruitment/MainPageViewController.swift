//
//  MainPageViewController.swift
//  Baseball Recruitment
//
//  Created by Sergey Scott Nall  on 1/28/18.
//  Copyright © 2018 Team Bard. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {

    var db = DatabaseUtility()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        do {
            guard db != nil else {
                print("Could not connect to database.")
                return
            }

            try db!.createPlayerTable()
        } catch  {
            print("Could not create player table.")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

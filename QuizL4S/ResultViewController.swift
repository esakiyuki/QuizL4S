//
//  ResultViewController.swift
//  QuizL4S
//
//  Created by esaki yuki on 2020/09/14.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var correctAnswer: Int = 0
    
    @IBOutlet var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = String(correctAnswer)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back() {
        //presentingViewController?って書いた回数分画面を戻る
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
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

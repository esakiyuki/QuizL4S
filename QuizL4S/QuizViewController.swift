//
//  QuizViewController.swift
//  QuizL4S
//
//  Created by esaki yuki on 2020/09/14.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quizArray = [Any]()
    
    //正解数を数える変数
    var correctAnswer: Int = 0
    
    @IBOutlet var quizTextView: UITextView!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizArray.append(["日本の総理大臣は誰でしょう", "安倍晋三", "阿部サダヲ", "阿部寛", 1])
        quizArray.append(["アメリカの大統領は誰でしょう", "クリントン", "ドナルド・トランプ", "ドナルド・ダック", 2])
        quizArray.append(["2020年の年号は？", "昭和", "平成", "令和", 3])
        
        quizArray.shuffle()
        
        choiceQuiz()

        // Do any additional setup after loading the view.
    }
    
    func choiceQuiz() {
        //一時的にクイズを取り出しておく配列
        let tmpArray = quizArray[0] as! [Any]
        //問題文を表示
        //なんでquizArrayじゃなくてtmpArrayにするの？
        quizTextView.text = tmpArray[0] as? String
        //それぞれの選択肢にそれぞれの選択肢をセット
        button1.setTitle(tmpArray[1] as? String, for: .normal)
        button2.setTitle(tmpArray[2] as? String, for: .normal)
        button3.setTitle(tmpArray[3] as? String, for: .normal)
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    @IBAction func choiseAnswer(sender: UIButton) {
        let tmpArray = quizArray[0] as! [Any]
        if tmpArray[4] as! Int == sender.tag {
            //correctAnswerは正解数を数える変数
            correctAnswer = correctAnswer + 1
        }
        //解いた問題をquizArrayから取り除く
        quizArray.remove(at: 0)
        //解いた問題数の合計が設定した問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            //ResultViewControllerで宣言されてるcorrectAnswerはQuizViewControllerのcorrectAnswerと一緒ってコード？
            resultViewController.correctAnswer = self.correctAnswer
        }
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

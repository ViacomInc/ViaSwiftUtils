//
//  FirstViewController.swift
//  ViaSwiftUtils Example
//
//  Created by Konrad Feiler on 24/06/16.
//
//

import UIKit
import ViaSwiftUtils

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let rect = CGRect(x: 0, y: 0, width: 10, height: 5)
        print("aspect ratio: \(rect.aspectRatio)")
        
        var mutableNumberList = [1,2,3,4,5,6]
        mutableNumberList.shuffleInPlace()
        print("shuffled numbers: \( mutableNumberList )")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


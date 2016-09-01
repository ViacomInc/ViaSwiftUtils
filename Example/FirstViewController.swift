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

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let rect = CGRect(x: 0, y: 0, width: 10, height: 5)
        print("aspect ratio: \(rect.aspectRatio)")
        
        var mutableNumberList = [1, 2, 3, 4, 5, 6]
        mutableNumberList.shuffleInPlace()
        print("shuffled numbers: \( mutableNumberList )")
        
        imageView.image = UIImage(named: "puppy")?.cornersRounded(usingRadius: 30)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

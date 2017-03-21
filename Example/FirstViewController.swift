//
//  FirstViewController.swift
//  ViaSwiftUtils Example
//
//  Copyright 2017 Viacom, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

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

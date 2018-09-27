//
//  ViewController.swift
//  PlayDies
//
//  Created by kaya on 27/9/18.
//  Copyright © 2018 kaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageDiceLeft: UIImageView!
    
    @IBOutlet weak var imageDiceRight: UIImageView!
    
    @IBOutlet weak var txtTotalDices: UILabel!
    
    private let listDices : [String]
    
    private var randomLeft : Int
    
    private var randomRight : Int
    
    private var nFaces : Int
    
    required init?(coder aDecoder: NSCoder) {
        self.listDices = ["dies1", "dies2", "dies3", "dies4", "dies5", "dies6"]
        self.randomRight = 0
        self.randomLeft = 0
        self.nFaces = listDices.count
    
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        generateRandomDices()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rollPressed(_ sender: Any) {
        generateRandomDices()
    }
    
    private func generateRandomDices(){
        self.randomLeft = Int(arc4random_uniform(UInt32(nFaces)))
        self.randomRight = Int(arc4random_uniform(UInt32(nFaces)))

        
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseInOut,
                       animations: {
                        
                        self.imageDiceLeft.transform = CGAffineTransform(translationX: 0.6, y: 0.6).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi / 2)).concatenating(CGAffineTransform(translationX: -20, y: 20))
                        
                        self.imageDiceRight.transform = CGAffineTransform(translationX: 0.6, y: 0.6).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi)).concatenating(CGAffineTransform(translationX: 20, y: 20))
                        
        }) { (_) in
            self.imageDiceLeft.image = UIImage(named: self.listDices[self.randomLeft])
            self.imageDiceRight.image = UIImage(named: self.listDices[self.randomRight])
            
            self.txtTotalDices.text = "Total: " + String(2 + self.randomRight + self.randomLeft)
        }
        
    }
    
}


























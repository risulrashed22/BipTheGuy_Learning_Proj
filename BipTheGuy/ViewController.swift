//
//  ViewController.swift
//  BipTheGuy
//  Created by Risul Rashed
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var moveButton: UIButton!
    @IBOutlet weak var alphaButton: UIButton!
    @IBOutlet weak var pulseButton: UIButton!
    @IBOutlet weak var colorCButton: UIButton!
    @IBOutlet weak var buttons: UIStackView!
    var countColor = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let deviceWidth = view.frame.width
        imageView.frame.origin.x = deviceWidth
        alphaButton.frame.origin.x = deviceWidth
        pulseButton.frame.origin.x = deviceWidth
        colorCButton.frame.origin.x = deviceWidth
    }
    
    //MARK: View which will load after screen appear
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    //MARK: This method is called after the view is shown to the user
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func movePressed(_ sender: UIButton) {
        moveToView()
    }
    
    @IBAction func alphaPressed(_ sender: UIButton) {
        alphaAnimation()
    }
    
    @IBAction func pulsePressed(_ sender: UIButton) {
        pulseAnimation()
        imageAnimation()
    }
    
    @IBAction func colorCPressed(_ sender: UIButton) {
        colorChangeANimation()
    }
    @IBAction func punchButton(_ sender: UIButton) {
    }
    @IBAction func doneButton(_ sender: UIButton) {
    }
    
    //MARK: Off screen to on screen
    func moveToView(){
        UIView.animate(withDuration: 1) {
            self.imageView.center.x = self.view.center.x
            self.alphaButton.center.x = self.view.center.x
            self.pulseButton.center.x = self.view.center.x
            self.colorCButton.center.x = self.view.center.x
        }

    }
    //MARK: Alpha Animation
    func alphaAnimation(){
        UIView.animate(withDuration: 1) {
            self.imageView.alpha = (self.imageView.alpha == 1 ? 0 : 1)
        }

    }
    //MARK: Color Change with animation
    func colorChangeANimation(){
        let color: [UIColor] = [.red, .orange, .blue, .purple, .yellow, .gray, .green]
        UIView.animate(withDuration: 0.25) {
            self.colorCButton.backgroundColor = color[self.countColor]
            self.countColor += 1
            if self.countColor == color.count{
                self.countColor = 0
            }
            
        }

    }
    //MARK: Pulse button
    func pulseAnimation(){
        // Holding button original size(frame)
        let original = pulseButton.frame
        let widthShrink: CGFloat = 30
        let heightSrink: CGFloat = 10
        let smallFrame = CGRect(x: pulseButton.frame.origin.x + widthShrink,
                                y: pulseButton.frame.origin.y + heightSrink,
                                width: pulseButton.frame.width - (2 * widthShrink),
                                height: pulseButton.frame.height - (2 * heightSrink))
        
        pulseButton.frame = smallFrame
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 20, options: []) {
            self.pulseButton.frame = original
        }

    }
    //MARK: Image View Animation
    func imageAnimation(){
        let original = imageView.frame
        let shrink: CGFloat = 20
        let imageShrink = CGRect(x: imageView.frame.origin.x + shrink,
                                 y: imageView.frame.origin.y + shrink,
                                 width: imageView.frame.width - (2 * shrink),
                                 height: imageView.frame.height - (2*shrink))
        imageView.frame = imageShrink
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: []) {
            self.imageView.frame = original
        }

    }

}


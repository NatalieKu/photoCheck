//
//  ViewController.swift
//  photoCheck
//
//  Created by MEI KU on 2017/8/18.
//  Copyright © 2017年 Natalie KU. All rights reserved.
//
import UIKit
import SafariServices
import MessageUI
import GameplayKit


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var character1: UILabel!
    
    
    @IBOutlet weak var character2: UILabel!
    
    @IBOutlet weak var character3: UILabel!
    
    
    @IBOutlet weak var character4: UILabel!
    
    @IBOutlet weak var character5: UILabel!
    
    @IBOutlet weak var character6: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    @IBOutlet weak var imageView: UIImageView!
    

  let number = GKRandomDistribution(lowestValue: 0, highestValue:2)
   
    
    
    @IBAction func checkFaceButton(_ sender: UIButton) {
        
        if number.nextInt() == 0 {
            character1.text = "單純 100%"
            character2.text = "放棄 0%"
            character3.text = "智慧 100%"
            character4.text = "勇氣 100%"
            character5.text = "怯弱 1%"
            character6.text = "善良 90%"
            descriptionLabel.text = """
            你是擁有純真和善良和氣，
            超群智慧讓你永不退卻！
            """
            
        }
            

else if number.nextInt() == 1 {
 
 character1.text = "豁達 40%"
 character2.text = "恐懼 1%"
 character3.text = "能幹 80%"
 character4.text = "脆弱 20%"
 character5.text = "勇敢 100%"
 character6.text = "純潔 50%"
 descriptionLabel.text = """
 您是位溫和又堅忍的人物，
 常付出自己只讓別人快樂！
 """
}
    
 else {
 character1.text = "天真 90%"
 character2.text = "冷漠 0%"
 character3.text = "冷靜 70%"
 character4.text = "溫和 100%"
 character5.text = "開朗 100%"
 character6.text = "自私 0%"
 descriptionLabel.text = """
 您是可愛迷人的偶像，
 走到哪裡都被粉絲包圍不孤單。
 """}
 
        updateUI()
    }
   
    @IBOutlet weak var photoButton: UIButton!
    
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var emailButton: UIButton!
    
    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var image1View: UIImageView!
  
    @IBOutlet weak var image2View: UIImageView!
    
    func updateUI() {
     
        checkButton.isHidden = true
        photoButton.isHidden = true
        emailButton.isHidden = false
        shareButton.isHidden = false
        image1View.image = UIImage(named:"3")
        image2View.image = UIImage(named:"2")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
           navigationItem.titleView = UIImageView(image: UIImage(named:"bar2" ))
        
        checkButton.isHidden = false
        photoButton.isHidden = false
        emailButton.isHidden = true
        shareButton.isHidden = true
        image1View.image = UIImage(named:"3")
        image2View.image = UIImage(named:"2")
        
    }
    
 
    @IBOutlet weak var safariButton: UIButton!
    
    @IBAction func shareButton(_ sender: UIButton) {
        guard let image = imageView.image else {return}
        let activityController = UIActivityViewController (activityItems:[image],applicationActivities:nil)
        activityController.popoverPresentationController?.sourceView = sender
        present(activityController, animated: true, completion: nil )
        
        
    }
    
    @IBAction func photoButton(_ sender: UIButton) {
        
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle:.actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel" , style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title:"Camera",style:.default, handler: { action in imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
                
            })
            alertController.addAction(cameraAction)
            
        }
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default , handler: { action in imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
                
            })
            
            alertController.addAction(photoLibraryAction)
        }
        alertController.popoverPresentationController?.sourceView = sender
        present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker:UIImagePickerController, didFinishPickingMediaWithInfo info: [String:Any]) {
        
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {imageView.image = selectedImage
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func safariButton(_ sender: Any) {
        
        
        if let url = URL(string:"https://qoolquiz.com/") {
            let safariViewController = SFSafariViewController(url:url)
            present(safariViewController, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func emailButton(_ sender: UIButton) {
        /* if !MFMailComposeViewController.canSendMail() {
         print("can not send mail")
         return
         }
         */
        guard MFMailComposeViewController.canSendMail() else {
            
            return
            
        }
        
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        mailComposer.setToRecipients(["exsample@exsample.com"])
        mailComposer.setSubject("Look at this")
        mailComposer.setMessageBody("Hello, this is an email from the app I made" , isHTML: false)
        present(mailComposer, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


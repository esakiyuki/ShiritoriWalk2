//
//  CameraViewController.swift
//  ShiritoriWalk
//
//  Created by esaki yuki on 2020/05/19.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var cameraImageView: UIImageView!
    
    @IBOutlet var mojiTextField: UITextField!
//    var mojiArray: [Waking<String, String>] = []
    var mojiArray: [Dictionary<String, String>] = []
    let saveData = UserDefaults.standard
    
    
//    @IBOutlet var mojilabel: UILabel!
    
    @IBAction func takePhoto() {
        
//        presentPickerController(sourceType: .camera)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            
            picker.allowsEditing = true
            
            present(picker, animated: true, completion: nil)
        } else {
            print("error")
        }
        
    }
    
    @IBAction func saveMoji() {
        let mojiWaking = ["moji": mojiTextField.text!]
        mojiArray.append(mojiWaking)
        saveData.set(mojiArray, forKey: "MOJI")
        
        let alert = UIAlertController(
            title: "入力完了", message: "文字の入力が完了しました", preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title: "OK", style: .default, handler: nil
        ))
        present(alert, animated: true, completion: nil)
        mojiTextField.text = ""
    }
    
//    @IBAction func input() {
//
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var mojiArray: [Dictionary<String, String>] = []
        if saveData.array(forKey: "MOJI") != nil {
            mojiArray = saveData.array(forKey: "MOJI") as! [Dictionary<String, String>]
        }

        // Do any additional setup after loading the view.
    }
    
    func presentPickerController(_ picker: UIImagePickerController, didFinishPikingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
//            let picker = UIImagePickerController()
//            picker.sourceType = sourceType
//            picker.delegate = self
//            self.present(picker, animated: true, completion: nil)
//        }
        cameraImageView.image = info[.editedImage] as? UIImage
        dismiss(animated: true, completion: nil)
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

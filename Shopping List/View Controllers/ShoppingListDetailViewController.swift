//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by Steven Leyva on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListDetailViewController: UIViewController {
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func sendOrderTapped(_ sender: UIButton) {
            showAlert()
        }
        func showAlert() {
            let alert = UIAlertController(title: "'Shopping List' Would Like to Send You Notifications", message: "Notifications may include alerts, sounds, and icon badges. These can be configured in Settings.", preferredStyle: .alert)
        
        let dontAllow = UIAlertAction(title: "Don't Allow", style: .cancel, handler: nil)
        let allow = UIAlertAction(title: "Allow", style: .default, handler: nil)
        
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

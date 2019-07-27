//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by Steven Leyva on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListDetailViewController: UIViewController {
    
    var shoppingListController: ShoppingListController?
    var shoppingItem: ShoppingItem?
    
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    @IBAction func sendOrderTapped(_ sender: UIButton) {
            showAlert()
        }
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        
        title = shoppingItem.item
        nameTextField.text = shoppingItem.item
    
    }
    
    func showAlert() {
            let alert = UIAlertController(title: "'Shopping List' Would Like to Send You Notifications", message: "Notifications may include alerts, sounds, and icon badges. These can be configured in Settings.", preferredStyle: .alert)
        
        let dontAllow = UIAlertAction(title: "Don't Allow", style: .cancel, handler: nil)
        let allow = UIAlertAction(title: "Allow", style: .default, handler: nil)
            
            alert.addAction(dontAllow)
            alert.addAction(allow)
        present(alert, animated: true, completion: nil)
        
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

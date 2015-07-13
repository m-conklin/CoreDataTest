//
//  ViewController.swift
//  CoreDataTest
//
//  Created by Martin Conklin on 2015-07-13.
//  Copyright (c) 2015 Martin Conklin. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var managedObjectContext: NSManagedObjectContext?
    var error: NSError?

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var orderNumber: UITextField!

    
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    @IBAction func createOrder(sender: UIButton) {
        let newOrder = NSEntityDescription.insertNewObjectForEntityForName("Order", inManagedObjectContext: managedObjectContext!) as! Order
        newOrder.firstName = firstName.text
        newOrder.lastName = lastName.text
        newOrder.orderNumber = orderNumber.text
        if !managedObjectContext!.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
        
        println("New Order")
        
    }
    
    @IBAction func printOrders(sender: UIButton) {
        let fetchRequest = NSFetchRequest(entityName: "Order")
        
        if let context = managedObjectContext {
            let orderResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: &error) as? [Order]
            for eachOrder in orderResults! {
                println("\(eachOrder)")
            }
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


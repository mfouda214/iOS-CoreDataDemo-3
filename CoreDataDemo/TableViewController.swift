//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Hesham Abd-Elmegid on 10/12/17.
//  Copyright © 2017 CareerFoundry. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    let firstNames = ["Jane", "John", "Stephen", "Stacy", "Taylor", "Alex", "Eren"]
    let lastNames = ["White", "Black", "Fox", "Jones", "King", "McQueen", "Yeager"]
    let ages = [25, 26, 20, 30, 27, 28, 23]
    var people = [Person]()

    @IBAction func addButtonWasTapped(_ sender: UIBarButtonItem) {
        let randomFirstName = firstNames[Int(arc4random_uniform(UInt32(firstNames.count)))]
        let randomLastName = lastNames[Int(arc4random_uniform(UInt32(lastNames.count)))]
        let randomAge = ages[Int(arc4random_uniform(UInt32(ages.count)))]
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: context)
        
        let person = Person(entity: entity!, insertInto: context)
        person.firstName = randomFirstName
        person.lastName = randomLastName
        person.age = Int32(randomAge)
        appDelegate.saveContext()
    }

}

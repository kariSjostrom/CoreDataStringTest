//
//  ViewController.swift
//  CoreDataStringTest
//
//  Created by Karissa the Squid on 10/20/15.
//  Copyright © 2015 Rock Valley College. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let managedObjectContext =
    (UIApplication.sharedApplication().delegate as! AppDelegate) .managedObjectContext
    var moviedb:NSManagedObject!
    
    @IBAction func btnBack(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    
    @IBOutlet weak var film: UITextField!
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var company: UITextField!
    @IBOutlet weak var producer: UITextField!
    @IBOutlet weak var actorone: UITextField!
    @IBOutlet weak var actortwo: UITextField!
    
    @IBOutlet weak var status: UILabel!
    @IBAction func btnSave(sender: AnyObject) {
        if (moviedb != nil)
        {
            moviedb.setValue(film.text, forKey: "Movie Name")
            moviedb.setValue(year.text, forKey: "Year")
            moviedb.setValue(company.text, forKey: "Production Company")
            moviedb.setValue(producer.text, forKey: "Producer")
            moviedb.setValue(actorone.text, forKey: "Leading Actor")
            moviedb.setValue(actortwo.text, forKey: "Supporting Actor")
        }
        else
        {
            let entityDescription =
            NSEntityDescription.entityForName ("Movie", inManagedObjectContext: managedObjectContext)
            
            let movies = Movies(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext)
            movies.film = film.text!
            movies.year = year.text!
            movies.company = company.text!
            movies.producer = producer.text!
            movies.actorone = actorone.text!
            movies.actortwo = actortwo.text!
            
        }
        var error: NSError?
        do {
            try managedObjectContext.save()
        } catch let error1 as NSError {
            error = error1
        }
        if let err = error {
            status.text = err.localizedFailureReason
        } else {
            self.dismissViewControllerAnimated(false, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if (moviedb != nil)
        {
            film.text = moviedb.valueForKey("Movie Name") as? String
            year.text = moviedb.valueForKey("Year") as? String
            company.text = moviedb.valueForKey("Production Company") as? String
            producer.text = moviedb.valueForKey("Producer") as? String
            actorone.text = moviedb.valueForKey("Leading Actor") as? String
            actortwo.text = moviedb.valueForKey("Supporting Actor") as? String
            btnSave.setTitle("Update", forState: UIControlState.Normal)
        }
        film.becomeFirstResponder()
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first as UITouch! {
            DismissKeyboard()
        }
        super.touchesBegan(touches, withEvent:event)
    }
    func DismissKeyboard(){
        film.endEditing(true)
        year.endEditing(true)
        company.endEditing(true)
        producer.endEditing(true)
        actorone.endEditing(true)
        actortwo.endEditing(true)
    }
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
}


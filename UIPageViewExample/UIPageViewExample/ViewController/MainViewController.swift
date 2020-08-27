//
//  MainViewController.swift
//  UIPageViewExample
//
//  Created by helIgate on 8/27/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    weak var pageViewController : PageViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButton(_ sender: Any) {
        print(#function)
        pageViewController?.nextPage()
    }
    
    @IBAction func previousButton(_ sender: Any) {
        print(#function.components(separatedBy: "(").first ?? "")
        pageViewController?.previousPage()
    }
    @IBAction func skipButton(_ sender: Any) {
        pageViewController?.skipPage()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedPage" {
            pageViewController = segue.destination as? PageViewController
        }
    }
}

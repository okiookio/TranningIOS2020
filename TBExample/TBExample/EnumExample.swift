//
//  EnumExample.swift
//  TBExample
//
//  Created by helIgate on 8/20/20.
//  Copyright © 2020 helIgate. All rights reserved.
//

import Foundation

//SynTax


enum name1 {
    case value
    case value1
}
 

// Iterating over cases (Lặp lại)


 
 enum name2 : Int, CaseIterable {
     case one = 1, two=9, three
 }
 
 

// Giá trị mặc định



enum name3 : String {
    case one = "1"
    case string = "String"
}
 


// Giá trị ngầm định


 
 enum name4 : Int {
    case one = 1, two, three, four
    
    
    
    
 }
 
 
 enum name5 : String {
    case one, two, three
 }
 
 


// Khởi tạo từ giá trị mặc định


 
 enum name6 : Int {
    case one = 1, two, three, four
 }
 print("\(name6(rawValue : 3))"). // three
 




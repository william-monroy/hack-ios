//
//  BreedFilter.swift
//  hack-ios
//
//  Created by Brenda Saucedo on 20/07/23.
//

import SwiftUI

enum BreedFilter: String {
    
    static var allFilters: [BreedFilter] {
        return [ .All, .Labrador, .Shitzu, .Puddle]
    }
    
    case All = "All"
    case Labrador = "Labrador"
    case Shitzu = "Shitzu"
    case Puddle = "Puddle"
    
}

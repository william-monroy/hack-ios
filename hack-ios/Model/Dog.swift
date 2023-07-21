//
//  Dog.swift
//  hack-ios
//
//  Created by Brenda Saucedo on 20/07/23.
//

import SwiftUI

struct Dog: Identifiable {
    let id = UUID()
    let image: String
    let breed: String
    let color: [String]
    let size: String
    let location: String
    let picked: Bool
    let date: Date
    let description: String
}

extension Dog {
    static var dogs : [Dog] = [
        Dog(image: "Dachshund", breed: "Dachshund", color: ["Brown"], size: "Small", location: "Near Oakwood Park", picked: false, date: Date(), description: "Has a distinctive red coat with black markings along her back and tail. Her endearing short legs and long body make her stand out from other dogs."),
        Dog(image: "Shitzu", breed: "Shitzu", color: ["White", "Gray"], size: "Small", location: "Beach", picked: true, date: Date(), description: "Small, fluffy dog with a luxurious coat that's a mix of gray and white colors, beautifully complemented by their expressive dark eyes."),
        Dog(image: "Pug", breed: "Pug", color: ["Black", "White", "Brown"], size: "Small", location: "City", picked: false, date: Date(), description: "This Pug is a small, sturdy dog with a distinct wrinkled face, short muzzle, and charming round eyes. Their coat is smooth and can vary in color, often seen in fawn, black, or silver."),
    ]
}

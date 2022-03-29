//
//  DogsResponse.swift
//  Dogs
//
//  Created by Jesus Loaiza Herrera on 25/03/22.
//

import Foundation
import RealmSwift

@objcMembers
class Dogs: Object, Codable {
  
  dynamic var dogName : String = ""
  dynamic var dogDescription : String = ""
  dynamic var age : Int = 0
  dynamic var image : String = ""
  
  enum CodingKeys: String, CodingKey {
    case dogName
    case dogDescription = "description"
    case age
    case image
  }
  
  convenience init(dogName: String = "", dogDescription: String  = "", age: Int  = 0, image: String  = "") {
    self.init()
    self.dogName = dogName
    self.dogDescription = dogDescription
    self.age = age
    self.image = image

  }
  
  convenience required init(from decoder: Decoder) throws {
    self.init()
    let values = try decoder.container(keyedBy: CodingKeys.self)
    dogName = try values.decodeIfPresent(String.self, forKey: .dogName) ?? ""
    dogDescription = try values.decodeIfPresent(String.self, forKey: .dogDescription) ?? ""
    age = try values.decodeIfPresent(Int.self, forKey: .age) ?? 0
    image = try values.decodeIfPresent(String.self, forKey: .image) ?? ""
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(dogName, forKey: .dogName)
    try container.encodeIfPresent(dogDescription, forKey: .dogDescription)
    try container.encodeIfPresent(age, forKey: .age)
    try container.encodeIfPresent(image, forKey: .image)
  }
  
}

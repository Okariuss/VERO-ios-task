// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation
import UIKit

struct TaskModel: Codable {
    let description: String
    let colorCode: String
    let preplanningBoardQuickSelect: JSONNull?
    let parentTaskID: ParentTaskID
    let wageType: String
    let title: String
    let businessUnit: BusinessUnit
    let workingTime: JSONNull?
    let businessUnitKey: BusinessUnit?
    let sort: String
    let task: String
    let isAvailableInTimeTrackingKioskMode: Bool

    enum CodingKeys: String, CodingKey {
        case description, colorCode, preplanningBoardQuickSelect, parentTaskID, wageType, title, businessUnit, workingTime, sort, task, isAvailableInTimeTrackingKioskMode
        case businessUnitKey = "BusinessUnitKey"
    }
    
    var backgroundColor: UIColor? {
        return UIColor(hexString: colorCode)
    }
}

enum BusinessUnit: String, Codable {
    case empty = ""
    case gerüstbau = "Gerüstbau"
}

enum ParentTaskID: String, Codable {
    case empty = ""
    case the10Aufbau = "10 Aufbau"
    case the60Transportbühnen = "60 Transportbühnen"
}

typealias Task = [TaskModel]

class JSONNull: Codable, Hashable {
    static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    func hash(into hasher: inout Hasher) {
    }

    init() {}

    required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}


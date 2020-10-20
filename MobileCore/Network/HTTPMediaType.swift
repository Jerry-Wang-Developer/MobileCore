//
//  Copyright © 2020 JerryWang. All rights reserved.
//

import Foundation

public struct HTTPMediaType {
    enum Errors: Error {
        case componentContainsInvalidCharacter(String)
        case fullTypeHasIncorrectComponentCount(String)
    }

    public let fullType: String

    public init(type: String, subType: String) throws {
        try validateMediaTypeComponent(type)
        try validateMediaTypeComponent(subType)
        fullType = "\(type)/\(subType)"
    }

    public init(fullType: String) throws {
        let components = fullType.components(separatedBy: "/")
        guard components.count == 2 else {
            throw Errors.fullTypeHasIncorrectComponentCount(fullType)
        }

        try validateMediaTypeComponent(components[0])
        try validateMediaTypeComponent(components[1])
        self.fullType = fullType
    }

    private func validateMediaTypeComponent(_ component: String) throws {
        let disallowedCharactersForTypeComponent = CharacterSet.whitespaces.union(CharacterSet(charactersIn: ";"))
        guard component.rangeOfCharacter(from: disallowedCharactersForTypeComponent) == nil else {
            throw HTTPMediaType.Errors.componentContainsInvalidCharacter(component)
        }
    }
}

extension HTTPMediaType: Equatable {
    public static func == (lhs: HTTPMediaType, rhs: HTTPMediaType) -> Bool {
        lhs.fullType.compare(rhs.fullType, options: .caseInsensitive) == .orderedSame
    }
}

public typealias MediaType = HTTPMediaType

public extension MediaType {
    static let urlEncoded = try! MediaType(type: "application", subType: "x-www-form-urlencoded")
    static let plain = try! MediaType(type: "text", subType: "plain")
    static let json = try! MediaType(type: "application", subType: "json")
}

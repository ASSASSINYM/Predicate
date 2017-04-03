//
//  PredicateTests.swift
//  PredicateTests
//
//  Created by Alsey Coleman Miller on 4/2/17.
//  Copyright © 2017 PureSwift. All rights reserved.
//

import XCTest
@testable import Predicate

final class PredicateTests: XCTestCase {
    
    func testPredicate1() {
        
        class Foo: NSObject {
            var id: Int
            var name: String
            init(id: Int, name: String) {
                self.id = id
                self.name = name
                super.init()
            }
        }
        
        let predicate: Predicate = #keyPath(Foo.id) > Int64(0)
            && #keyPath(Foo.id) != Int64(99)
            && (#keyPath(Foo.name)).compare(.contains, [.diacriticInsensitive, .caseInsensitive], .value(.string("Cole")))
            && (#keyPath(Foo.name)).compare(.contains, [.caseInsensitive, .diacriticInsensitive, .localeSensitive, .normalized], .value(.string("Cole")))
            && (#keyPath(Foo.name)).compare(.like, .value(.string("Cole")))
        
        let converted = predicate.toFoundation()
        
        print(predicate)
        print(converted)
        
        XCTAssert(predicate.description == converted.description)
    }
}

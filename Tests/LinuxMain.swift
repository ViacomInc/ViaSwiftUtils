import XCTest
@testable import ViaSwiftUtilsTests

XCTMain([
    testCase(ViaSwiftUtilsTests.allTests),
    testCase(BetterForceUnwrappingTests.allTests),
    testCase(CGPointOperatorsTest.allTests),
    testCase(CollectionShuffledTest.allTests),
    testCase(CGRectTests.allTests),
])

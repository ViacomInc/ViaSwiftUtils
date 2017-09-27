import XCTest
@testable import ViaSwiftUtilsTests

XCTMain([
    testCase(ViaSwiftUtilsTests.allTests),
    testCase(BetterForceUnwrappingTests.allTests),
    testCase(CGPointOperatorsTest.allTests),
    testCase(CollectionShuffledTest.allTests),
    testCase(CGRectTests.allTests),
    testCase(SequenceTypeHelperTests.allTests),
    testCase(DictionaryMapValuesTests.allTests),
    testCase(DateComparableTest.allTests),
    testCase(RandomAccessCollectionSafeAccessTests.allTests),
    testCase(DateComponentAccessorsTest.allTests),
    testCase(DateTimesBetweenTests.allTests),
    testCase(StringWordsTest.allTests)
])

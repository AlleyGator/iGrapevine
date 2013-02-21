//
//  LinkedListTest.m
//  iGrapeVine
//
//  Created by William Cox on 11/4/12.
//  Copyright (c) 2012 William Cox. All rights reserved.
//

#import "LinkedListTest.h"
#import "LinkedList.h"

@interface LinkedListTest () {
    LinkedList *testList;
    NSArray *testObjects;
}

@end

@implementation LinkedListTest

- (void)setUp {
    testList = [[LinkedList alloc] init];
    testObjects = @[@"first", @"second", @"third"];
    
    for (id object in testObjects) {
        [testList append:object];
    }
}

- (void)testCount {
    
    STAssertTrue([testList count] == testObjects.count, @"Expected <n>");
    
    [testList insert:@"fourth"];
    STAssertTrue([testList count] == testObjects.count + 1, @"Expected N+1");
    
    STAssertTrue([[LinkedList new] count] == 0, @"Test 0");
}

- (void)testMoveTo {
    
    for (id object in testObjects) {
        [testList moveTo:object];
        STAssertEqualObjects(testList.cursor.object, object, @"");
        STAssertEqualObjects(testList.cursor.object, [testList item], @"Testing the item method...");
    }
}

- (void)testMoveToPlace {
    for (int i = 0; i < testObjects.count; i++) {
        [testList moveToPlace:i];
        STAssertEqualObjects(testList.cursor.object, testObjects[i], @"");
        STAssertEqualObjects(testList.cursor.object, [testList item], @"Testing the item method...");
    }
}

- (void)testPrepend {
    [testList first];
    STAssertEqualObjects(testList.item, @"first", @"pre-test");
    NSString *expected = @"prepend";
    [testList prepend:expected];
    STAssertEqualObjects(testList.firstNode.object, expected, @"");
}

- (void)testInsertSorted {
    LinkedList *sortedList = LinkedList.new;
    int numTests = 25;
    for (int i = 0; i <= numTests; i++) {
        NSString *testString = [NSString stringWithFormat:@"%d",rand() %numTests];
        [sortedList insertSorted:testString];
    }
    
    [sortedList first];
    NSString *previousString = [sortedList item];
    while ([sortedList item]) {
        STAssertTrue([previousString compare:[sortedList item] options:NSCaseInsensitiveSearch] != NSOrderedDescending, @"previous: %@ current: %@", previousString, [sortedList item]);
        previousString = [sortedList item];
        [sortedList moveNext];
    }
}

- (void)testSyncSortWithSentinelReverseListAListB {
    // FUTURE
}

- (void)testRemove {
    [testList moveToPlace:0];
    LinkedListNode *removed = [testList remove];
    STAssertEqualObjects([removed name], @"first", @"");
    STAssertTrue([testList count] == 2, @"");
}

- (void)testIsEmpty {
    [testList first];
    while ([testList cursor]) {
        STAssertFalse([testList isEmpty], @"");
       [testList remove];
    }
    STAssertTrue([testList isEmpty], @"");
}

- (void)testClear {
    STAssertFalse([testList isEmpty], @"");
    [testList clear];
    STAssertTrue([testList isEmpty], @"");
}

- (void)testOutputToFile {
    // FUTURE
}

- (void)testInputFromFileForVersion {
    // FUTURE
}

- (void)testOutputToBinary {
    // FUTURE
}

- (void)testOldInputFromFileVersion {
    // NEVER
}

- (void)testSwapBackward {
    [testList moveToPlace:1];
    LinkedListNode *secondObject = testList.cursor;
    [testList swapBackward];
    STAssertEqualObjects(testList.lastNode, secondObject, @"");
    
    [testList first];
    LinkedListNode *firstObject = [testList firstNode];
    [testList swapBackward];
    STAssertEqualObjects(testList.firstNode.nextNode,
                         firstObject,
                         @"");
}

@end

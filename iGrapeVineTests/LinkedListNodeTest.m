//
//  LinkedListNodeTest.m
//  iGrapeVine
//
//  Created by William Cox on 11/4/12.
//  Copyright (c) 2012 William Cox. All rights reserved.
//

#import "LinkedListNodeTest.h"
#import "LinkedListNode.h"
@interface TestObject : NSObject
@property (nonatomic, strong) NSString *name;
@end

@implementation TestObject
@end

@implementation LinkedListNodeTest

- (void)testNameOfObject {
    LinkedListNode *node1 = LinkedListNode.new;
    node1.object = @"Test";
    
    LinkedListNode *node2 = LinkedListNode.new;
    TestObject *test = TestObject.new;
    test.name = @"Test";
    node2.object = test;
    
    STAssertEqualObjects([node1 name], [node2 name], @"");
}

- (void)testCompare {
    LinkedListNode *node1 = LinkedListNode.new;
    node1.object = @"Test";
    
    LinkedListNode *node2 = LinkedListNode.new;
    TestObject *test = TestObject.new;
    test.name = @"test";
    node2.object = test;
    
    STAssertFalse([node1 compare:node2], @"");
}

@end

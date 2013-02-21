//
//  LinkedMenuListNodeTest.m
//  iGrapeVine
//
//  Created by William Cox on 11/11/12.
//  Copyright (c) 2012 William Cox. All rights reserved.
//

#import "LinkedMenuListNodeTest.h"
#import "LinkedMenuListNode.h"

@implementation LinkedMenuListNodeTest

- (void)testIsInclusionFalse {
    LinkedMenuListNode *node = LinkedMenuListNode.new;
    node.name = @"test";
    node.cost = @"1";
    
    STAssertFalse(node.isInclusion, @"cost should indicate not an inclusion");
}

- (void)testIsInclusionTrue {
    LinkedMenuListNode *node = LinkedMenuListNode.new;
    node.name = @"test";
    node.cost = @"+";
    
    STAssertTrue(node.isInclusion, @"cost should indicate an inclusion");
}
@end

//
//  LinkedListNode.h
//  iGrapeVine
//
//  Created by William Cox on 10/30/12.
//  Copyright (c) 2012 William Cox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LinkedListNode : NSObject
@property (nonatomic, strong) id object;
@property (nonatomic, strong) LinkedListNode *nextNode;
@property (nonatomic, weak) LinkedListNode *prevNode;

@end

@interface LinkedListNode (NonGrapevine)
- (id)name;
- (NSComparisonResult)compare:(id)nodeOrObject;
+ (id)nameOfObject:(id)object;
@end
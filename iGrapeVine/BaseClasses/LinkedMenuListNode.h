//
//  LinkedMenuListNode.h
//  iGrapeVine
//
//  Created by William Cox on 11/4/12.
//  Copyright (c) 2012 William Cox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkedListNode.h"

@interface LinkedMenuListNode : LinkedListNode
@property (nonatomic, strong, getter = object, setter = setObject:) NSString *name;
@property (nonatomic, strong) NSString *cost;
@property (nonatomic, strong) NSString *note;

@property (nonatomic, strong) LinkedMenuListNode *nextNode;
@property (nonatomic, weak) LinkedMenuListNode *prevNode;
@end

@interface LinkedMenuListNode (NonGrapevine)
- (BOOL)isInclusion;
@end
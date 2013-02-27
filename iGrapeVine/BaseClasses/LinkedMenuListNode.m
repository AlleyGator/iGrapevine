//
//  LinkedMenuListNode.m
//  iGrapeVine
//
//  Created by William Cox on 11/4/12.
//  Copyright (c) 2012 William Cox. All rights reserved.
//

#import "LinkedMenuListNode.h"

@implementation LinkedMenuListNode
//Public Name As String                   'the name of the menu choice
//Public Cost As String                   'the cost of the choice, or ":" if it is a link
//Public Note As String                   'the note associated with the choice, or the
//'  linked menu if it is a link
//
//Public NextNode As LinkedMenuListNode   'the next node
//Public PrevNode As LinkedMenuListNode   'the previous node

@end

@implementation LinkedMenuListNode (NonGrapevine)

- (BOOL)isInclusion {
    return [self.cost isEqualToString:@"+"];
}
- (BOOL)isLink {
    return [self.cost isEqualToString:@":"];
}

@end
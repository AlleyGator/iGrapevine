//
//  LinkedListNode.m
//  iGrapeVine
//
//  Created by William Cox on 10/30/12.
//  Copyright (c) 2012 William Cox. All rights reserved.
//

#import "LinkedListNode.h"

@implementation LinkedListNode
@end;

@implementation LinkedListNode (NonGrapevine)

- (NSComparisonResult)compare:(id)nodeOrObject {
    if ([nodeOrObject isKindOfClass:self.class]) {
        NSString *selfName = [self name];
        NSString *objectName = [(LinkedListNode *)nodeOrObject name];

        return [selfName compare:objectName options:NSCaseInsensitiveSearch];
    }
    else {
        NSString *selfName = [self name];
        NSString *objectName = [LinkedListNode nameOfObject:nodeOrObject];
        
        return [selfName compare:objectName options:NSCaseInsensitiveSearch];
    }
}

- (id)name {
    return [LinkedListNode nameOfObject:self.object];
}

+ (id)nameOfObject:(id)object {
    NSString *name = nil;
    if ([object respondsToSelector:@selector(name)])
        name = [object performSelector:@selector(name)];
    
    // I don't actually know it's a string, but I intend to call compare: on it anyway
    else
        name = object;
    return name;
}
@end

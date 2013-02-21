//
//  LinkedMenuList.h
//  iGrapeVine
//
//  Created by William Cox on 11/4/12.
//  Copyright (c) 2012 William Cox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkedList.h"

@class LinkedMenuListNode;

@interface LinkedMenuList : LinkedList
//Public Name As String                       'Name of this menu
//Public Negative As Boolean                  'Whether costs are negative; default false
@property (nonatomic) BOOL negative;
//Public Autonote As Boolean                  'Whether to automatically add notes; default false
@property (nonatomic) BOOL autonote;
//Public Required As Boolean                  'Whether this menu is required by Grapevine
@property (nonatomic) BOOL required;
//Public Display As ListDisplayType           'How to Display items
@property (nonatomic) ListDisplayType display;
//Public Category As RaceType                 'Race with which these menus are associated
@property (nonatomic) RaceType category;

- (LinkedMenuListNode *)remove;

- (void)inputFromBinary:(int)fileNum version:(float)version;
@end

@interface LinkedMenuList (NonGrapevine)
- (void)alphabetize;
- (void)appendNode:(LinkedListNode *)newNode;
@end

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

//Public Sub Insert(ItemName As String, ItemCost As String, ItemNote As String)
- (void)insertWithName:(NSString *)itemName cost:(NSString *)itemCost note:(NSString *)note;
//Public Function GetItemPlace(ByRef ItemName As String) As Long
- (int)getItemPlace:(NSString *)itemName;
- (NSString *)displayItem;
//Public Sub Merge(MergeMenu As LinkedMenuList, Aggressive As Boolean, ByRef AllChanges As String)
- (void)mergeWithMenu:(LinkedMenuList *)otherMenu overwriteDuplicates:(BOOL)overwriteDuplicates outputChanges:(NSString **)allChanges;

//Public Function ItemName() As String
- (NSString *)itemName;

//Public Function ItemCost() As String
- (NSString *)itemCost;

//Public Function ItemNote() As String
- (NSString *)itemNote;

//Public Sub Append(ItemName As String, ItemCost As String, ItemNote As String)
- (void)appendWithName:(NSString *)itemName cost:(NSString *)itemCost note:(NSString *)itemNote;
- (LinkedMenuListNode *)remove;

- (void)inputFromBinary:(int)fileNum version:(float)version;

@end

@interface LinkedMenuList (NonGrapevine)
- (void)alphabetize;
- (void)appendNode:(LinkedListNode *)newNode;
@end

//
//  LinkedList.h
//  iGrapeVine
//
//  Created by William Cox on 10/30/12.
//  Copyright (c) 2012 William Cox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkedListNode.h"

@interface LinkedList : NSObject
@property (nonatomic) Class nodeClass;

//Private Cursor As LinkedListNode    'Current location in the list
//Private FirstNode As LinkedListNode 'First node of the list
//Private LastNode As LinkedListNode  'Last node of the list
//Private NodeCount As Integer        'number of nodes in the list
//Private MemCursor As LinkedListNode 'cursor "remembered" by this list
@property (nonatomic, strong) LinkedListNode *cursor;
@property (nonatomic, strong) LinkedListNode *firstNode;
@property (nonatomic, strong) LinkedListNode *lastNode;
@property (nonatomic, strong) LinkedListNode *memCursor;
@property (nonatomic) NSUInteger nodeCount;

//Public Name As String               'Name of this list
//

@property (nonatomic, strong) NSString *name;

//Public Function Count() As Integer
//'
//' Name:         Count
//' Description:  Returns the number of items in the list
//' Returns:      the number of items in the list
//'
- (NSUInteger)count;

//Public Sub MoveTo(ByVal NameValue As Variant)
//'
//' Name:         MoveTo
//' Parameters:   NameValue   the name or string value of the item
//' Description:  Move the cursor to the item whose name or value
//'               matches the parameter.  Move off if no such item
//'               is found.
- (void)moveTo:(id)stringOrData;

//Public Sub MoveToPlace(ByVal Place As Integer)
//'
//' Name:         MoveToPlace
//' Parameters:   Place           the position in the list to move to
//' Description:  Move the cursor to the given number position in the list.
//'               Like listbox listindexes, this is 0-based.
//'
- (void)moveToPlace:(NSInteger)place;

//Public Sub Prepend(Data As Variant)
//'
//' Name:         Prepend
//' Parameters:   Data    the data to prepend
//' Description:  Add data to the front of the list.
//'
- (void)prepend:(id)data;

//Public Function Item() As Variant
//'
//' Name:         Item
//' Description:  Return the item at the current cursor position
//' Returns:      the item at the current cursor position
//'
- (id)item;

//Public Sub InsertSorted(Data As Variant)
//'
//' Name:         InsertSorted
//' Parameters:   Data    the item to insert
//' Description:  Insert an item into the list alphabetically, comparing it
//'               by its value if it is a string, by its name if it is an
//'               object.
//'
- (void)insertSorted:(id)stringOrObject;

//Public Sub SyncSort(NullVal As String, Reverse As Boolean, ListA As LinkedList, ListB As LinkedList)
//'
//' Name:         AlphaSync
//' Parameters:   NullVal     String that always goes last
//'               Reverse     If false, sort ascending; if true, sort descending.
//'               ListA       List whose order to sync with this one
//'               ListB       List whose order to sync with this one
//' Description:  Sort this list alphabetically.  Coordinate the order of the other two lists with it.
//'
- (void)syncSortWithSentinel:(NSString *)nullValue reverse:(BOOL)reverse listA:(LinkedList *)listA listB:(LinkedList *)listB;

//Public Sub Insert(Data As Variant)
//'
//' Name:         Insert
//' Parameters:   Data    the item to insert
//' Description:  Insert an item into the list at the current cursor position
//'
- (void)insert:(id)object;

//Public Sub Append(Data As Variant)
//'
//' Name:         Append
//' Parameters:   Data    the item to add to the list
//' Description:  Add an item to the end of the list.
//'
- (void)append:(id)object;

//Public Sub Remove()
//'
//' Name:         Remove
//' Description:  Remove the item at the current cursor position.
//'
- (LinkedListNode *)remove;

//Public Function IsEmpty() As Boolean
//'
//' Name:         IsEmpty
//' Description:  Tells whether the list is empty or not.
//' Returns:      TRUE if the list is empty, FALSE otherwise.
//'
- (BOOL)isEmpty;

//Public Function Off() As Boolean
//'
//' Name:         Off
//' Description:  Tells whether the cursor has moved off the list.
//' Returns:      TRUE if the cursor is off the list, FALSE otherwise.
//'
- (BOOL)off;

//Public Sub MoveNext()
//'
//' Name:         MoveNext
//' Description:  Move the cursor to the next item.
- (void)moveNext;

//Public Sub MovePrevious()
//'
//' Name:         MovePrevious
//' Description:  Move the cursor to the previous item.
//'
- (void)movePrevious;

//Public Sub First()
//'
//' Name:         First
//' Description:  Move the cursor to the first item.
//'
- (void)first;

//Public Sub Last()
//'
//' Name:         Last
//' Description:  Move the cursor to the last item.
//'
- (void)last;

//Public Sub Clear()
//'
//' Name:         Clear
//' Description:  Empty the list of all items.
//'
- (void)clear;

//Public Sub OutputToFile(XML As XMLWriterClass)
//'
//' Name:         OutputToFile
//' Parameters:   XML     the XMLWriterClass
//' Description:  Write the contents of this list to a file.  This method
//'               doesn't work if the list contains objects.
//'
- (void)outputToFile:(id)xmlWriter;

//Public Sub InputFromFile(XML As XMLReaderClass, Version As Double)
//'
//' Name:         InputFromFile
//' Parameters:   XML         XMLReaderClass that has read the list tag
//'               Version     version tag of the file format
//' Description:  Read a list from a file.  Only works for lists that
//'               don't contain objects.
//'
- (void)inputFromFile:(id)xmlReader version:(float)version;

//Public Sub OutputToBinary(FileNum As Integer)
//'
//' Name:         OutputToBinary
//' Parameters:   FileNum     the number of the open file to write to
//' Description:  Write this data to a binary file.
//'
- (void)outputToBinary:(int)fileNum;

//Public Sub InputFromBinary(FileNum As Integer, Version As Double)
//'
//' Name:         InputFromBinary
//' Parameters:   FileNum     the number of the open file to read from
//'               Version     the version of the file format
//' Description:  Read this data from a binary file.
//'
- (void)inputFromBinary:(int)fileNum version:(float)version;

//Public Sub OldInputFromFile(FileNum As Integer, Version As String)
//'
//' Name:         InputFromFile
//' Parameters:   FileNum     file from which to read
//'               Version     version tag of the file format
//' Description:  Read a list from a file.  Only works for lists that
//'               don't contain objects.
//'
- (void)oldInputFromFile:(int)fileNum version:(NSString *)version;

//Public Sub SwapBackward()
//'
//' Name:         SwapBackward
//' Description:  Swap the current item toward the end.
//'               Go Off when the cursor is the last node.
//'
- (void)swapBackward;

//Public Sub Memorize()
//'
//' Name:         Memorize
//' Description:  Store the current location of the cursor, to be reset later by Remember().
//'
- (void)memorize;

//Public Sub Remember()
//'
//' Name:         Remember
//' Description:  Reset the cursor location as stored by Memorize().
//'
- (void)remember;

//Private Sub Class_Initialize()
//'
//' Name:         Class_Initialize
//' Description:  Initialize an empty list.  VB calls this method
//'               automatically.
//'
- (void)class_initialize;

//Private Sub Class_Terminate()
//'
//' Name:         Class_Terminate
//' Description:  If a list is destroyed, clear it first.  VB calls
//'               this method automatically.
//'
- (void)class_terminate;

@end

@interface LinkedList (NonGrapevine)
- (LinkedListNode *)newNodeInstance;
- (void)insertNodeSorted:(LinkedListNode *)newNode;
- (void)prependNode:(LinkedListNode *)node;
- (void)swapFrontward;
- (void)insertNode:(LinkedListNode *)newNode;
- (void)appendNode:(LinkedListNode *)newNode;
- (BOOL)integrityCheck;
- initWithArrayOfNodes:(NSArray *)nodes sorted:(BOOL)sorted;
- (NSArray *)allNodes;
@end

//
//  LinkedList.m
//  iGrapeVine
//
//  Created by William Cox on 10/30/12.
//  Copyright (c) 2012 William Cox. All rights reserved.
//

#import "LinkedList.h"

@interface LinkedList ()

@end

@implementation LinkedList

- (id)init {
    self = [super init];
    if (self) {
        [self class_initialize];
    }
    
    return self;
}

//Public Function Count() As Integer
//'
//' Name:         Count
//' Description:  Returns the number of items in the list
//' Returns:      the number of items in the list
//'
//
//Count = NodeCount
//
//End Function
- (NSUInteger)count {
    return self.nodeCount;
}

//Public Sub MoveTo(ByVal NameValue As Variant)
//'
//' Name:         MoveTo
//' Parameters:   NameValue   the name or string value of the item
//' Description:  Move the cursor to the item whose name or value
//'               matches the parameter.  Move off if no such item
//'               is found.
//'
//
//Dim Found As Boolean
//
//Found = False
//Me.First
//
//If VarType(NameValue) = vbString Then NameValue = LCase(NameValue)
//
//If Not Cursor Is Nothing Then
//
//Do
//
//Select Case VarType(Cursor.Data)
//Case vbString
//Found = (LCase(Cursor.Data) = NameValue)
//Case vbObject
//Found = (LCase(Cursor.Data.Name) = NameValue)
//Case Else
//Found = (Cursor.Data = NameValue)
//End Select
//If Not Found Then Me.MoveNext
//
//Loop Until (Cursor Is Nothing) Or Found
//
//End If
//
//End Sub

- (void)moveTo:(id)stringOrData {

    [self first];
    if ([stringOrData isKindOfClass:[NSString class]])
        stringOrData = [stringOrData lowercaseString];
    
    // Just about setting the cursor
    
    while (self.cursor) {
        if ([self.cursor.object isKindOfClass:[NSString class]] &&
            [[self.cursor.object lowercaseString] isEqual:stringOrData])
                return;
        
        else if ([self.cursor.object respondsToSelector:@selector(name)] &&
                 [[self.cursor.object name] isEqual:stringOrData])
            return;
        
        else if ([self.cursor.object isKindOfClass:stringOrData] &&
            [self.cursor.object isEqual:stringOrData]) {
            return;
        }
        [self moveNext];
    }
}

//Public Sub MoveToPlace(ByVal Place As Integer)
//'
//' Name:         MoveToPlace
//' Parameters:   Place           the position in the list to move to
//' Description:  Move the cursor to the given number position in the list.
//'               Like listbox listindexes, this is 0-based.
//'
//
//Set Cursor = FirstNode
//Do Until (Place <= 0 Or Cursor Is Nothing)
//Set Cursor = Cursor.NextNode
//Place = Place - 1
//Loop
//
//End Sub

- (void)moveToPlace:(NSInteger)place {
    [self first];
    while (place > 0 &&
           [self item]) {
        place --;
        [self moveNext];
    }
}

//Public Sub Prepend(Data As Variant)
//'
//' Name:         Prepend
//' Parameters:   Data    the data to prepend
//' Description:  Add data to the front of the list.
//'
//
//Dim NewNode As LinkedListNode
//
//Set NewNode = New LinkedListNode
//If IsObject(Data) Then
//Set NewNode.Data = Data
//Else
//NewNode.Data = Data
//End If
//Set NewNode.PrevNode = Nothing
//
//If FirstNode Is Nothing Then
//Set LastNode = NewNode
//Else
//Set NewNode.NextNode = FirstNode
//Set FirstNode.PrevNode = NewNode
//End If
//
//Set FirstNode = NewNode
//NodeCount = NodeCount + 1
//
//End Sub

- (void)prepend:(id)data {
    LinkedListNode *newNode = [self newNodeInstance];
    newNode.object = data;
    newNode.prevNode = nil;

    newNode.nextNode = self.firstNode;
    
    if (!self.firstNode) {
        self.lastNode = newNode;
    }
    else {
//        newNode.nextNode = self.firstNode;
        self.firstNode.prevNode = newNode;
    }
    
    self.firstNode = newNode;
    self.nodeCount++;
}

//Public Function Item() As Variant
//'
//' Name:         Item
//' Description:  Return the item at the current cursor position
//' Returns:      the item at the current cursor position
//'
//
//If Not Cursor Is Nothing Then
//If IsObject(Cursor.Data) Then
//Set Item = Cursor.Data
//Else
//Item = Cursor.Data
//End If
//Else
//Set Item = Nothing
//End If
//
//End Function

- (id)item {
    return self.cursor.object;
}

//Public Sub InsertSorted(Data As Variant)
//'
//' Name:         InsertSorted
//' Parameters:   Data    the item to insert
//' Description:  Insert an item into the list alphabetically, comparing it
//'               by its value if it is a string, by its name if it is an
//'               object.
//'
//
//Dim StoreCursor As LinkedListNode
//Dim IsLess As Boolean
//Dim VType As Integer
//Dim CompData As String
//
//Set StoreCursor = Cursor
//VType = VarType(Data)
//
//Set Cursor = LastNode
//
//If VType = vbString Then
//CompData = LCase(Data)
//ElseIf VType = vbObject Then
//CompData = LCase(Data.Name)
//End If
//
//If Not Cursor Is Nothing Then
//Do
//Select Case VType
//Case vbObject
//IsLess = CompData < LCase(Cursor.Data.Name)
//Case vbString
//IsLess = CompData < LCase(Cursor.Data)
//Case Else
//IsLess = Data < Cursor.Data
//End Select
//If IsLess Then
//Set Cursor = Cursor.PrevNode
//Else
//If Cursor Is LastNode Then
//Append Data
//Else
//Set Cursor = Cursor.NextNode
//Insert Data
//End If
//Exit Do
//End If
//Loop Until Cursor Is Nothing
//End If
//
//If Cursor Is Nothing Then Prepend Data
//
//Set Cursor = StoreCursor
//
//End Sub

- (void)insertSorted:(id)stringOrObject {
    LinkedListNode *newNode = [self newNodeInstance];
    newNode.object = stringOrObject;
    [self insertNodeSorted:newNode];
}

//Public Sub SyncSort(NullVal As String, Reverse As Boolean, ListA As LinkedList, ListB As LinkedList)
//'
//' Name:         AlphaSync
//' Parameters:   NullVal     String that always goes last
//'               Reverse     If false, sort ascending; if true, sort descending.
//'               ListA       List whose order to sync with this one
//'               ListB       List whose order to sync with this one
//' Description:  Sort this list alphabetically.  Coordinate the order of the other two lists with it.
//'
//
//Dim VType As Integer
//Dim x As Integer
//Dim Y As Integer
//Dim Cursor1 As LinkedListNode
//Dim Cursor2 As LinkedListNode
//Dim IsMore As Boolean
//Dim Swap As Variant
//
//If Not IsEmpty Then
//
//VType = VarType(FirstNode.Data)
//
//For x = NodeCount - 1 To 1 Step -1
//ListA.First
//ListB.First
//Set Cursor1 = FirstNode
//Set Cursor2 = Cursor1.NextNode
//For Y = 1 To x
//Select Case VType
//Case vbObject
//IsMore = (LCase(Cursor2.Data.Name) < _
//          LCase(Cursor1.Data.Name)) Xor Reverse
//Case vbString
//IsMore = (LCase(Cursor2.Data) < LCase(Cursor1.Data)) Xor Reverse
//If (Cursor1.Data = NullVal) Then IsMore = True
//If (Cursor2.Data = NullVal) Then IsMore = False
//Case Else
//IsMore = (Cursor2.Data < Cursor1.Data) Xor Reverse
//If (Cursor1.Data = NullVal) Then IsMore = True
//If (Cursor2.Data = NullVal) Then IsMore = False
//End Select
//If IsMore Then
//ListA.SwapBackward
//ListB.SwapBackward
//Swap = Cursor1.Data
//Cursor1.Data = Cursor2.Data
//Cursor2.Data = Swap
//Else
//ListA.MoveNext
//ListB.MoveNext
//End If
//Set Cursor1 = Cursor2
//Set Cursor2 = Cursor1.NextNode
//Next Y
//Next x
//
//End If
//
//End Sub
- (void)syncSortWithSentinel:(NSString *)nullValue reverse:(BOOL)reverse listA:(LinkedList *)listA listB:(LinkedList *)listB {
    // TODO, if I can figure out what it does
    NSLog(@"%@ Unimplemented", NSStringFromSelector(_cmd));
    assert(FALSE);
}

//Public Sub Insert(Data As Variant)
//'
//' Name:         Insert
//' Parameters:   Data    the item to insert
//' Description:  Insert an item into the list at the current cursor position
//'
//
//Dim NewNode As LinkedListNode
//
//If Not Off() Then
//
//Set NewNode = New LinkedListNode
//
//If IsObject(Data) Then
//Set NewNode.Data = Data
//Else
//NewNode.Data = Data
//End If
//
//Set NewNode.NextNode = Cursor
//Set NewNode.PrevNode = Cursor.PrevNode
//
//If Cursor Is FirstNode Then
//Set FirstNode = NewNode
//Else
//Set Cursor.PrevNode.NextNode = NewNode
//End If
//
//Set Cursor.PrevNode = NewNode
//
//NodeCount = NodeCount + 1
//
//Else
//
//Append Data
//
//End If
//
//End Sub
- (void)insert:(id)object {
    if (![self off]) {
        LinkedListNode *newNode = nil;
        newNode = [LinkedListNode new];
        newNode.object = object;
        [self insertNode:newNode];
    }
    else
        [self append:object];
}

//Public Sub Append(Data As Variant)
//'
//' Name:         Append
//' Parameters:   Data    the item to add to the list
//' Description:  Add an item to the end of the list.
//'
//
//Dim NewNode As LinkedListNode
//
//Set NewNode = New LinkedListNode
//
//If IsObject(Data) Then
//Set NewNode.Data = Data
//Else
//NewNode.Data = Data
//End If
//
//Set NewNode.NextNode = Nothing
//
//If LastNode Is Nothing Then
//Set FirstNode = NewNode
//Else
//Set LastNode.NextNode = NewNode
//Set NewNode.PrevNode = LastNode
//End If
//
//Set LastNode = NewNode
//NodeCount = NodeCount + 1
//
//End Sub
- (void)append:(id)object {
    LinkedListNode *newNode = [LinkedListNode new];
    newNode.object = object;

    [self appendNode:newNode];
}

//Public Sub Remove()
//'
//' Name:         Remove
//' Description:  Remove the item at the current cursor position.
//'
//
//Dim NextCursor As LinkedListNode
//
//If Not Cursor Is Nothing Then
//
//If Cursor Is FirstNode Then
//Set FirstNode = Cursor.NextNode
//Else
//Set Cursor.PrevNode.NextNode = Cursor.NextNode
//End If
//
//If Cursor Is LastNode Then
//Set LastNode = Cursor.PrevNode
//Else
//Set Cursor.NextNode.PrevNode = Cursor.PrevNode
//End If
//
//Set NextCursor = Cursor.NextNode
//If IsObject(Cursor.Data) Then
//Set Cursor.Data = Nothing
//End If
//Set Cursor = Nothing
//Set Cursor = NextCursor
//
//NodeCount = NodeCount - 1
//
//End If
//
//End Sub
- (LinkedListNode *)remove {
    LinkedListNode *removed = nil;
    
    if (self.cursor) {
        removed = self.cursor;
        if (removed == self.firstNode) {
            self.firstNode = removed.nextNode;
        }
        else {
            removed.prevNode.nextNode = removed.nextNode;
        }
        
        if (removed == self.lastNode) {
            self.lastNode = removed.prevNode;
        }
        else {
            removed.nextNode.prevNode = removed.prevNode;
        }
        
        self.cursor = removed.nextNode;
        self.nodeCount--;
        removed.nextNode = nil;
        removed.prevNode = nil;
        
        [self integrityCheck];
    }
    return removed;
}

//Public Function IsEmpty() As Boolean
//'
//' Name:         IsEmpty
//' Description:  Tells whether the list is empty or not.
//' Returns:      TRUE if the list is empty, FALSE otherwise.
//'
//
//IsEmpty = (NodeCount = 0)
//
//End Function
- (BOOL)isEmpty {
    return (self.nodeCount == 0);
}

//Public Function Off() As Boolean
//'
//' Name:         Off
//' Description:  Tells whether the cursor has moved off the list.
//' Returns:      TRUE if the cursor is off the list, FALSE otherwise.
//'
//
//Off = (Cursor Is Nothing)
//
//End Function
- (BOOL)off {
    return !(self.cursor);
}

//Public Sub MoveNext()
//'
//' Name:         MoveNext
//' Description:  Move the cursor to the next item.
//'
//
//If Not Cursor Is Nothing Then Set Cursor = Cursor.NextNode
//
//End Sub
- (void)moveNext {
    self.cursor = self.cursor.nextNode;
}

//Public Sub MovePrevious()
//'
//' Name:         MovePrevious
//' Description:  Move the cursor to the previous item.
//'
//
//If Not Cursor Is Nothing Then Set Cursor = Cursor.PrevNode
//
//End Sub
- (void)movePrevious {
    self.cursor = self.cursor.prevNode;
}

//Public Sub First()
//'
//' Name:         First
//' Description:  Move the cursor to the first item.
//'
//
//Set Cursor = FirstNode
//
//End Sub
- (void)first {
    self.cursor = self.firstNode;
}

//Public Sub Last()
//'
//' Name:         Last
//' Description:  Move the cursor to the last item.
//'
//
//Set Cursor = LastNode
//
//End Sub
- (void)last {
    self.cursor = self.lastNode;
}

//Public Sub Clear()
//'
//' Name:         Clear
//' Description:  Empty the list of all items.
//'
//
//First
//Do Until Cursor Is Nothing
//Remove
//Loop
//
//End Sub
- (void)clear {
    [self first];
    while (self.cursor) {
        [self remove];
    }
}

//Public Sub OutputToFile(XML As XMLWriterClass)
//'
//' Name:         OutputToFile
//' Parameters:   XML     the XMLWriterClass
//' Description:  Write the contents of this list to a file.  This method
//'               doesn't work if the list contains objects.
//'
//
//Dim CurNode As LinkedListNode
//
//Set CurNode = Cursor
//
//With XML
//
//.BeginTag "list"
//.WriteAttribute "name", Name
//First
//Do Until Off
//.BeginTag "item"
//.WriteAttribute "data", Item
//.EndTag
//MoveNext
//Loop
//.EndTag
//
//End With
//
//Set Cursor = CurNode
//
//End Sub
- (void)outputToFile:(id)xmlWriter {
    // TODO!
}

//Public Sub InputFromFile(XML As XMLReaderClass, Version As Double)
//'
//' Name:         InputFromFile
//' Parameters:   XML         XMLReaderClass that has read the list tag
//'               Version     version tag of the file format
//' Description:  Read a list from a file.  Only works for lists that
//'               don't contain objects.
//'
//
//Dim Read As String
//
//With XML
//
//If .Tag = "list" Then
//
//Clear
//Name = .GetString("name")
//
//Do Until .Tag = "list" And .Terminal
//.ReadTag
//If .Tag = "item" Then
//Append .GetString("data")
//End If
//Loop
//
//Else
//Err.Raise vbObjectError + 8, "LinkedList", _
//"Wrong file input to linked list"
//End If
//
//End With
//
//End Sub
- (void)inputFromFile:(id)xmlReader version:(float)version {
    
}

//Public Sub OutputToBinary(FileNum As Integer)
//'
//' Name:         OutputToBinary
//' Parameters:   FileNum     the number of the open file to write to
//' Description:  Write this data to a binary file.
//'
//
//Dim CurNode As LinkedListNode
//
//Set CurNode = Cursor
//
//PutStrB FileNum, Name
//Put #FileNum, , CInt(Count)
//First
//Do Until Off
//Put #FileNum, , Item
//MoveNext
//Loop
//
//Set Cursor = CurNode
//
//End Sub
- (void)outputToBinary:(int)fileNum {
    // Hope I never implement this
}

//Public Sub InputFromBinary(FileNum As Integer, Version As Double)
//'
//' Name:         InputFromBinary
//' Parameters:   FileNum     the number of the open file to read from
//'               Version     the version of the file format
//' Description:  Read this data from a binary file.
//'
//
//Dim I As Integer
//Dim D As Variant
//
//Clear
//GetStrB FileNum, Name
//Get #FileNum, , I
//Do Until I = 0
//Get #FileNum, , D
//Append D
//I = I - 1
//Loop
//
//End Sub
- (void)inputFromBinary:(int)fileNum version:(float)version {
//    [self clear];
//    NSString *name;
//    [Root getStrB:fileNum stringValue:&name];
//    _name = name;
//    int i;
//    i = [Root getIntB:fileNum];
//    while (i) {
//        LinkedListNode *node;
//        
//        i = [Root getIntB:fileNum];
//    }
    
}

//Public Sub OldInputFromFile(FileNum As Integer, Version As String)
//'
//' Name:         InputFromFile
//' Parameters:   FileNum     file from which to read
//'               Version     version tag of the file format
//' Description:  Read a list from a file.  Only works for lists that
//'               don't contain objects.
//'
//
//Dim Read As String
//
//Clear
//Line Input #FileNum, Name
//Line Input #FileNum, Read
//Do Until Read = "<-End of LinkedList Items->"
//Append Read
//Line Input #FileNum, Read
//Loop
//
//End Sub
- (void)oldInputFromFile:(int)fileNum version:(NSString *)version {
    // Never!
}

//Public Sub SwapBackward()
//'
//' Name:         SwapBackward
//' Description:  Swap the current item toward the end.
//'               Go Off when the cursor is the last node.
//'
//
//Dim SwapItem As Variant
//
//If Not (Cursor Is Nothing) Then
//If Cursor Is LastNode Then
//Set Cursor = Nothing
//Else
//If IsObject(Cursor.Data) Then
//Set SwapItem = Cursor.Data
//Set Cursor.Data = Cursor.NextNode.Data
//Set Cursor.NextNode.Data = SwapItem
//Else
//SwapItem = Cursor.Data
//Cursor.Data = Cursor.NextNode.Data
//Cursor.NextNode.Data = SwapItem
//End If
//Set Cursor = Cursor.NextNode
//End If
//End If
//
//End Sub
- (void)swapBackward {
    LinkedListNode *swapItem = [self remove];
    self.cursor = self.cursor.nextNode;
    [self insertNode:swapItem];
}


//Public Sub Memorize()
//'
//' Name:         Memorize
//' Description:  Store the current location of the cursor, to be reset later by Remember().
//'
//
//Set MemCursor = Cursor
//
//End Sub
- (void)memorize {
    self.memCursor = self.cursor;
}


//Public Sub Remember()
//'
//' Name:         Remember
//' Description:  Reset the cursor location as stored by Memorize().
//'
//
//Set Cursor = MemCursor
//
//End Sub
- (void)remember {
    self.cursor = self.memCursor;
}

//Private Sub Class_Initialize()
//'
//' Name:         Class_Initialize
//' Description:  Initialize an empty list.  VB calls this method
//'               automatically.
//'
//
//Set Cursor = Nothing
//Set FirstNode = Nothing
//Set LastNode = Nothing
//NodeCount = 0
//
//End Sub
- (void)class_initialize {
    self.cursor = nil;
    self.firstNode = nil;
    self.lastNode = nil;
    self.nodeCount = 0;
    self.memCursor = nil;
    self.nodeClass = [LinkedListNode class];
}

//Private Sub Class_Terminate()
//'
//' Name:         Class_Terminate
//' Description:  If a list is destroyed, clear it first.  VB calls
//'               this method automatically.
//'
//
//Me.Clear
//
//End Sub
- (void)class_terminate {
    [self clear];
}
@end

@implementation LinkedList (NonGrapevine)

- (LinkedListNode *)newNodeInstance {
    id newNode = [[self.nodeClass alloc] init];
    return newNode;
}

- (void)insertNodeSorted:(LinkedListNode *)newNode {
    LinkedListNode *storeCursor = nil;
    
    storeCursor = self.cursor;
    
    [self last];
    
    while (self.cursor) {
        NSComparisonResult result = [self.cursor compare:newNode];
        
        if (result == NSOrderedDescending) {
            self.cursor = self.cursor.prevNode;
        }
        else {
            if (self.cursor == self.lastNode) {
                [self appendNode:newNode];
            }
            else {
                [self moveNext];
                [self insertNode:newNode];
            }
            break;
        }
    }
    
    if (!self.cursor) {
        [self prependNode:newNode];
    }
    
    self.cursor = storeCursor;
}

- (void)prependNode:(LinkedListNode *)node {
    LinkedListNode *storeCursor = self.cursor;
    [self first];
    [self insertNode:node];
    self.cursor = storeCursor;
}

- (void)swapFrontward {
    LinkedListNode *swapItem = [self remove];
    [self insertNode:swapItem];
}

//' Description:  Insert a node into the list at the current cursor position
- (void)insertNode:(LinkedListNode *)newNode {
    if (!newNode)
        return;
    
    if (![self off]) {
        newNode.nextNode = self.cursor;
        newNode.prevNode = self.cursor.prevNode;
        
        if (self.cursor == self.firstNode) {
            self.firstNode = newNode;
        }
        else {
            newNode.prevNode.nextNode = newNode;
        }
        
        self.cursor.prevNode = newNode;
        self.nodeCount++;
    }
    else
        [self appendNode:newNode];
    
    [self integrityCheck];
}

//' Description: Insert a node at the end of the list
- (void)appendNode:(LinkedListNode *)newNode {
    newNode.nextNode = nil;
    if (self.lastNode == nil) {
        self.firstNode = newNode;
    }
    else {
        self.lastNode.nextNode = newNode;
        newNode.prevNode = self.lastNode;
    }
    self.lastNode = newNode;
    self.nodeCount++;
    
    [self integrityCheck];
}

- (BOOL)integrityCheck {
    LinkedListNode *startNode = [self firstNode];
    assert(startNode.prevNode == nil);
    while ([startNode nextNode]) {
        assert(startNode.nextNode.prevNode == startNode);
        startNode = [startNode nextNode];
    }
    return YES;
}

- (id)initWithArrayOfNodes:(NSArray *)nodes sorted:(BOOL)sorted {
    self = [self init];
    if (self) {
        for (LinkedListNode *node in nodes) {
            if (sorted)
                [self insertNodeSorted:node];
            else
                [self appendNode:node];
        }
    }
    return self;
}

- (NSArray *)allNodes {
    NSMutableArray *nodes = [NSMutableArray arrayWithCapacity:self.nodeCount];
    LinkedListNode *currentNode = self.firstNode;
    while (currentNode) {
        [nodes addObject:currentNode];
        currentNode = currentNode.nextNode;
    }
    return [nodes copy];
}
@end

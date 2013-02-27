//
//  LinkedMenuList.m
//  iGrapeVine
//
//  Created by William Cox on 11/4/12.
//  Copyright (c) 2012 William Cox. All rights reserved.
//

#import "LinkedMenuList.h"
#import "LinkedMenuListNode.h"

@interface LinkedMenuList ()

//Private Cursor As LinkedMenuListNode        'Current location in the list
//Private FirstNode As LinkedMenuListNode     'First node of the list
//Private LastNode As LinkedMenuListNode      'Last node of the list
//
//Private NodeCount As Integer                'number of nodes in the list
//
//Private Alphabetized As Boolean             'Whether to Alphabetize insertion; default true
//Private InclusionCount As Integer           'How many menu inclusions are in this menu
@property (nonatomic, strong) LinkedMenuListNode *cursor;
@property (nonatomic, strong) LinkedMenuListNode *firstNode;
@property (nonatomic, strong) LinkedMenuListNode *lastNode;
@property (nonatomic) BOOL alphabetized;
@property (nonatomic, readonly) int inclusionCount;
@end

@implementation LinkedMenuList
@dynamic cursor, firstNode, lastNode;

- (int)inclusionCount {
    LinkedMenuListNode *startNode = [self firstNode];
    int inclusions = [startNode isInclusion] ? 1 : 0;
    while ([startNode nextNode]) {
        [startNode isInclusion] ? inclusions++ : (0);
    }
    return inclusions;
}

//Public Function HasInclusion() As Boolean
//'
//' Name:         HasInclusion
//' Description:  Returns whether a menu inclusion is in this list.
//' Returns:      As above.
//'
//
//HasInclusion = (InclusionCount > 0)
//
//End Function

- (BOOL)hasInclusion {
    LinkedMenuListNode *startNode = [self firstNode];
    int inclusions = [startNode isInclusion] ? 1 : 0;
    while ([startNode nextNode] && inclusions == 0) {
        [startNode isInclusion] ? inclusions++ : (0);
    }
    return inclusions != 0;
}

//
//Public Sub SetItemCost(NewCost As String)
//'
//' Name:         SetItemCost
//' Parameters:   NewName             the new cost
//' Description:  Change the current item's cost.
//'
//
//If Not Off() Then
//If Cursor.Cost = "+" Then InclusionCount = InclusionCount - 1
//Cursor.Cost = NewCost
//If Cursor.Cost = "+" Then InclusionCount = InclusionCount + 1
//End If
//
//End Sub

- (void)setItemCost:(NSString *)newCost {
    if (!self.off) {
        self.cursor.cost = newCost;
    }
}

//
//Public Sub SwapFrontward()
//'
//' Name:         SwapFrontward
//' Description:  Swap the contents of the current item toward the front.
//'               Stop when the cursor is the first node.  Only works
//'               on non-alphabetized menus.
//'
//
//Dim SwapItem As String
//
//If Not (Alphabetized Or (Cursor Is FirstNode) Or Off) Then
//SwapItem = Cursor.Name
//Cursor.Name = Cursor.PrevNode.Name
//Cursor.PrevNode.Name = SwapItem
//SwapItem = Cursor.Cost
//Cursor.Cost = Cursor.PrevNode.Cost
//Cursor.PrevNode.Cost = SwapItem
//SwapItem = Cursor.Note
//Cursor.Note = Cursor.PrevNode.Note
//Cursor.PrevNode.Note = SwapItem
//Set Cursor = Cursor.PrevNode
//End If
//
//End Sub

- (void)swapFrontward {
    if (!self.alphabetized) {
        [super swapFrontward];
    }
}

//
//Public Sub SwapBackward()
//'
//' Name:         SwapBackward
//' Description:  Swap the contents of the current item toward the end.
//'               Stop when the cursor is the last node.  Only works
//'               on non-alphabetized menus.
//'
//
//Dim SwapItem As String
//
//If Not (Alphabetized Or (Cursor Is LastNode) Or Off) Then
//SwapItem = Cursor.Name
//Cursor.Name = Cursor.NextNode.Name
//Cursor.NextNode.Name = SwapItem
//SwapItem = Cursor.Cost
//Cursor.Cost = Cursor.NextNode.Cost
//Cursor.NextNode.Cost = SwapItem
//SwapItem = Cursor.Note
//Cursor.Note = Cursor.NextNode.Note
//Cursor.NextNode.Note = SwapItem
//Set Cursor = Cursor.NextNode
//End If
//
//End Sub
- (void)swapBackward {
    if (!self.alphabetized)
        [super swapBackward];
}
//
//Public Sub SetItemName(OldName As String, NewName As String)
//'
//' Name:         SetItemName
//' Parameters:   OldName             the old name
//'               NewName             the new name for the item
//' Description:  Change an item's name and move it to the correct place
//'               in the list if needed.
//'
//
//Dim SwapItem As String
//
//MoveTo OldName
//If Not Cursor Is Nothing Then
//
//Cursor.Name = NewName
//
//If Alphabetized Then
//
//Alphabetized = False  'temporarily turn this off
//
//Do Until Cursor.PrevNode Is Nothing
//If LCase(NewName) < LCase(Cursor.PrevNode.Name) Then
//SwapFrontward
//Else
//Exit Do
//End If
//Loop
//
//Do Until Cursor.NextNode Is Nothing
//If NewName > Cursor.NextNode.Name Then
//SwapBackward
//Else
//Exit Do
//End If
//Loop
//
//Alphabetized = True 'reset it
//
//End If
//
//End If
//
//End Sub
- (void)setItemName:(NSString *)oldName newName:(NSString *)newName {
    [self moveTo:oldName];
    
    LinkedMenuListNode *node = [self remove];
    node.name = newName;

    if (self.alphabetized) {
        [self insertNodeSorted:node];
    }
    else {
        [self insertNode:node];
    }
    
    [self integrityCheck];
}
//
//Public Sub SetItemNote(NewNote As String)
//'
//' Name:         SetItemNote
//' Parameters:   NewNote             the new note
//' Description:  Change the current item's note.
//'
//
//If Not Off() Then
//Cursor.Note = NewNote
//End If
//
//End Sub

- (void)setItemNote:(NSString *)newNote {
    if (self.cursor)
        self.cursor.note = newNote;
}

//
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

// ** Super implements count

//Public Function IsAlphabetized() As Boolean
//'
//' Name:         IsAlphabetized
//' Description:  Returns whether this menu is alphabetized or ordered
//' Returns:      Whether this menu is alphabetized or ordered
//'
//
//IsAlphabetized = Alphabetized
//
//End Function

// ** property implements getter

//Public Sub SetAlphabetized(Alpha As Boolean)
//'
//' Name:         SetAlphabetized
//' Parameters:   Alpha       TRUE if this menu is to be alphabetized; FALSE
//'                           otherwise
//' Description:  Set whether this list is to be alphabetized.  If it is not
//'               currently and it is set TRUE, alphabetize the menu.
//'
//
//Dim X As Integer
//Dim Y As Integer
//Dim Cursor1 As LinkedMenuListNode
//Dim Cursor2 As LinkedMenuListNode
//Dim Swap As String
//
//If Alpha Then
//
//'Alphabetize the menu.  Because this is expected to be a rare
//'operation, I'll just use a bubblesort instead of trying to
//'figure out how to quicksort a linked list.
//
//For X = NodeCount - 1 To 1 Step -1
//Set Cursor1 = FirstNode
//Set Cursor2 = Cursor1.NextNode
//For Y = 1 To X
//If LCase(Cursor1.Name) > LCase(Cursor2.Name) Then
//Swap = Cursor1.Name
//Cursor1.Name = Cursor2.Name
//Cursor2.Name = Swap
//Swap = Cursor1.Cost
//Cursor1.Cost = Cursor2.Cost
//Cursor2.Cost = Swap
//Swap = Cursor1.Note
//Cursor1.Note = Cursor2.Note
//Cursor2.Note = Swap
//End If
//Set Cursor1 = Cursor2
//Set Cursor2 = Cursor1.NextNode
//Next Y
//Next X
//
//End If
//
//Alphabetized = Alpha
//
//End Sub
- (void)setAlphabetized:(BOOL)alphabetized {
    [self alphabetize];
    
    _alphabetized = alphabetized;
}

//Public Sub Insert(ItemName As String, ItemCost As String, ItemNote As String)
//'
//' Name:         Insert
//' Parameters:   ItemName        name of the item to insert.
//'               ItemCost        its cost.
//'               ItemNote        its note.
//' Description:  Insert a new item into the menu -- Before the current location if
//'               not alphabetized, at the correct location if alphabetized.
//'               Move the cursor to the insertion point.
//'
//
//Dim NewNode As LinkedMenuListNode
//Dim LCItem As String
//
//LCItem = LCase(ItemName)
//
//If Alphabetized Then
//
//First
//Do Until Off()
//If LCItem > LCase(Cursor.Name) Then
//MoveNext
//Else
//Exit Do
//End If
//Loop
//
//End If
//
//If Off Then
//Append ItemName, ItemCost, ItemNote
//Else
//Set NewNode = New LinkedMenuListNode
//NewNode.Name = ItemName
//NewNode.Cost = ItemCost
//NewNode.Note = ItemNote
//Set NewNode.NextNode = Cursor
//Set NewNode.PrevNode = Cursor.PrevNode
//Set Cursor.PrevNode = NewNode
//If NewNode.PrevNode Is Nothing Then
//Set FirstNode = NewNode
//Else
//Set NewNode.PrevNode.NextNode = NewNode
//End If
//NodeCount = NodeCount + 1
//If NewNode.Cost = "+" Then InclusionCount = InclusionCount + 1
//End If
//
//End Sub

// ** Super implements insert:

//Public Sub MoveTo(ByVal ItemName As String)
//'
//' Name:         MoveTo
//' Parameters:   ItemName        an item name to which to move
//' Description:  Move the cursor to the item whose name matches
//'               the parameter.  Move off if no such item is found.
//'
//
//Dim Found As Boolean
//
//Found = False
//ItemName = LCase(ItemName)
//Me.First
//
//Do Until Off() Or Found
//Found = (LCase(Cursor.Name) = ItemName)
//If Not Found Then Me.MoveNext
//Loop
//
//End Sub

// ** Super implements moveTo:

-(void)insertWithName:(NSString *)itemName cost:(NSString *)itemCost note:(NSString *)note {
    LinkedMenuListNode *newNode = (LinkedMenuListNode *)[self newNodeInstance];
    newNode.name = itemName;
    newNode.cost = itemCost;
    newNode.note = note;
    
    [self insert:newNode];
}

//
//Public Function GetItemPlace(ByRef ItemName As String) As Long
//'
//' Name:         GetItemPlace
//' Parameters:   ItemName       an item name to which to move
//' Description:  An optimized function to quickly find and return the location
//'               of the given menu item.
//'
//
//Set Cursor = FirstNode
//GetItemPlace = 1
//Do Until Cursor Is Nothing
//If ItemName = Cursor.Name Then Exit Function
//GetItemPlace = GetItemPlace + 1
//Set Cursor = Cursor.NextNode
//Loop
//GetItemPlace = 0
//
//End Function
- (int)getItemPlace:(NSString *)itemName {
    [self moveToPlace:0];
    int place = 1;
    while ([self item]) {
        if ([itemName isEqualToString:[self.item name]])
            return place;
        place ++;
        [self moveNext];
    }
    place = 0;
    return place;
}
//
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

// ** Super implements moveToPlace

//Public Function DisplayItem() As String
//'
//' Name:         DisplayItem
//' Description:  Return the string displaying the current item --
//'               The format is controlled by ListDisplayType
//' Returns:      a string displaying the current item
//'
//
//If Not Cursor Is Nothing Then
//Select Case Cursor.Cost
//Case ":", "+"   'Special items
//
//DisplayItem = Cursor.Name & Cursor.Cost
//
//Case Else   'the usual menu items
//
//'Add the name
//DisplayItem = Cursor.Name
//
//'Add the multiplier
//If Display = ldMultiplierDot Or _
//(Display = ldMultiplier And Cursor.Cost <> "1") Then
//DisplayItem = DisplayItem & " x" & Cursor.Cost
//End If
//
//'Add the dots
//If Display = ldMultiplierDot Or Display = ldDot Then
//DisplayItem = DisplayItem & " " & String(Val(Cursor.Cost), "o")
//End If
//
//'Add the parens, cost if needed, and note if needed
//If Display = ldCost Or Display = ldCostOnly Then
//
//DisplayItem = DisplayItem & " (" & Cursor.Cost
//If Cursor.Note <> "" And Display = ldCost Then
//DisplayItem = DisplayItem & ", " & Cursor.Note
//End If
//DisplayItem = DisplayItem & ")"
//
//ElseIf Display <> ldSimple And Cursor.Note <> "" Then
//DisplayItem = DisplayItem & " (" & Cursor.Note & ")"
//End If
//
//End Select
//Else
//DisplayItem = "(Error: Cursor off Menu)"
//End If
//
//End Function
- (NSString *)displayItem {
    NSString *displayItem = @"";
    LinkedMenuListNode *item = [self item];
    if (item) {
        if ([item isLink] ||
            [item isInclusion]) {
            displayItem = [[item name] stringByAppendingString:[item cost]];
        }
        else {
            // 'Add the name
            displayItem = [item name];
            
            // 'Add the multiplier
            if (self.display == ldMultiplierDot ||
                (self.display == ldMultiplier &&
                 ![[item cost] isEqualToString:@"1"])) {
                    displayItem = [displayItem stringByAppendingFormat:@" x%@", [item cost]];
                }
            
            // 'Add the dots
            if (self.display == ldMultiplierDot ||
                self.display == ldDot) {
                displayItem = [displayItem stringByAppendingFormat:@" %@", [@"" stringByPaddingToLength:[item cost].intValue withString:@"o" startingAtIndex:0]];
            }
            
            // 'Add the parens, cost if needed and note if needed
            if (self.display == ldCost ||
                self.display == ldCostOnly) {
                displayItem = [displayItem stringByAppendingFormat:@" (%@", [item cost]];
                if (item.note.length &&
                    self.display == ldCost) {
                    displayItem = [displayItem stringByAppendingFormat:@", %@", item.note];
                }
                displayItem = [displayItem stringByAppendingString:@")"];
            }
            else if (self.display == ldNoteOnly &&
                     item.note.length) {
                displayItem = [displayItem stringByAppendingFormat:@" (%@)", item.note];
            }
        }
    }
    else
        displayItem = @"(Error: Cursor off Menu)";
    
    return displayItem;
}


//
//Public Sub Merge(MergeMenu As LinkedMenuList, Aggressive As Boolean, ByRef AllChanges As String)
//'
//' Name:         Merge
//' Parameters:   MergeMenu       Menu to merge into this one
//'               Aggressive      Whether an aggressive or conservative merge
//'               AllChanges      Reference to a string listing the changes made
//' Description:  Merge another menu into this one.  Aggressive means preference is given to
//'               the other list: Conservative means preference is given to this one.
//'               Record changes in the Changes string.
//'
//
//Dim MergePlace As Integer
//Dim ItemPlace As Integer
//Dim NewDesc As String
//Dim OldDesc As String
//Dim HighPlace As Integer
//Dim I As Integer
//Dim Reordered As Boolean
//Dim Changes As String
//
//With MergeMenu
//
//OldDesc = IIf(Aggressive, "* ", "! ")
//NewDesc = IIf(Aggressive, " set to ", " NOT set to ")
//
//If .Category <> Category Then
//If Aggressive Then Me.Category = .Category
//Changes = Changes & OldDesc & " Category" & NewDesc & CStr(.Category) & vbCrLf
//End If
//If .IsAlphabetized <> Alphabetized Then
//If Aggressive Then Me.SetAlphabetized .IsAlphabetized
//Changes = Changes & OldDesc & " Alphabetized" & NewDesc & CStr(.IsAlphabetized) & vbCrLf
//End If
//If .Autonote <> Autonote Then
//If Aggressive Then Me.Autonote = .Autonote
//Changes = Changes & OldDesc & " Autonote" & NewDesc & CStr(.Autonote) & vbCrLf
//End If
//If .Display <> Display Then
//If Aggressive Then Me.Display = .Display
//Changes = Changes & OldDesc & " Display" & NewDesc & CStr(.Display) & vbCrLf
//End If
//If .Negative <> Negative Then
//If Aggressive Then Me.Negative = .Negative
//Changes = Changes & OldDesc & " Negative" & NewDesc & CStr(.Negative) & vbCrLf
//End If
//If .Required <> Required Then
//If Aggressive Then Me.Required = .Required
//Changes = Changes & OldDesc & " Required" & NewDesc & CStr(.Required) & vbCrLf
//End If
//
//.First
//Do Until .Off
//
//Select Case .ItemCost
//Case ":": NewDesc = "submenu link (Link=" & .ItemNote & ")"
//Case "+": NewDesc = "menu inclusion (Link=" & .ItemNote & ")"
//Case Else: NewDesc = "item (Cost=" & .ItemCost & ", Note=" & .ItemNote & ")"
//End Select
//NewDesc = """" & .ItemName & """ " & NewDesc
//
//ItemPlace = Me.GetItemPlace(.ItemName) - 1
//
//If ItemPlace < 0 Then
//
//If .ItemNote <> "DELETE" Then
//HighPlace = HighPlace + 1
//If Not Alphabetized Then MoveToPlace HighPlace
//Me.Insert .ItemName, .ItemCost, .ItemNote
//Changes = Changes & "+ Added " & NewDesc & vbCrLf
//End If
//
//Else
//
//Select Case Me.ItemCost
//Case ":": OldDesc = "submenu link (Link=" & Me.ItemNote & ")"
//Case "+": OldDesc = "menu inclusion (Link=" & Me.ItemNote & ")"
//Case Else: OldDesc = "item (Cost=" & Me.ItemCost & ", Note=" & Me.ItemNote & ")"
//End Select
//OldDesc = """" & Me.ItemName & """ " & OldDesc
//
//If .ItemNote = "DELETE" Then
//If Aggressive Then
//Me.Remove
//Changes = Changes & "- Deleted " & OldDesc & vbCrLf
//End If
//Else
//
//If ItemPlace >= HighPlace Then
//HighPlace = ItemPlace
//Else
//If Aggressive And Not Alphabetized Then
//For I = 1 To HighPlace - ItemPlace
//Me.SwapBackward
//Next I
//If Not Reordered Then
//Reordered = True
//Changes = Changes & "* Re-Organized" & vbCrLf
//End If
//End If
//End If
//
//If Not (.ItemCost = Me.ItemCost And .ItemNote = Me.ItemNote) Then
//
//If Aggressive Then
//Me.SetItemCost .ItemCost
//Me.SetItemNote .ItemNote
//Changes = Changes & "* Changed " & OldDesc & " to " & NewDesc & vbCrLf
//Else
//Changes = Changes & "! Skipped " & NewDesc & " to preserve " & OldDesc & vbCrLf
//End If
//
//End If
//End If
//
//End If
//
//.MoveNext
//Loop
//
//End With
//
//If Changes <> "" Then
//AllChanges = AllChanges & """" & Name & """ Menu:" & vbCrLf & Changes & vbCrLf
//End If
//
//End Sub
//
//Public Function ItemName() As String
//'
//' Name:         ItemName
//' Description:  Return the name of the item under the cursor
//' Returns:      the item name
//'
//
//ItemName = Cursor.Name
//
//End Function
- (NSString *)itemName {
    return [self.item name];
}
//
//Public Function ItemCost() As String
//'
//' Name:         ItemCost
//' Description:  Return the cost of the item under the cursor
//' Returns:      the item cost
//'
//
//ItemCost = Cursor.Cost
//
//End Function
- (NSString *)itemCost
{
    return [self.item cost];
}
//
//Public Function ItemNote() As String
//'
//' Name:         ItemNote
//' Description:  Return the note of the item under the cursor
//' Returns:      the item note
//'
//
//ItemNote = Cursor.Note
//
//End Function
- (NSString *)itemNote {
    return [self.item note];
}
//
//Public Sub Append(ItemName As String, ItemCost As String, ItemNote As String)
//'
//' Name:         Append
//' Parameters:   ItemName        name of the item to insert.
//'               ItemCost        its cost.
//'               ItemNote        its note.
//' Description:  Add an item to the end of the list.
//'
//
//Dim NewNode As LinkedMenuListNode
//
//If Alphabetized And Not (LastNode Is Nothing) Then
//If LCase(ItemName) < LCase(LastNode.Name) Then
//Insert ItemName, ItemCost, ItemNote
//Exit Sub
//End If
//End If
//
//Set NewNode = New LinkedMenuListNode
//NewNode.Name = ItemName
//NewNode.Cost = ItemCost
//NewNode.Note = ItemNote
//Set NewNode.NextNode = Nothing
//Set NewNode.PrevNode = LastNode
//
//If LastNode Is Nothing Then
//Set FirstNode = NewNode
//Else
//Set LastNode.NextNode = NewNode
//End If
//
//If NewNode.Cost = "+" Then InclusionCount = InclusionCount + 1
//Set LastNode = NewNode
//NodeCount = NodeCount + 1
//
//End Sub
- (void)appendWithName:(NSString *)name cost:(NSString *)cost note:(NSString *)note {
    LinkedMenuListNode *newNode = (LinkedMenuListNode *)[self newNodeInstance];
    newNode.name = name;
    newNode.cost = cost;
    newNode.note = note;

    [self appendNode:newNode];
}
//
//Public Sub Remove()
//'
//' Name:         Remove
//' Description:  Totally remove the item from the current cursor
//'               position.
//'
//
//Dim NextCursor As LinkedMenuListNode
//
//If Not Off() Then
//
//If Cursor.Cost = "+" Then InclusionCount = InclusionCount - 1
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
//Set Cursor = Nothing
//Set Cursor = NextCursor
//
//NodeCount = NodeCount - 1
//
//End If
//
//End Sub
- (LinkedMenuListNode *)remove {
    return(LinkedMenuListNode *)[super remove];
}

//Public Sub OutputToFile(XML As XMLWriterClass)
//'
//' Name:         OutputToFile
//' Parameters:   XML     the XMLWriterClass
//' Description:  Write all the traits to a file.
//'
//
//Dim MemCursor As LinkedMenuListNode
//
//Set MemCursor = Cursor
//
//With XML
//
//.BeginTag "menu"
//
//.WriteAttribute "name", Name
//.WriteAttribute "category", Category, gvRaceAll
//.WriteAttribute "abc", Alphabetized
//.WriteAttribute "negative", Negative, False
//.WriteAttribute "autonote", Autonote, False
//.WriteAttribute "required", Required, False
//.WriteAttribute "display", Display
//
//First
//Do Until Off
//Select Case Cursor.Cost
//Case ":"
//.BeginTag "submenu"
//.WriteAttribute "name", Cursor.Name
//.WriteAttribute "link", Cursor.Note, Cursor.Name
//Case "+"
//.BeginTag "include"
//.WriteAttribute "name", Cursor.Name
//.WriteAttribute "link", Cursor.Note, Cursor.Name
//Case Else
//.BeginTag "item"
//.WriteAttribute "name", Cursor.Name
//.WriteAttribute "cost", Cursor.Cost, "1"
//.WriteAttribute "note", Cursor.Note
//End Select
//.EndTag
//MoveNext
//Loop
//
//.EndTag
//
//End With
//
//Set Cursor = MemCursor
//
//End Sub
- (void)outputToFile:(id)xmlWriter {
    
}
//
//Public Sub InputFromFile(XML As XMLReaderClass, Version As Double)
//'
//' Name:         InputFromFile
//' Parameters:   XML         XMLReaderClass used to read the file
//'               Version     version tag of the file format
//' Description:  Read a LinkedMenuList from a file.
//'
//
//Dim NewName As String
//Dim TempAlpha As Boolean
//
//With XML
//
//NewName = .GetString("name")
//If .Tag = "menu" And NewName <> "" Then
//
//Alphabetized = False
//Clear
//InclusionCount = 0
//
//Name = NewName
//Category = .GetLong("category", gvRaceAll)
//TempAlpha = .GetBoolean("alphabetized") Or .GetBoolean("abc")
//Negative = .GetBoolean("negative", False)
//Autonote = .GetBoolean("autonote", False)
//Required = .GetBoolean("required", False)
//Display = .GetLong("display", ldSimple)
//
//Do Until .Tag = "menu" And .Terminal
//
//.ReadTag
//NewName = .GetString("name")
//If NewName <> "" Then
//Select Case .Tag
//Case "item"
//Append NewName, .GetString("cost", "1"), .GetString("note")
//Case "submenu"
//Append NewName, ":", .GetString("link", NewName)
//Case "include"
//Append NewName, "+", .GetString("link", NewName)
//End Select
//End If
//
//Loop
//
//Alphabetized = TempAlpha
//
//Else
//
//Err.Raise vbObjectError + 8, "LinkedMenuList", _
//"Bad file input to a menu"
//
//End If
//
//End With
//
//End Sub
//
//Public Sub OutputToBinary(FileNum As Integer)
//'
//' Name:         OutputToBinary
//' Parameters:   FileNum     the number of the open file to write to
//' Description:  Write this character's data to a binary file.
//'
//
//Dim MemCursor As LinkedMenuListNode
//
//Set MemCursor = Cursor
//
//PutStrB FileNum, Name
//Put #FileNum, , Category
//Put #FileNum, , Alphabetized
//Put #FileNum, , Negative
//Put #FileNum, , Autonote
//Put #FileNum, , Required
//Put #FileNum, , Display
//
//Put #FileNum, , CInt(Count)
//
//First
//Do Until Off
//PutStrB FileNum, Cursor.Name
//PutStrB FileNum, Cursor.Cost
//PutStrB FileNum, Cursor.Note
//MoveNext
//Loop
//
//Set Cursor = MemCursor
//
//End Sub

- (void)outputToBinary:(int)fileNum {
    // TODO
}
//
//Public Sub InputFromBinary(FileNum As Integer, Version As Double)
//'
//' Name:         InputFromBinary
//' Parameters:   FileNum     the number of the open file to read from
//'               Version     the version of the file format
//' Description:  Read this character's data from a binary file.
//'
//
//Dim I As Integer
//Dim MName As String
//Dim MCost As String
//Dim MNote As String
//Dim TempAlpha As Boolean
//
//Alphabetized = False
//
//GetStrB FileNum, Name
//If Version >= 2.397 Then
//Get #FileNum, , Category
//End If
//Get #FileNum, , TempAlpha
//Get #FileNum, , Negative
//Get #FileNum, , Autonote
//Get #FileNum, , Required
//Get #FileNum, , Display
//
//Get #FileNum, , I
//
//Clear
//Do Until I = 0
//GetStrB FileNum, MName
//GetStrB FileNum, MCost
//GetStrB FileNum, MNote
//Append MName, MCost, MNote
//I = I - 1
//Loop
//
//Alphabetized = TempAlpha
//
//End Sub
- (void)inputFromBinary:(int)fileNum version:(float)version {
    NSString *name = nil;
    [Root getStrB:fileNum stringValue:&name];
    self.name = name;
    if (version) {
        _category = [Root getIntB:fileNum];
    }
    int tempAlpha = 0;
    tempAlpha = [Root getIntB:fileNum];
    _negative = [Root getIntB:fileNum];
    _autonote = [Root getIntB:fileNum];
    _required = [Root getIntB:fileNum];
    _display = [Root getIntB:fileNum];
    
    int i = [Root getIntB:fileNum];
    NSString *mName = nil, *mCost = nil, *mNote = nil;
    
    [self clear];
    while (i > 0) {
        [Root getStrB:fileNum stringValue:&mName];
        [Root getStrB:fileNum stringValue:&mCost];
        [Root getStrB:fileNum stringValue:&mNote];
        [self appendWithName:mName cost:mCost note:mNote];
        i--;
    }
    _alphabetized = tempAlpha;
}
//
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
//Category = gvRaceAll
//Alphabetized = True
//Name = ""
//Negative = False
//Display = ldSimple
//Autonote = False
//InclusionCount = 0
//
//End Sub
- (void)class_initialize {
    [super class_initialize];
    self.name = @"";
    self.category = gvRaceAll;
    self.alphabetized = YES;
    self.negative = NO;
    self.display = ldSimple;
    self.autonote = NO;
    self.nodeClass = [LinkedMenuListNode class];
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

@end

@implementation LinkedMenuList (NonGrapevine)
- (void)alphabetize {
    LinkedMenuListNode *cursor = self.cursor;
    NSArray *allNodes = [self allNodes];
    
    [self clear];
    for (LinkedMenuListNode *node in allNodes)
         [self insertNodeSorted:node];
    
    self.cursor = cursor;
}

- (void)appendNode:(LinkedMenuListNode *)newNode {
    if (self.alphabetized) {
        self.alphabetized = NO; // Infinite loops are bad mmkay
        [self insertNodeSorted:newNode];
        self.alphabetized = YES;
    }
    else {
        [super appendNode:newNode];
    }
}


@end

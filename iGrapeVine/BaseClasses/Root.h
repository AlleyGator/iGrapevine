//
//  Root.h
//  iGrapeVine
//
//  Created by William Cox on 11/4/12.
//  Copyright (c) 2012 William Cox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Root : NSObject
//' File:             Root.bas
//' Author:           Adam Cerling
//' Description:      The Main() function in which the program starts is here, as well as
//'                   some functions it needs to load files and some other public functions.
//'
//
//Sub Main()
//'
//' Name:         Main
//' Description:  The starting point of the program.  Create all the needed objects and
//'               initialize the global references.  Load and show the mdiMain window.
//'
//
//Public Sub CleanUp()
//'
//' Name:         CleanUp
//' Description:  Destroy all objects.  The last thing to call before ending the program.

+ (FileFormatType)detectFileFormat:(NSString *)fileNamePath;
//Public Function DetectFileFormat(FileName As String) As FileFormatType
//'
//' Name:         DetectFileFormat
//' Parameters:   FileName            File path & name to check
//' Description:  Read the header of a file to tell what kind it is.
//' Returns:      The format of the file.
//'

+ (NSString *)trimTabs:(NSString *)string;
//Public Function TrimTabs(ByVal Str As String) As String
//'
//' Name:         TrimTabs
//' Parameters:   Str         the string to strip of tabs
//' Description:  Strip the tabs off the left and right of a string.  Used to help parse
//'               menu files.
//' Returns:      the stripped-down string.
//'
+ (NSString *)trimWhiteSpace:(NSString *)string;
//Public Function TrimWhiteSpace(ByVal Str As String) As String
//'
//' Name:         TrimWhiteSpace
//' Parameters:   Str         the string to strip of white space
//' Description:  Strip the white space off the beginning and end of a string, including tabs,
//'               carriage returns, linefeeds and spaces.
//' Returns:      the stripped-down string.
//'

+ (BOOL)outsideQuotes:(NSString *)quoteString location:(long)location;
//Public Function OutsideQuotes(QuoteStr As String, Loc As Long) As Boolean
//'
//' Name:         OutsideQuotes
//' Parameters:   QuoteStr        String to examine
//'               Loc             Position in string
//' Description:  Return TRUE iff the given position in the string is not between quote marks.
//'

//+ (NSString *)getRelativeName:(NSString *)fileName gameFile:(NSString *)string;
//Public Function GetRelativeName(FileName As String, GameFile As String) As String
//'
//' Name:         FindFile
//' Parameters:   FileName        Full path of the file to get the relative path for
//'               GameFile        Full path of the game file
//' Description:  Try to get a relative path from the application path.
//'               Failing that, get one from the game file path.
//' Return:       A relative path, or a full path if no relative is found.
//'

//+ (NSString *)findFile:(NSString *)fileName default:(NSString *)defaultFile;
//Public Function FindFile(TryFile As String, Optional Default As String = "") As String
//'
//' Name:         FindFile
//' Parameters:   TryFile     name of the file to find on the disks
//'               Default     name of a default file to find if all else fails
//' Description:  Look for the presence of a given file, correcting for absolute
//'               or relative paths.  Look for a default file if the first one isn't
//'               found.
//' Returns:      A path to the given file, or "" if it's not found.
//'

//+ (NSString *)shortFile:(NSString *)fileName;
//Public Function ShortFile(FileName As String) As String
//'
//' Name:         ShortFile
//' Parameters:   A Filename to shorten.
//' Description:  Clip the given filename from its last "\".
//'

//+ (NSString *)slashPath:(NSString *)path;
//Public Function SlashPath(PathName As String) As String
//'
//' Name:         ShortFile
//' Parameters:   Path name to edit
//' Description:  Add a backslash to the end of a path if it's not already there.
//'

//+ (NSString *)selectText:(id)textBox;
//Public Sub SelectText(BoxofText As TextBox)
//'
//' Name:         SelectText
//' Parameters:   BoxofText   the text box
//' Description:  Select (highlight) the contents of a text box.  Usually called when the box
//'               recieves focus.
//'

//+ (NSString *)convertToFileName:(NSString *)value;
//Public Function ConvertToFileName(ByVal Value As String) As String
//'
//' Name:         ConvertToFileName
//' Parameters:   Value       the string to convert
//' Description:  Convert a string to a legal filename by stripping out or changing reserved
//'               characters.
//' Returns:      the new filename
//'
//

//+ (NSString *)readLongField:(int)fileNum delimiter:(NSString *)delimiter;
//Public Function ReadLongField(FileNum As Integer, Delimiter As String) As String
//'
//' Name:         ReadLongField
//' Parameters:   FileNum         the number of the open file
//'               Delimiter       the string at which to stop reading
//' Description:  Read several lines of a file until an expected delimiter is reached.
//'               Used by most classes that load data from a file.
//' Returns:      the data read
//'

//+ (NSString *)xorScramble:(NSString *)key text:(NSString *)text;
//Public Function XORScramble(Key As String, Text As String) As String
//'
//' Name:         XORScramble
//' Parameters:   Key         key by which to scramble the input
//'               Text        string to scramble
//' Description:  Simple XOR encryption of two strings.
//'

+ (void)putStrB:(int)fileNum stringValue:(NSString *)string;
//Public Sub PutStrB(FileNum As Integer, ByVal StrVal As String)
//'
//' Name:         PutStrB
//' Parameters:   FileNum             binary file number to write to
//'               StrVal              String value to write
//' Description:  Write a string's length before the string, when writing to a binary file.
//'               Only by knowing the string's length can it later be read back in.
//'

+ (void)getStrB:(int)fileNum stringValue:(NSString **)string;
//Public Sub GetStrB(FileNum As Integer, ByRef StrVal As String)
//'
//' Name:         GetStrB
//' Parameters:   FileNum             binary file number to read from
//'               StrVal              String value to read
//' Description:  Read a string's length, prepare the space to store it, and then read
//'               in the string.
//'
@end

@interface Root (NonGrapevine)
+ (int)getIntB:(int)fileNum;
+ (NSString *)getStrB:(int)fileNum;
+ (double)getDoubleB:(int)fileNum;
@end

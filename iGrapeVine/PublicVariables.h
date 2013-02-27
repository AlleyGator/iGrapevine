//  Copyright (c) 2013 William Cox. All rights reserved.
// This file basically just holds singletons in GrapeVine.

#include "LinkedList.h"
@class GameClass;
@class OutputEngineClass;

@interface PublicVariables : NSObject
+ (instancetype)shared;

//Attribute VB_Name = "PublicVariables"
//'
//' File:             PublicVariables.bas
//' Author:           Adam Cerling
//' Description:      Declare all the public variables needed by Grapevine.
//'
//Option Explicit
//
//'
//' Variable:         Game
//' Description:      Reference to the instance of GameClass.
//' Used In:          Everything.
//'
@property (nonatomic, strong) GameClass * Game;
//Public Game As GameClass
//
//'
//' Variables:        Utility Lists
//' Description:      Refences to Lists within Game.
//' Used In:          Everything.
//'
@property (nonatomic, strong) LinkedList * PlayerList;
@property (nonatomic, strong) LinkedList * CharacterList;
@property (nonatomic, strong) LinkedList * ItemList;
@property (nonatomic, strong) LinkedList * RoteList;
@property (nonatomic, strong) LinkedList * LocationList;
@property (nonatomic, strong) LinkedList * ActionList;
@property (nonatomic, strong) LinkedList * PlotList;
@property (nonatomic, strong) LinkedList * RumorList;
@property (nonatomic, strong) LinkedList * AllRumorLists;
@property (nonatomic, strong) LinkedList * InfluenceUseList;
//
//Public PlayerList As LinkedList                         'Public Pointers to the game lists
//Public CharacterList As LinkedList
//Public ItemList As LinkedList
//Public RoteList As LinkedList
//Public LocationList As LinkedList
//Public ActionList As LinkedList
//Public PlotList As LinkedList
//Public RumorList As LinkedList
//Public AllRumorLists As LinkedList
//Public InfluenceUseList As LinkedList
//
//'
//' Variables:        OutputEngine
//' Description:      Instance of utility class that assists with all forms of output.
//' Used In:          the printing screens.
//'
@property (nonatomic, strong) OutputEngineClass *OutputEngine;
//Public OutputEngine As OutputEngineClass
//
//'
//' Variable:         StdHealth
//' Description:      Array of the Four standard Health Levels
//' Used In:          clsCharSheetEngine, Root, Character Classes
//'
@property (nonatomic, strong) NSArray *StdHealth;
//Public StdHealth(hlMinHealth To hlMaxHealth) As String
//
//' Variable:         HideSTFromFile
//' Description:      Whether to filter out ST comments when saving an Exchange file
//' Used in:          XMLWriterClass, PutStrB function, frmExchange, GameClass
//'
@property (nonatomic) BOOL HideSTFromFile;
//Public HideSTFromFile As Boolean
@end
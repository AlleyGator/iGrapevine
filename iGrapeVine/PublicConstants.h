//  Copyright (c) 2013 William Cox. All rights reserved.

#ifndef iGrapeVine_PublicConstants_h
#define iGrapeVine_PublicConstants_h

//Attribute VB_Name = "PublicConstants"
//'
//' File:             PublicConstants.bas
//' Author:           Adam Cerling
//' Description:      Declare all the Constants needed by Grapevine.
//'
//Option Explicit
//
//'
//' Constants:        Grapevine Caption
//' Description:      Title of current version of Grapevine
//' Used In:          mdiMain
//'
//Public Const GrapevineCaption = "Grapevine 3.0"
static NSString *const GrapevineCaption = @"Grapevine 3.0";
//
//'
//' Constants:        Current Program Version
//' Description:      Used to identify file types and versions
//' Used in:          GameClass, MenuSetClass
//'
//Public Const ThisVersion As Double = 3#
static float const ThisVersion = 3.0;
//
//'
//' Constants:        APR constants
//' Description:      Important strings dealing with actions and rumors
//' Used in:          APREngineClass, ActionClass, frmAction
//'
static NSString *const BasicSubactionName = @"Personal";
static NSString *const PublicRumorTitle = @"Public Knowledge";
static NSString *const RecentSearchName = @"Most Recent Search";
static NSString *const BackupFileName = @"~Autosave.gv3";

//Public Const BasicSubactionName = "Personal"
//Public Const PublicRumorTitle = "Public Knowledge"
//
//Public Const RecentSearchName = "Most Recent Search"
//Public Const BackupFileName = "~Autosave.gv3"
//
//'
//' Constants:        Binary File Header Data
//' Description:      Used to identify binary file types and versions
//' Used in:          Root, GameClass, MenuSetClass
//'
static int const BinHeaderLen = 4;
static NSString *const BinHeaderGame = @"GVBG";
static NSString *const BinHeaderMenu = @"GVBM";
static NSString *const BinHeaderExchange = @"GVBE";

//Public Const BinHeaderLen As Integer = 4 'length of all binary headers
//Public Const BinHeaderGame As String = "GVBG"
//Public Const BinHeaderMenu As String = "GVBM"
//Public Const BinHeaderExchange As String = "GVBE"
//
//'
//' Constants:        WWW Locations
//' Description:      Location of Grapevine WWW resources
//' Used In:          mdiMain, frmAbout
//'
//Public Const URLMainPage = "http://www.GrapevineLARP.com/"
//Public Const URLHelpPage = "http://www.GrapevineLARP.com/help.shtml"
static NSString *const URLMainPage = @"http://www.GrapevineLARP.com/";
static NSString *const URLHelpPage = @"http://www.GrapevineLARP.com/help.shtml";

//
//'
//' Constants:        Default filenames
//' Description:      Names of the default files
//' Used In:          GameClass, MenuSetClass
//'
//Public Const DefaultMenuFile = "Grapevine Menus.gvm"
//Public Const DefaultInventoryFile = "New Game Items.gex"
static NSString *const DefaultMenuFile = @"Grapevine Menus.gvm";
static NSString *const DefaultInventoryFile = @"New Game Items.gex";

//
//'
//' Constants:        Game File Versions
//' Description:      The headers to the evolving file formats of Grapevine
//' Used In:          GameClass, various OldInputFromFile routines
//'
static NSString *const GameFileVersionTag0 = @"<-Grapevine II Game File->";
static NSString *const GameFileVersionTag1 = @"<-Grapevine 2.0 Game File / Format 1->";
static NSString *const GameFileVersionTag2 = @"<-Grapevine 2.0 Game File / Format 2->";
static NSString *const GameFileVersionTag3 = @"<-Grapevine 2.1 Game File / Format 1->";
static NSString *const GameFileVersionTag4 = @"<-Grapevine 2.2 Game File / Format 1->";
static NSString *const GameFileVersionTag5 = @"<-Grapevine 2.3 Game File / Format 1->";

static NSString *const ExchangeFileVersionTag0 = @"<-Exchange File / Grapevine 2.2 / Format 1 ->";
static NSString *const ExchangeFileVersionTag1 = @"<-Exchange File / Grapevine 2.3 / Format 1 ->";
//Public Const GameFileVersionTag0 = "<-Grapevine II Game File->"
//Public Const GameFileVersionTag1 = "<-Grapevine 2.0 Game File / Format 1->"
//Public Const GameFileVersionTag2 = "<-Grapevine 2.0 Game File / Format 2->"
//Public Const GameFileVersionTag3 = "<-Grapevine 2.1 Game File / Format 1->"
//Public Const GameFileVersionTag4 = "<-Grapevine 2.2 Game File / Format 1->"
//Public Const GameFileVersionTag5 = "<-Grapevine 2.3 Game File / Format 1->"
//
//Public Const ExchangeFileVersionTag0 = "<-Exchange File / Grapevine 2.2 / Format 1 ->"
//Public Const ExchangeFileVersionTag1 = "<-Exchange File / Grapevine 2.3 / Format 1 ->"
//

//'
//' Constants:        Active Status
//' Description:      The Item in the Status menus that means "Active"
//' Used In:          frmCharacters, frmOutputSheets, frmOutputRumors, frmPointMaintenance
//'
static NSString *const ActiveStatus = @"Active";
//Public Const ActiveStatus = "Active"
//

//'
//' Constants:        Point Type tags
//' Description:      A value that controls whether an instance of frmPointMaintenance
//'                   is tracking experience or player points
//' Used In:          frmPointMaintenance
//'
static NSString *const pmExperience = @"E";
static NSString *const pmPlayerPoints = @"P";
//Public Const pmExperience = "E"
//Public Const pmPlayerPoints = "P"
//

//'
//' Constants:        Health Level constants
//' Description:      Values of standard health leves
//' Used In:          clsCharSheetEngine, Character Classes, Root
//'
static NSString *const hlStdHealth0 = @"Healthy";
static NSString *const hlStdHealth1 = @"Bruised";
static NSString *const hlStdHealth2 = @"Wounded";
static NSString *const hlStdHealth3 = @"Incapacitated";
static NSString *const hlStdHealth4 = @"Mortally Wounded";
static int const hlMinHealth = 0;
static int const hlMaxHealth = 4;
//Public Const hlStdHealth0 = "Healthy"
//Public Const hlStdHealth1 = "Bruised"
//Public Const hlStdHealth2 = "Wounded"
//Public Const hlStdHealth3 = "Incapacitated"
//Public Const hlStdHealth4 = "Mortally Wounded"
//Public Const hlMinHealth = 0
//Public Const hlMaxHealth = 4
//
//'
//' Constants:        Plot Status constants
//' Description:      Statuses for plot objects
//' Used In:          PlotClass, associated forms
//'
static NSString *const psActive = @"Active";
static NSString *const psFinished = @"Finished";
static NSString *const psPending = @"Pending";
//Public Const psActive = "Active"
//Public Const psFinished = "Finished"
//Public Const psPending = "Pending"
//

//' Constants:        Output ID Constants
//' Description:      Returned by several objects to describe how they are to be
//'                   maipulated by the OutputEngineClass
//' Used In:          OutputEngineClass, LinkedTraitList, ExperienceClass,
//'                   PlotClass, ActionClass, RumorClass
//'
static int const oidNone = -1;
static int const oidTraitList = 0;
static int const oidHistory = 1;
static int const oidPlot = 2;
static int const oidAction = 3;
static int const oidRumor = 4;
static int const oidCalendar = 5;
//Public Const oidNone = -1
//Public Const oidTraitList = 0
//Public Const oidHistory = 1
//Public Const oidPlot = 2
//Public Const oidAction = 3
//Public Const oidRumor = 4
//Public Const oidCalendar = 5

//
//' Constants:        Output Selection Constants
//' Description:      Indices of selections of objects for output
//' Used In:          OutputEngineClass, output forms
//'
static int const osMin = 1;
static int const osPlayers = 1;
static int const osCharacters = 2;
static int const osItems = 3;
static int const osRotes = 4;
static int const osLocations = 5;
static int const osActions = 6;
static int const osPlots = 7;
static int const osRumors = 8;
static int const osMax = 8;
static int const osSearch = 9;
static int const osStatistics = 10;
//Public Const osMin = 1
//Public Const osPlayers = 1
//Public Const osCharacters = 2
//Public Const osItems = 3
//Public Const osRotes = 4
//Public Const osLocations = 5
//Public Const osActions = 6
//Public Const osPlots = 7
//Public Const osRumors = 8
//Public Const osMax = 8
//Public Const osSearch = 9
//Public Const osStatistics = 10
//

//'
//' Constants:        Standard Template Names
//' Description:      Names of the standard templates Grapevine expects to see
//' Used In:          TemplateClass, OutputEngineClass, output forms, all forms
//'                   with a SetDefaultOutput method
//'
static NSString *const tnCharSheetSuffix = @" Character Sheet";
static NSString *const tnActionRumor = @"Action and Rumor Report";
static NSString *const tnMasterAction = @"Master Action Report";
static NSString *const tnMasterRumor = @"Master Rumor Report";
static NSString *const tnPlot = @"Plot Report";
static NSString *const tnCharacterSheets = @"Character Sheets";
static NSString *const tnCharacterRoster = @"Character Roster";
static NSString *const tnEquipment = @"Character Equipment";
static NSString *const tnSignIn = @"Sign-In Sheet";
static NSString *const tnItemCards = @"Item Cards";
static NSString *const tnRoteCards = @"Rote Cards";
static NSString *const tnLocationCards = @"Location Cards";
static NSString *const tnXPHistory = @"Experience History";
static NSString *const tnPPHistory = @"Player Point History";
static NSString *const tnPlayerRoster = @"Player Roster";
static NSString *const tnGameCalendar = @"Game Calendar";
static NSString *const tnSearch = @"Search Report";
static NSString *const tnStatistics = @"Statistics Report";
static NSString *const tnVampireStatus = @"Vampire Status Report";
static NSString *const tnMFReport = @"Merits and Flaws Report";
static NSString *const tnInfluenceReport = @"Influence Report";
//Public Const tnCharSheetSuffix = " Character Sheet"
//Public Const tnActionRumor = "Action and Rumor Report"
//Public Const tnMasterAction = "Master Action Report"
//Public Const tnMasterRumor = "Master Rumor Report"
//Public Const tnPlot = "Plot Report"
//Public Const tnCharacterSheets = "Character Sheets"
//Public Const tnCharacterRoster = "Character Roster"
//Public Const tnEquipment = "Character Equipment"
//Public Const tnSignIn = "Sign-In Sheet"
//Public Const tnItemCards = "Item Cards"
//Public Const tnRoteCards = "Rote Cards"
//Public Const tnLocationCards = "Location Cards"
//Public Const tnXPHistory = "Experience History"
//Public Const tnPPHistory = "Player Point History"
//Public Const tnPlayerRoster = "Player Roster"
//Public Const tnGameCalendar = "Game Calendar"
//Public Const tnSearch = "Search Report"
//Public Const tnStatistics = "Statistics Report"
//Public Const tnVampireStatus = "Vampire Status Report"
//Public Const tnMFReport = "Merits and Flaws Report"
//Public Const tnInfluenceReport = "Influence Report"
//

//'
//' Constants:        Special E-Mail Recipients
//' Description:      Names of special e-mail recipients
//' Used In:          frmEMailAddressing, frmOutput, OutputEngineClass
//'
static NSString *const SendToSelect = @"[Send_to_Select]";
//Public Const SendToSelect = "[Send_to_Select]"
//

//'
//' Constants:        Character Value Keys
//' Description:      Keywords used to retrieve values from character classes
//' Used In:          Character Classes, Search and Statistics tools, Printing
//'
//' --- See PublicQueryKeys module
//
static NSString *const xeKey = @"Gv3.0XK!";
//Public Const xeKey = "Gv3.0XK!"


#endif

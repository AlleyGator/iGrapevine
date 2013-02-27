//
//  PublicQueryKeys.h
//  iGrapeVine
//
//  Created by William Cox on 2/26/13.
//  Copyright (c) 2013 William Cox. All rights reserved.
//
//Attribute VB_Name = "PublicQueryKeys"
//'
//' File:             PublicQueryKeys.bas
//' Author:           Adam Cerling
//' Description:      Create the constants by which Grapevine refers to character data.
//'
//Option Explicit
//
//'
//' Constants:        Character Value Keys
//' Description:      Keywords used to retrieve values from character classes.
//'                   These must correspond to the values in the "qkdata.gvd" file.
//' Used In:          Character Classes, Search and Statistics tools, Printing
//'

static NSString *const qkName = @"name";
static NSString *const qkRace = @"race";
static NSString *const qkGroup = @"group";
static NSString *const qkSubgroup = @"subgroup";
static NSString *const qkXPEarned = @"xpearned";
static NSString *const qkXPUnspent = @"xpunspent";
static NSString *const qkNature = @"nature";
static NSString *const qkDemeanor = @"demeanor";
static NSString *const qkWillpower = @"willpower";
static NSString *const qkTempWillpower = @"tempwillpower";
static NSString *const qkPhysical = @"physical";
static NSString *const qkSocial = @"social";
static NSString *const qkMental = @"mental";
static NSString *const qkPhysicalNeg = @"physicalneg";
static NSString *const qkSocialNeg = @"socialneg";
static NSString *const qkMentalNeg = @"mentalneg";
static NSString *const qkPhysicalMax = @"physicalmax";
static NSString *const qkSocialMax = @"socialmax";
static NSString *const qkMentalMax = @"mentalmax";
static NSString *const qkAbilities = @"abilities";
static NSString *const qkInfluences = @"influences";
static NSString *const qkBackgrounds = @"backgrounds";
static NSString *const qkHealth = @"healthlevels";
static NSString *const qkMerits = @"merits";
static NSString *const qkFlaws = @"flaws";
static NSString *const qkEquipment = @"equipment";
static NSString *const qkLocations = @"locations";
static NSString *const qkOther = @"other";
static NSString *const qkBiography = @"biography";
static NSString *const qkRandom = @"random";

static NSString *const qkNotes = @"notes";
static NSString *const qkPlayer = @"player";
static NSString *const qkPlayStatus = @"playstatus";
static NSString *const qkID = @"id";
static NSString *const qkStartDate = @"startdate";
static NSString *const qkNarrator = @"narrator";
static NSString *const qkNPC = @"npc";
static NSString *const qkLastModified = @"lastmodified";

static NSString *const qkPPUnspent = @"ppunspent";
static NSString *const qkPPEarned = @"ppearned";
static NSString *const qkEMail = @"email";
static NSString *const qkPhone = @"phone";
static NSString *const qkAddress = @"address";
static NSString *const qkActive = @"active";
//'Backward compatibility for <2.3.96

static NSString *const qkDisciplines = @"disciplines";
static NSString *const qkRank = @"rank";
static NSString *const qkRites = @"rites";
static NSString *const qkTitle = @"title";
static NSString *const qkBlood = @"blood";
static NSString *const qkTempBlood = @"tempblood";
static NSString *const qkConscience = @"conscience";
static NSString *const qkTempConscience = @"tempconscience";
static NSString *const qkSelfControl = @"selfcontrol";
static NSString *const qkTempSelfControl = @"tempselfcontrol";
static NSString *const qkCourage = @"courage";
static NSString *const qkTempCourage = @"tempcourage";
static NSString *const qkDerangements = @"derangements";
static NSString *const qkPowers = @"powers";
static NSString *const qkStatus = @"status";
static NSString *const qkHumanity = @"humanity";
static NSString *const qkRituals = @"rituals";
static NSString *const qkPathTraits = @"pathtraits";
static NSString *const qkTempPathTraits = @"temppathtraits";
static NSString *const qkFaction = @"faction";

static NSString *const qkSeelie = @"seelielegacy";
static NSString *const qkUnseelie = @"unseelielegacy";
static NSString *const qkKith = @"kith";
static NSString *const qkSeeming = @"seeming";
static NSString *const qkCourt = @"court";
static NSString *const qkHouse = @"house";
static NSString *const qkThreshold = @"threshold";
static NSString *const qkGlamour = @"glamour";
static NSString *const qkTempGlamour = @"tempglamour";
static NSString *const qkBanality = @"banality";
static NSString *const qkTempBanality = @"tempbanality";
static NSString *const qkArts = @"arts";
static NSString *const qkRealms = @"realms";
static NSString *const qkOaths = @"oaths";

static NSString *const qkTribe = @"tribe";
static NSString *const qkFera = @"fera";
static NSString *const qkBreed = @"breed";
static NSString *const qkAuspice = @"auspice";
static NSString *const qkPack = @"pack";
static NSString *const qkCamp = @"camp";
static NSString *const qkPosition = @"position";
static NSString *const qkNotoriety = @"notoriety";
static NSString *const qkTotem = @"totem";
static NSString *const qkHonor = @"honor";
static NSString *const qkGlory = @"glory";
static NSString *const qkWisdom = @"wisdom";
static NSString *const qkTempHonor = @"temphonor";
static NSString *const qkTempGlory = @"tempglory";
static NSString *const qkTempWisdom = @"tempwisdom";
static NSString *const qkRage = @"rage";
static NSString *const qkTempRage = @"temprage";
static NSString *const qkGnosis = @"gnosis";
static NSString *const qkTempGnosis = @"tempgnosis";
static NSString *const qkFeatures = @"features";
static NSString *const qkGifts = @"gifts";
static NSString *const qkHonorTraits = @"honortraits";
static NSString *const qkGloryTraits = @"glorytraits";
static NSString *const qkWisdomTraits = @"wisdomtraits";

static NSString *const qkDharma = @"dharma";
static NSString *const qkKJBalance = @"kjbalance";
static NSString *const qkDirection = @"direction";
static NSString *const qkStation = @"station";
static NSString *const qkPoArchetype = @"poarchetype";
static NSString *const qkHun = @"hun";
static NSString *const qkTempHun = @"temphun";
static NSString *const qkPo = @"po";
static NSString *const qkTempPo = @"temppo";
static NSString *const qkYin = @"yin";
static NSString *const qkTempYin = @"tempyin";
static NSString *const qkYang = @"yang";
static NSString *const qkTempYang = @"tempyang";
static NSString *const qkDemonChi = @"demonchi";
static NSString *const qkTempDemonChi = @"tempdemonchi";
static NSString *const qkGuanxi = @"guanxi";

static NSString *const qkEssence = @"essence";
static NSString *const qkTradition = @"tradition";
static NSString *const qkCabal = @"cabal";
static NSString *const qkArete = @"arete";
static NSString *const qkTempArete = @"temparete";
static NSString *const qkQuintessence = @"quintessence";
static NSString *const qkTempQuintessence = @"tempquintessence";
static NSString *const qkParadox = @"paradox";
static NSString *const qkTempParadox = @"tempparadox";
static NSString *const qkSpheres = @"spheres";
static NSString *const qkResonance = @"resonance";
static NSString *const qkReputation = @"reputation";
static NSString *const qkRotes = @"rotes";
static NSString *const qkFoci = @"foci";

static NSString *const qkMotivation = @"motivation";
static NSString *const qkRegnant = @"regnant";
static NSString *const qkAssociation = @"association";
static NSString *const qkTrueFaith = @"truefaith";
static NSString *const qkTempTrueFaith = @"temptruefaith";

static NSString *const qkAmenti = @"amenti";
static NSString *const qkMemory = @"memory";
static NSString *const qkTempMemory = @"tempmemory";
static NSString *const qkIntegrity = @"integrity";
static NSString *const qkTempIntegrity = @"tempintegrity";
static NSString *const qkJoy = @"joy";
static NSString *const qkTempJoy = @"tempjoy";
static NSString *const qkBa = @"ba";
static NSString *const qkTempBa = @"tempba";
static NSString *const qkKa = @"ka";
static NSString *const qkTempKa = @"tempka";
static NSString *const qkSekhem = @"sekhem";
static NSString *const qkTempSekhem = @"tempsekhem";
static NSString *const qkMBalance = @"mbalance";
static NSString *const qkTempMBalance = @"tempmbalance";
static NSString *const qkHekau = @"hekau";
static NSString *const qkSpells = @"spells";
static NSString *const qkInheritance = @"inheritance";

static NSString *const qkClan = @"clan";
static NSString *const qkSect = @"sect";
static NSString *const qkCoterie = @"coterie";
static NSString *const qkSire = @"sire";
static NSString *const qkAura = @"aura";
static NSString *const qkAuraBonus = @"aurabonus";
static NSString *const qkGeneration = @"generation";
static NSString *const qkPath = @"path";
static NSString *const qkBonds = @"bonds";
static NSString *const qkMiscellaneous = @"miscellaneous";
static NSString *const qkBoons = @"boons";

static NSString *const qkClass = @"class";
static NSString *const qkSubclass = @"subclass";
static NSString *const qkAffinity = @"affinity";
static NSString *const qkPlane = @"plane";
static NSString *const qkBrood = @"brood";
static NSString *const qkTempers = @"tempers";

static NSString *const qkEthnos = @"ethnos";
static NSString *const qkGuild = @"guild";
static NSString *const qkLegion = @"legion";
static NSString *const qkPathos = @"pathos";
static NSString *const qkTempPathos = @"temppathos";
static NSString *const qkCorpus = @"corpus";
static NSString *const qkTempCorpus = @"tempcorpus";
static NSString *const qkArcanoi = @"arcanoi";
static NSString *const qkPassions = @"passions";
static NSString *const qkFetters = @"fetters";
static NSString *const qkLife = @"life";
static NSString *const qkDeath = @"death";
static NSString *const qkHaunt = @"haunt";
static NSString *const qkRegret = @"regret";
static NSString *const qkShadowArchetype = @"shadowarchetype";
static NSString *const qkShadowPlayer = @"shadowplayer";
static NSString *const qkAngst = @"angst";
static NSString *const qkTempAngst = @"tempangst";
static NSString *const qkDarkPassions = @"darkpassions";
static NSString *const qkThorns = @"thorns";

static NSString *const qkType = @"type";
static NSString *const qkSubtype = @"subtype";
static NSString *const qkLevel = @"level";
static NSString *const qkConcealability = @"conceal";
static NSString *const qkAvailability = @"availability";
static NSString *const qkNegatives = @"negatives";
static NSString *const qkDamageType = @"damagetype";
static NSString *const qkDamageAmount = @"damageamount";
static NSString *const qkBonus = @"bonus";
static NSString *const qkAppearance = @"appearance";

static NSString *const qkDescription = @"description";
static NSString *const qkGrades = @"grades";
static NSString *const qkDuration = @"duration";

static NSString *const qkOwner = @"owner";
static NSString *const qkWhere = @"where";
static NSString *const qkAccess = @"access";
static NSString *const qkLinks = @"links";
static NSString *const qkSecurity = @"security";
static NSString *const qkSecTraits = @"securitytraits";
static NSString *const qkSecRetests = @"securityretests";
static NSString *const qkGauntlet = @"gauntlet";
static NSString *const qkUmbra = @"umbra";

static NSString *const qkCreed = @"creed";
static NSString *const qkHandle = @"handle";
static NSString *const qkConviction = @"conviction";
static NSString *const qkTempConviction = @"tempconviction";
static NSString *const qkMercy = @"mercy";
static NSString *const qkTempMercy = @"tempmercy";
static NSString *const qkVision = @"vision";
static NSString *const qkTempVision = @"tempvision";
static NSString *const qkZeal = @"zeal";
static NSString *const qkTempZeal = @"tempzeal";
static NSString *const qkEdges = @"edges";

static NSString *const qkTorment = @"torment";
static NSString *const qkTempTorment = @"temptorment";
static NSString *const qkFaith = @"faith";
static NSString *const qkTempFaith = @"tempfaith";
static NSString *const qkLores = @"lores";
static NSString *const qkVisage = @"apocalypticform";

static NSString *const qkCount = @"count";
static NSString *const qkNote = @"note";
static NSString *const qkHistory = @"history";
static NSString *const qkDate = @"date";
static NSString *const qkChange = @"change";
static NSString *const qkChangeText = @"changetext";
static NSString *const qkReason = @"reason";
static NSString *const qkUnspent = @"unspent";
static NSString *const qkEarned = @"earned";
static NSString *const qkValue = @"value";
static NSString *const qkAction = @"action";
static NSString *const qkTotal = @"total";
static NSString *const qkUnused = @"unused";
static NSString *const qkGrowth = @"growth";
static NSString *const qkResult = @"result";
static NSString *const qkEndDate = @"enddate";
static NSString *const qkOutline = @"outline";
static NSString *const qkKeyCharacters = @"keycharacters";
static NSString *const qkDevDate = @"devdate";
static NSString *const qkDevelopment = @"development";
static NSString *const qkRumor = @"rumor";

static NSString *const qkWebSite = @"website";
static NSString *const qkUsualPlace = @"usualplace";
static NSString *const qkUsualTime = @"usualtime";
static NSString *const qkPlace = @"place";
static NSString *const qkTime = @"time";
static NSString *const qkNextGame = @"nextgame";
static NSString *const qkNextPlace = @"nextplace";
static NSString *const qkNextTime = @"nexttime";
static NSString *const qkNextNotes = @"nextnotes";

static NSString *const qkOwed = @"owed";
static NSString *const qkPartner = @"partner";

static NSString *const qkDefault = @"";

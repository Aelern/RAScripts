// Centipede
// #ID = 25682
//This was my introduction to RAScripts and I may have chosen weird ways to do things. Big thing
//was

// $001A59: [8-bit] Classic Mode Is 0x12 when playing classic mode and 0x00 otherwise
function InClassicMode() => byte(0x001A59)

// $024360: [8-bit] Goes from 01 to 00 in moments where the lives value gets lost
function StableValues() => byte(0x024360)

// $197ADC: [8-bit] Is game paused 0x00 is paused 0x01 is adventure mode gameplay unpaused. Flashes 0x00 at level clear
function IsUnpaused() => byte(0x197adc)

// $19A6A0: [32-bit] In level timer. Does not reset for death. Maintains value while game paused. Resets at end of level. Increments by one per frame. Starts at 0x04 once level starts, on some levels jumps up from 0x04 by more than 1. Game runs at 30 frames per second
function LevelTimer() => dword(0x19a6a0)

// $19AB68: [Bitflags] Reads input. All values 1 when unpressed, 0 when pressed.
//      Bit 1 = A Button
//      Bit 2 = B Button
function ABButtons() => byte(0x19ab68)

function ABButtonsAddress() => 0x19ab68

// $19AB69: [Bitflags] Reads input. All values 1 when unpressed, 0 when pressed.
//      Bit 1 = X Button
//      Bit 2 = Y Button
function XYButtons() => byte(0x19ab69)

function XYButtonsAddress() => 0x19ab69

// $19AB6A: [8-bit] Reads R Button analog trigger. 0x00 normally, 0xff when fully depressed
function RightTrigger() => byte(0x19ab6a)

// $19AB6B: [8-bit] Reads L Button analog trigger. 0x00 normally, 0xff when fully depressed
function LeftTrigger() => byte(0x19ab6b)

// $19AB6C: [8-bit] Reads control stick X-axis
//      0x00 is full left
//      0x80 is neutral
//      0xff is full right
function ControlStickX() => byte(0x19ab6c)

// $19AB6D: [8-bit] Reads control stick Y-axis
//      0x00 is full up
//      0x80 is neutral
//      0xff is full down
//      Seems any value below 0x80 is enough to trigger extra lives cheat (with L, R, A, B, X, Y)
function ControlStickY() => byte(0x19ab6d)

// $1CB67C: [24-bit] Pointer to In level statuses
//      +148 For active power up. 0x00 = Normal, 0x10 = Double shot, 0x11 = Triple shot, 0x14 = Air shot 0x16 = Rapid shot, 0x17 = Side shot, 0x18 = Ground skimmer, 0x1a = Spread shot, 0x1b = Super Triple Shot
//      +1b0 For current true score
//      +1e8 For current lives (+1 higher than displayed score)See also: 0x243b0c, 0x26097c, 0x29cf24
function LevelDataPointer() => tbyte(0x1cb67c)

// $1CB96D: [8-bit] Difficulty Candidate A
//          0x00 = Easy, 0x80 = Normal, 0x01 = Difficult
function DifficultyA() => byte(0x1CB96D)

// $1D5C78: [8-bit] Goes from 0x00 to 0x01 in level clear screen. Reverts when scoring phase over
function LevelClear() => byte(0x1D5C78)

// $20B234: [8-bit] Goes from 0x01 to 0x00 in level clear screen / cutscene. Flips back at level start. Likely exists to be 0x01 during level play.
function InLevel() => byte(0x20B234)

// $246BF4: [8-bit] Difficulty Candidate B
//          0x70 = Easy, 0x10 = Normal, 0x8f = Difficult
function DifficultyB() => byte(0x246BF4)

// $247A38: [8-bit] In Adventure Mode check. 0x01 when an Adventure Mode level is loaded, 0x00 otherwise
function InAdventure() => byte(0x247A38)

// $247A3C: [32-bit] Displayed Score. On gaining score counts up until it reaches the true score. If playing level for the first time shows the cumulative score. On repeat playthrough shows just the levels score
function CurrentScore() => dword(0x247A3C)

// $247AD0: [8-bit] Camera setting. 0x00 = Normal, 0x01 = Back view, 0x02 = First person, 0x03 = Over the shoulder
function CameraStyle() => byte(0x247AD0)

// $247C40: [8-bit] Is 0x01 when death animation playing. 0x00 otherwise
function IsDying() => byte(0x247c40)

// $24836C: [32-bit] High Score 1-1. Part of an array of level high score data. The 8-bit value following this is the net lives gained/lost on high score. Objectives met and possible are beyond that. Each value is offset from the previous level's by a value of 0x4c
function RecordedHighScoreBase() => dword(0x24836c)

function RecordedHighScoreBaseAddress() => 0x24836c

function RecordedHighScoreFinalAddress() => 0x248d38

// $248370: [32-bit] Net lives gained in 1-1 on high score run. Added to starting lives on following levels. Game starts with 4 lives on all difficulties. Future level net lives offset from the previous in table by 0x4c
function RecordedLivesBaseAddress() => 0x248370

// $248DC0: [8-bit] Furthest unlocked level. Starts counting at 0x01 and increments
function LevelsUnlocked() => byte(0x248DC0)

// $248DE4: [8-bit] Level Objective Tracker: Wee citizens
function WeeCitizenCount() => byte(0x248DE4)

// $248DE5: [8-bit] Level Objective Max: Wee citizens
//          Increments when objectives spawn
function WeeCitizenTotal() => byte(0x248DE5)

// $248DE6: [8-bit] Level Objective Tracker: Weedom houses
function WeeHouseCount() => byte(0x248DE6)

// $248DE7: [8-bit] Level Objective Max: Weedom houses
//          Increments when objectives spawn
function WeeHouseTotal() => byte(0x248DE7)

// $248DE8: [8-bit] Level Objective Tracker: Star crystals
function CrystalCount() => byte(0x248DE8)

// $248DE9: [8-bit] Level Objective Max: Star crystals
//          Increments when objectives spawn
function CrystalTotal() => byte(0x248DE9)

// $248DEA: [8-bit] Level Objective Tracker: Wee druids
function DruidCount() => byte(0x248DEA)

// $248DEB: [8-bit] Level Objective Max: Wee druids
//          Increments when objectives spawn
function DruidTotal() => byte(0x248DEB)

// $248DEC: [8-bit] Level Objective Tracker: Frostonia buildings
function FrostHouseCount() => byte(0x248DEC)

// $248DED: [8-bit] Level Objective Max: Frostonia buildings
//          Increments when objectives spawn
function FrostHouseTotal() => byte(0x248DED)

// $248DEE: [8-bit] Level Objective Tracker: Frostonia Hero statues
function FrostHeroCount() => byte(0x248DEE)

// $248DEF: [8-bit] Level Objective Max: Frostonia Hero statues
//          Increments when objectives spawn
function FrostHeroTotal() => byte(0x248DEF)

// $248DF0: [8-bit] Level Objective Tracker: Talismans
function TalisCount() => byte(0x248DF0)

// $248DF1: [8-bit] Level Objective Max: Talismans
//          Increments when objectives spawn
function TalisTotal() => byte(0x248DF1)

// $248DF2: [8-bit] Level Objective Tracker: Wee miners
function MinerCount() => byte(0x248DF2)

// $248DF3: [8-bit] Level Objective Max: Wee miners
//          Increments when objectives spawn
function MinerTotal() => byte(0x248DF3)

// $248DF4: [8-bit] Level Objective Tracker: Miner dwellings
function DwellingCount() => byte(0x248DF4)

// $248DF5: [8-bit] Level Objective Max: Miner dwellings
//          Increments when objectives spawn
function DwellingTotal() => byte(0x248DF5)

// $248DF6: [8-bit] Level Objective Tracker: Mining equipment
function MineEquipCount() => byte(0x248DF6)

// $248DF7: [8-bit] Level Objective Max: Mining equipment
//          Increments when objectives spawn
function MineEquipTotal() => byte(0x248DF7)

// $248DF8: [8-bit] Level Objective Tracker: Mine carts
function CartCount() => byte(0x248DF8)

// $248DF9: [8-bit] Level Objective Max: Mine carts
//          Increments when objectives spawn
function CartTotal() => byte(0x248DF9)

// $248DFA: [8-bit] Level Objective Tracker: Extracted star crystals
function ExtractCount() => byte(0x248DFA)

// $248DFB: [8-bit] Level Objective Max: Extracted star crystals
//          Increments when objectives spawn
function ExtractTotal() => byte(0x248DFB)

// $248DFC: [8-bit] Level Objective Tracker: Enigma Hero Statues
function EnigmaHeroCount() => byte(0x248DFC)

// $248DFD: [8-bit] Level Objective Max: Enigma Hero statues
//          Increments when objectives spawn
function EnigmaHeroTotal() => byte(0x248DFD)

// $248DFE: [8-bit] Level Objective Tracker: Mystical disruptors
function DisruptCount() => byte(0x248DFE)

// $248DFF: [8-bit] Level Objective Max: Mystical disruptors
//          Increments when objectives spawn
function DisruptTotal() => byte(0x248DFF)

// $248E00: [8-bit] Level Objective Tracker: Wee jails
function JailCount() => byte(0x248E00)

// $248E01: [8-bit] Level Objective Max: Wee jails
//          Increments when objectives spawn
function JailTotal() => byte(0x248E01)

// $248E02: [8-bit] Level Objective Tracker: Wee prisoners
function PrisonerCount() => byte(0x248E02)

// $248E03: [8-bit] Level Objective Max: Wee prisoners
//          Increments when objectives spawn
function PrisonerTotal() => byte(0x248E03)

// $248E04: [8-bit] Level Objective Tracker: Aridia buildings
function AridHouseCount() => byte(0x248E04)

// $248E05: [8-bit] Level Objective Max: Aridia buildings
//          Increments when objectives spawn
function AridHouseTotal() => byte(0x248E05)

// $248E06: [8-bit] Level Objective Tracker: Wise wees
function WiseCount() => byte(0x248E06)

// $248E07: [8-bit] Level Objective Max: Wise wees
//          Increments when objectives spawn
function WiseTotal() => byte(0x248E07)

// $248E08: [8-bit] Level Objective Tracker: Kaikoura Plants
function KaikouraCount() => byte(0x248E08)

// $248E09: [8-bit] Level Objective Max: Kaikoura plants
//          Increments when objectives spawn
function KaikouraTotal() => byte(0x248E09)

// $248E0A: [8-bit] Level Objective Tracker: Crystal foci
function FociCount() => byte(0x248E0A)

// $248E0B: [8-bit] Level Objective Max: Crystal foci
//          Increments when objectives spawn
function FociTotal() => byte(0x248E0B)

// $2496D0: [8-bit] Last entered level, starting from 1-1 as 0x00 and incrementing. Unaffected by demo mode
function LevelID() => byte(0x2496D0)

// $29CBE8: [32-bit] Current lives. Unstable at times, seemingly related to when there's a lot going on. I have yet to figure out a way around it. See also 0x29ce40
function Lives() => dword(0x29cbe8)

// 0x29CE40: [32-bit] Current lives. Unstable at times, seemingly related to when there's a lot going on. I have yet to figure out a way around it. See also 0x29cbe8
function LivesAlt() => dword(0x29CE40)

// $29CD8A: [8-bit] Start screen tracker. May take values on menus, 0x00 in gameplay though
//          0x00 = Press Start
//          0x03 = Eclipse cutscene
//          0x06 = Hall of Champions
//          0x29 = Demo Mode
function StartScreen() => byte(0x29CD8A)

// $29CF24: [24-bit] Pointer to In level statuses (Unstable)
//          +148 For active power up. 0x00 = Normal, 0x10 = Double shot, 0x11 = Triple shot, 0x14 = Air shot 0x16 = Rapid shot, 0x1a = Spread shot
//          +1b0 For current true score
function InLevelPointer() => tbyte(0x29cf24)

// $29CF9C: [8-bit] Game paused. 0x00 = No, 0x01 = Yes. Unstable
function IsPaused() => byte(0x29CF9C)

// $29D640: [24-bit] Pointer to Classic Mode
//          +285a High Score ones place (BCD)
//          +285b High Score hundreds place (BCD)
//          +285c High Score ten thousands place (BCD)
//          +28de On press start screen (0xff on screen, 0x00 in game)
//          +28fd Extra lives
//          +2900 1P Score ones place (Binary Coded Decimal)
//          +2901 2P Score ones place (BCD)
//          +2902 1P Score hundreds place (BCD)
//          +2903 2P Score hundreds place (BCD)
//          +2904 1P Score ten thousands place (BCD)
//          +2905 2P Score ten thousands place (BCD)
//          +3058 Difficulty level 0x5c = Easy, 0x54 = Medium, 0x14 = Hard
function ClassicPointer() => tbyte(0x29D640)

function TrueScore() => dword(InLevelPointer() + 0x1b0)
function StableLives() => dword(LevelDataPointer() + 0x1e8)
function PrevTrueScore() => dword(prev(InLevelPointer() + 0x1b0))
function BeatQueenPede() => prev(InLevel()) == 0x01 && InLevel() == 0x00 && LevelID() == 0x22 && LevelTimer() > 0x04 && InAdventure() == 0x01
function ClassicScore() => bcd(byte(ClassicPointer() + 0x2900)) + 100 * bcd(byte(ClassicPointer() + 0x2902)) + 10000 * bcd(byte(ClassicPointer() + 0x2904))
function ClassicScore2P() => bcd(byte(ClassicPointer() + 0x2901)) + 100 * bcd(byte(ClassicPointer() + 0x2903)) + 10000 * bcd(byte(ClassicPointer() + 0x2905))
function ClassicStartScreen() => byte(ClassicPointer() + 0x28de)
function ClassicDifficulty() => byte(ClassicPointer() + 0x3058)
function LivesStable(){
    return prev(StableValues()) == StableValues() && StableValues() == 0x01
}

function LivesCheatEntered() {
    return bit1(ABButtonsAddress()) == 0x00 && bit2(ABButtonsAddress()) == 0x00 && bit1(XYButtonsAddress()) == 0x00 && bit2(XYButtonsAddress()) == 0x00 && RightTrigger() > 0 && LeftTrigger() > 0 && ControlStickY() < 0x80
}


levelData = [["1-1", "The Firth of Fifth", ["Wee Citizen", "Wee House"]],
    ["1-2", "The Crack of Doom", ["Wee Citizen"]],
    ["1-3", "Four Score", ["Wee Citizen", "Wee House"]],
    ["1-4", "City of Wall", ["Wee Citizen", "Wee House"]],
    ["1-5", "Ant May", ["Star Crystal", "Druid"]],
    ["2-1", "One by Sea", ["Wise Wee", "Aridia House"]],
    ["2-2", "Sands Across the Water", ["Wise Wee", "Aridia House", "Kaikoura"]],
    ["2-3", "Cistern, Cistern", ["Aridia House", "Kaikoura"]],
    ["2-4", "Down in the Valley", ["Wise Wee", "Aridia House", "Kaikoura"]],
    ["2-5", "Crater of Creation", ["Druid", "Crystal Foci"]],
    ["2-6", "Out of Bounds", ["Wise Wee"]],
    ["3-1", "Trapped Under Ice", ["Druid", "Frostonia House", "Talisman"]],
    ["3-2", "A Glacier Runs Through It", ["Star Crystal", "Druid"]],
    ["3-3", "Iceberg Let Us", ["Star Crystal", "Druid", "Frostonia House"]],
    ["3-4", "Celtic Frost", ["Star Crystal", "Druid"]],
    ["3-5", "Motel of Lost Champions", ["Frostonia Hero", "Talisman"]],
    ["3-6", "Huckleberry Fiend", ["Star Crystal", "Talisman"]],
    ["4-1", "Jump in the Fire", ["Miner", "Dwelling", "Equipment"]],
    ["4-2", "A Bridge Over Molten Magma", ["Miner", "Equipment", "Mine Cart"]],
    ["4-3", "Schmokenden", ["Miner", "Mine Cart", "Extract"]],
    ["4-4", "Furnace of Fools", ["Miner", "Equipment", "Extract"]],
    ["4-5", "But It's a Dry Heat", ["Equipment", "Mine Cart"]],
    ["4-6", "Born of Fire", ["Miner"]],
    ["5-1", "A Head for All Seasons", ["Talisman", "Enigma Hero", "Disruptor"]],
    ["5-2", "A Hand Out Not a Hand Up", ["Talisman", "Enigma Hero", "Disruptor"]],
    ["5-3", "Show Me the Karma", ["Talisman", "Enigma Hero", "Disruptor"]],
    ["5-4", "Go Figure", ["Talisman", "Enigma Hero", "Disruptor"]],
    ["5-5", "The Slope's on You", ["Talisman", "Enigma Hero", "Disruptor"]],
    ["5-6", "Logg A Rhythmic", ["Disruptor"]],
    ["6-1", "A Hero's Reckoning", ["Talisman", "Prisoner"]],
    ["6-2", "This Mad Machinery", ["Talisman", "Prisoner"]],
    ["6-3", "Curiosity Caught the Wee", ["Talisman", "Jail", "Prisoner"]],
    ["6-4", "Things Crawl in the Darkness", ["Talisman", "Jail", "Prisoner"]],
    ["6-5", "Your Back's Against No Wall", ["Talisman", "Prisoner"]],
    ["6-6", "Her Dread Power the Queen Pede", []]]

function EndOfLevel() => prev(LevelClear()) == 0x00 && LevelClear() == 0x01 && InAdventure() == 0x01
function EndOfScoring() => prev(LevelClear()) == 0x01 && LevelClear() == 0x00 && InAdventure() == 0x01

function OnHard() => DifficultyA() == 0x01 && DifficultyB() == 0x8f

function ObjectiveMet(task)
{
    if task == "Wee Citizen"
        return WeeCitizenCount() == WeeCitizenTotal()
    else if task == "Wee House"
        return WeeHouseCount() == WeeHouseTotal()
    else if task == "Star Crystal"
        return CrystalCount() == CrystalTotal()
    else if task == "Druid"
        return DruidCount() == DruidTotal()
    else if task == "Frostonia House"
        return FrostHouseCount() == FrostHouseTotal()
    else if task == "Frostonia Hero"
        return FrostHeroCount() == FrostHeroTotal()
    else if task == "Talisman"
        return TalisCount() == TalisTotal()
    else if task == "Miner"
        return MinerCount() == MinerTotal()
    else if task == "Dwelling"
        return DwellingCount() == DwellingTotal()
    else if task == "Equipment"
        return MineEquipCount() == MineEquipTotal()
    else if task == "Mine Cart"
        return CartCount() == CartTotal()
    else if task == "Extract"
        return ExtractCount() == ExtractTotal()
    else if task == "Enigma Hero"
        return EnigmaHeroCount() == EnigmaHeroTotal()
    else if task == "Disruptor"
        return DisruptCount() == DisruptTotal()
    else if task == "Jail"
        return JailCount() == JailTotal()
    else if task == "Prisoner"
        return PrisonerCount() == PrisonerTotal()
    else if task == "Aridia House"
        return AridHouseCount() == AridHouseTotal()
    else if task == "Wise Wee"
        return WiseCount() == WiseTotal()
    else if task == "Kaikoura"
        return KaikouraCount() == KaikouraTotal()
    else if task == "Crystal Foci"
        return FociCount() == FociTotal()
}

function CheckObjectives(objectives) {
    status = true
    for i in objectives {
        status = status && ObjectiveMet(i)
    }
    return status
}

function AllObjectives(levelNum, levelName, levelID, objectives) {
    achievement(
        title = "Perfect " + levelNum + " [" + levelName + "]",
        description = "Beat " + levelName + " on Hard with all objectives fulfilled",
        points = 10,
        trigger = LevelID() == levelID && EndOfLevel() && OnHard() && CheckObjectives(objectives)
    )
}

function LevelStart() {
    return InAdventure() == 0x01 && prev(LevelTimer()) <= 0x04 && LevelTimer() > 0x04
}

function LevelCleared() {
    return prev(LevelClear()) == 0x00 && LevelClear() == 0x01
}

function LevelInterrupted() {
    return InAdventure() != 0x01 || LevelTime() == 0x00 || prev(LevelID()) != LevelID()
}

function LifeLost() {
    return prev(IsDying()) == 0x01 && IsDying() == 0x00 && InAdventure() == 0x01
}

function HighScoreSum() {
    totalScore = 0x00
    for i in range(RecordedHighScoreBaseAddress(), RecordedHighScoreFinalAddress(), 0x4c) {
        totalScore = totalScore + dword(i)
    }
    return totalScore
}

function Speedrun(levelNum, seconds){
    frames = seconds * 0x1e
    achievement(
        title = "Speedrun " + levelData[levelNum][0] + " [" + levelData[levelNum][1] + "]",
        description = "Beat " + levelData[levelNum][1] + " within " + seconds + " seconds",
        points = 10,
        trigger = LevelID() == levelNum && InAdventure() == 0x01 && trigger_when(EndOfLevel()) && LevelTimer() <= frames
    )    
}

function LevelStartCheckpoint(levelNum) => once(prev(LevelTimer()) <= 0x04 && LevelTimer() > 0x04 && LevelID() == levelNum && InAdventure() == 0x01 && InLevel() == 0x01) && 
        never(LevelTimer() >= 0x04 && prev(LevelID()) != LevelID() && prev(InAdventure()) != InAdventure())

function LifeCountingLogic(lifeTarget){
    return tally(lifeTarget, LivesStable() && prev(Lives()) < Lives(), LivesStable() && prev(Lives()) + 1 < Lives(), LivesStable() && prev(Lives()) + 2 < Lives(),
            deduct(LivesStable() && LifeLost()), deduct(LivesStable() && prev(Lives())+32 == Lives()), deduct(LivesStable() && prev(Lives())+32 == Lives()), deduct(LivesStable() && prev(Lives())+32 == Lives()))
}

function GetStartingScore(levelNum){
    startingScore = 0
    if (levelNum > 0) {
        for i in range(0, levelNum - 1) {
            startingScore = startingScore + dword(RecordedHighScoreBaseAddress() + (0x4c * i))
        }
    }
    return startingScore
}

function GetStartingLives(levelNum){
    startingLives = 4
    if (levelNum > 0) {
        for i in range(0, levelNum - 1) {
            startingLives = startingLives + dword(RecordedLivesBaseAddress() + (0x4c * i))
        }
    }
    return startingLives
}

function LevelClearLivesStable(){
    return Lives() == LivesAlt() && LevelClear() == 0x01 && IsUnpaused() == 0x01
}

function LivesChallenge(levelNum, lifeTarget){
    achievement(
        title = levelData[levelNum][0] + " Lives Challenge [" + levelData[levelNum][1] + "]",
        description = "Beat " + levelData[levelNum][1] + " with a net increase of " + lifeTarget + " or more lives. (Not counting bonus points)",
        points = 10,
        trigger = LevelStartCheckpoint(levelNum) &&
            //unless(IsUnpaused() == 0x00 && LevelClear() == 0x00) &&
            never(LivesCheatEntered()) &&
            never(LevelTimer() <= 0x04) && 
            LevelID() == levelNum && InAdventure() == 0x01 &&
            StableLives() >= GetStartingLives(levelNum) + lifeTarget + 1 &&
            trigger_when(EndOfLevel())
    )
}

function AllLevelsScored() {
    logic = always_true()
    for i in range(0, 0x21) {
        logic = logic && dword(RecordedHighScoreBaseAddress() + 0x4c * i) > 0
    }
    return logic
}

achievement(
    title = "Test", points = 0,
    description = "Dummy achievement for testing various things",
    trigger = prev(dword(LevelDataPointer() + 0)) + 1 == dword(LevelDataPointer() + 0)
)

achievement(
    title = "Beat Weedom [Wee Are Number One]", points = 5,
    description = "Complete the last level of Weedom and unlock Aridia",
    trigger = LevelsUnlocked() == 0x05 && LevelID() == 0x04 && prev(LevelClear()) == 0x00 && LevelClear() == 0x01 &&
              InAdventure() == 0x01
)

achievement(
    title = "Beat Aridia", points = 5,
    description = "Complete the last level of Aridia and unlock Frostonia",
    trigger = LevelsUnlocked() == 0x0B && LevelID() == 0x0A && prev(LevelClear()) == 0x00 && LevelClear() == 0x01 &&
              InAdventure() == 0x01
)

achievement(
    title = "Beat Frostonia [Wally Mammoth]", points = 5,
    description = "Complete the last level of Frostonia and unlock Infernium",
    trigger = LevelsUnlocked() == 0x11 && LevelID() == 0x10 && prev(LevelClear()) == 0x00 && LevelClear() == 0x01 &&
              InAdventure() == 0x01
)

achievement(
    title = "Beat Infernium", points = 5,
    description = "Complete the last level of Infernium and unlock Enigma",
    trigger = LevelsUnlocked() == 0x17 && LevelID() == 0x16 && prev(LevelClear()) == 0x00 && LevelClear() == 0x01 &&
              InAdventure() == 0x01
)

achievement(
    title = "Beat Enigma", points = 5,
    description = "Complete the last level of Enigma and unlock Evile",
    trigger = LevelsUnlocked() == 0x1D && LevelID() == 0x1C && prev(LevelClear()) == 0x00 && LevelClear() == 0x01 &&
              InAdventure() == 0x01
)

achievement(
    title = "Beat Evile [Centennial Savior]", points = 10,
    description = "Destroy Queen Pede and end the centipede invasion",
    trigger = LevelsUnlocked() == 0x23 && LevelID() == 0x22 && prev(InLevel()) == 0x01 && InLevel() == 0x00 && InAdventure() == 0x01 && AllLevelsScored()
)

for i in range(0x00, 0x21){
    AllObjectives(levelData[i][0], levelData[i][1], i, levelData[i][2])
}
achievement(
    title = "Perfect " + levelData[0x22][0] + " [" + levelData[0x22][1] + "]",
    description = "Beat " + levelData[0x22][1] + " on Hard with all objectives fulfilled",
    points = 10,
    trigger = BeatQueenPede() && OnHard() && CheckObjectives(levelData[0x22][2])
)

LivesChallenge(0x01, 6)
Speedrun(0x03, 210)
LivesChallenge(0x07, 4)
Speedrun(0x0a, 145)
LivesChallenge(0x0c, 6)
Speedrun(0x0d, 210)
LivesChallenge(0x12, 8)
Speedrun(0x15, 180)
LivesChallenge(0x18, 6)
Speedrun(0x1a, 165)
Speedrun(0x21, 225)
EvileLifeChallengeCount = 10

achievement(
    title = levelData[0x22][0] + " Lives Challenge [" + levelData[0x22][1] + "]",
    description = "Beat " + levelData[0x22][1] + " with a net increase of " + EvileLifeChallengeCount + " or more lives. (Not counting bonus points)",
    points = 10,
    trigger = LevelStartCheckpoint(0x22) &&
        //unless(IsUnpaused() == 0x00 && InLevel() == 0x01) &&
        never(LivesCheatEntered()) &&
        never(LevelTimer() <= 0x04) && 
        LevelID() == 0x22 && InAdventure() == 0x01 &&
        StableLives() >= GetStartingLives(0x22) + EvileLifeChallengeCount + 1 &&
        trigger_when(BeatQueenPede())
)
    
achievement(
    title = "Be the Wee",
    points = 3,
    description = "Beat any level entirely within the first person camera mode. (Three seconds grace period at level start)",
    trigger = once(prev(LevelTimer()) <= 0x04 && LevelTimer() > 0x04 && InAdventure() == 0x01 && InLevel() == 0x01) && 
        never(LevelTimer() <= 0x04 && prev(LevelID()) != LevelID() && prev(InAdventure()) != InAdventure()) && 
        never(LevelTimer() > 0x5e && CameraStyle() != 0x02) && 
        trigger_when(EndOfLevel() || BeatQueenPede())
)

achievement(
    title = "Centipede Centurion",
    points = 5,
    description = "Earn a total high score of 1,000,000 points across all adventure mode levels",
    trigger = prev(HighScoreSum()) < 1000000 && HighScoreSum() >= 1000000 && InAdventure() == 0x01 && prev(LevelClear()) == 0x01 && LevelClear() == 0x00
)

achievement(
    title = "Classic Centipede Champion",
    points = 10,
    description = "Beat the high score of 16,543 points in classic Centipede",
    trigger = prev(InClassicMode()) == 0x012 && InClassicMode() == 0x012 && prev(ClassicStartScreen()) == 0x00 && ClassicStartScreen() == 0xff && (ClassicScore() > 16543 || ClassicScore2P() > 16543)
)

//  #####################################################################################################################################################################################################
//                                                                              LEADERBOARDS
//  #####################################################################################################################################################################################################

function LevelPointsLeaderboard(level){
    leaderboard(
        levelData[level][1] + " Score Attack",
        "Highest score achieved on " + levelData[level][1] + " without dying",
        LevelID() == level && LevelStart(),
        prev(LevelTimer()) > LevelTimer() || prev(LevelID()) != level,
        LifeLost() || EndOfScoring(),
        //I think this is what the logic actually is, but RATools doesn't like it. Fixing this in the editor 
        //never(prev(LevelsUnlocked()) != LevelsUnlocked()) && always_false() || measured(CurrentScore() - GetStartingScore(level)) || measured(CurrentScore(), when=LevelsUnlocked() > level+1),
        //max_of(never(prev(LevelsUnlocked()) != LevelsUnlocked()) && always_false(), measured(CurrentScore() - GetStartingScore(level)), measured(CurrentScore(), when=prev(LevelsUnlocked()) > level+1)),
        max_of(never(prev(LevelsUnlocked()) != LevelsUnlocked() || prev(LevelID()) != LevelID()) && always_false(), measured(CurrentScore(), when=prev(LevelsUnlocked()) > level+1), measured(CurrentScore() - GetStartingScore(level), when=prev(LevelsUnlocked()) == level+1)),
        //CurrentScore() - GetStartingScore(level), //Letting RATools generate the largest block of code I can to minimize my own editing
        format = "VALUE",
        lower_is_better = false
    )
}

function LevelSpeedrunLeaderboard(level){
    leaderboard(
        levelData[level][1] + " Speedrun",
        "Beat " + levelData[level][1] + " as fast as you can",
        LevelID() == level && InAdventure() == 0x01 && EndOfLevel(),
        always_false(),
        LevelID() == level && InAdventure() == 0x01 && EndOfLevel(),
        (LevelTimer() - 0x03) * 2,
        format = "FRAMES",
        lower_is_better = true
    )
}

for i in range (0x00, 0x21) {
    LevelPointsLeaderboard(i)
}

leaderboard(
    levelData[0x22][1] + " Score Attack",
    "Highest score achieved on " + levelData[0x22][1] + " without dying",
    LevelID() == 0x22 && LevelStart(),
    prev(LevelTimer()) > LevelTimer(),
    BeatQueenPede() || LifeLost(),
    CurrentScore() - GetStartingScore(0x22),
    format = "VALUE",
    lower_is_better = false
)

for i in range (0x00, 0x21) {
    LevelSpeedrunLeaderboard(i)
}

leaderboard(
    levelData[0x22][1] + " Speedrun",
    "Beat " + levelData[0x22][1] + " as fast as you can",
    BeatQueenPede(),
    always_false(),
    BeatQueenPede(),
    (LevelTimer() - 0x03) * 2,
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    "Full Game Speedrun",
    "Beat Queen Pede from a fresh file as fast as you can",
    LevelsUnlocked() == 0x01 && LevelID() == 0x00 && prev(LevelTimer() <= 0x04) && LevelTimer() > 0x04,
    prev(LevelsUnlocked()) != LevelsUnlocked() && prev(LevelsUnlocked()) + 1 != LevelsUnlocked() && prev(LevelID()) != LevelID() && prev(LevelID()) + 1 != LevelID(),
    BeatQueenPede() && AllLevelsScored(),
    measured(tally(0, LevelTimer() > 0x04 && prev(LevelTimer()) + 1 == LevelTimer() && InAdventure() == 0x01 && InLevel() == 0x01)),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    "Adventure Mode High Score",
    "Highest score across all Adventure Mode stages except final boss stage",
    LevelTimer() > 0x04 && InAdventure() == 0x01 && InLevel() == 0x00 && LevelClear() == 0x00,
    always_false(),
    //LevelTimer() == 0x00 && prev(LevelTimer()) > 0x00 && InAdventure() == 0x01 && InLevel() == 0x00 && LevelClear() == 0x00,
    LevelTimer() > 0x04 && InAdventure() == 0x01 && InLevel() == 0x00 && LevelClear() == 0x00,
    HighScoreSum(),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    "Classic Mode High Score (Easy)",
    "Highest score within Classic Mode on Easy",
    prev(InClassicMode()) == 0x12 && InClassicMode() == 0x12 && prev(ClassicStartScreen()) == 0x00 && ClassicStartScreen() == 0xff && ClassicDifficulty() == 0x5c,
    InClassicMode() != 0x12,
    prev(InClassicMode()) == 0x12 && InClassicMode() == 0x12 && prev(ClassicStartScreen()) == 0x00 && ClassicStartScreen() == 0xff && ClassicDifficulty() == 0x5c,
    max_of(ClassicScore(), ClassicScore2P()),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    "Classic Mode High Score (Medium)",
    "Highest score within Classic Mode on Medium",
    prev(InClassicMode()) == 0x12 && InClassicMode() == 0x12 && prev(ClassicStartScreen()) == 0x00 && ClassicStartScreen() == 0xff && ClassicDifficulty() == 0x54,
    InClassicMode() != 0x12,
    prev(InClassicMode()) == 0x12 && InClassicMode() == 0x12 && prev(ClassicStartScreen()) == 0x00 && ClassicStartScreen() == 0xff && ClassicDifficulty() == 0x54,
    max_of(ClassicScore(), ClassicScore2P()),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    "Classic Mode High Score (Hard)",
    "Highest score within Classic Mode on Hard",
    prev(InClassicMode()) == 0x12 && InClassicMode() == 0x12 && prev(ClassicStartScreen()) == 0x00 && ClassicStartScreen() == 0xff && ClassicDifficulty() == 0x14,
    InClassicMode() != 0x12,
    prev(InClassicMode()) == 0x12 && InClassicMode() == 0x12 && prev(ClassicStartScreen()) == 0x00 && ClassicStartScreen() == 0xff && ClassicDifficulty() == 0x14,
    max_of(ClassicScore(), ClassicScore2P()),
    format = "VALUE",
    lower_is_better = false
)

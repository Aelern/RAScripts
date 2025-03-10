// Croc 2
// #ID = 12943

// $C5B0: [8-bit] Which screen game is on
//      0x01 = Loading
//      0x02 = Gameplay
//      0x03 = Swap Meet Pete
//      0x08 = Intro animation
//      0x09 = Boss Defeated
//      0x0a = Options
//      0x0b = Continue?
//      0x0c = Password
//      0x0d = Opening logos
//      0x0e = Title screen
//      0x10 = Dante defeated
//      0x11 = Push start
//      0x14 = Credits
function GameScreen() => byte(0x00C5B0)

// $C645: [8-bit] Is game being played
//      0x00 = Title screen / Title menus / Credits
//      0x01 = Gameplay
function InGameplay() => byte(0x00C645)

// $C805: [8-bit] Flashes from 0x00 to 0x01 when Baron Dante 2 takes damage
function DanteDamaged() => byte(0x00C805)

// $C9E2: [8-bit] Inventory items
//        Bit4-8 = Robo Gobbo count
//        Bit3 = Robo Gobbo saved and available in shop
//        Bit2 = Jump Jelly
//        Bit0 = Tail of the Phoenix
function UsableItems() => byte(0x00C9E2)

// $C9E3: [Bitfield] Tracks level items collected
//        Bit7 = Level item, pouch left
//        Bit6 = Level item, pouch center
//        Bit5 = Level item, pouch right
//        Bit4 = Blue gem
//        Bit3 = Cyan gem
//        Bit2 = Red gem
//        Bit1 = Pink gem
//        Bit0 = Yellow gem
function LevelItems() => byte(0x00C9E3)

// $C9E5: [Bitfield[ Tracks Sailor Golden Gobbos
//        Bit7 = Treasures
//        Bit6 = Sandwich
//        Bit5 = Kidnapped Gobbo
function GoldenGobbosSailor() => byte(0x00C9E5)

// $C9E6: [Bitfield] Tracks Cossack Golden Gobbos
//        Bit7 = Snowman
//        Bit6 = Mine
//        Bit5 = Medicine
function GoldenGobbosCossack() => byte(0x00C9E6)

// $C9E7: [Bitfield] Tracks Caveman Golden Gobbos
//        Bit5 = Robo Gobbo
//        Bit6 = Lava
//        Bit7 = Water Pipe
function GoldenGobbosCaveman() => byte(0x00C9E7)

// $C9E8: [8-bit] Tracks Incan Golden Gobbos
//        Bit5 = Letter
//        Bit6 = Grandpa
//        Bit7 = Statue
function GoldenGobbosInca() => byte(0x00C9E8)

function GoldenGobbosBaseAddress() => 0x00C9E5

// $C9E9: [Bitfield] Levels completed
//        Bosses update on clear screen fade to white
//        Bit6 = Mad Scientist
//        Bit5 = Lava Monster
//        Bit4 = Soveena the Squid
//        Bit2 = Local Mission (Treasures / Medicine / Water pipe / Statue)
//        Bit1 = Local Mission (Sandwich / Mine / Rising lava / Grandpa)
//        Bit0 = Local Mission (Kidnap / Snowman / Robo Gobbo / Letter)
function LevelsComplete() => byte(0x00C9E9)

function SoveenaBeaten() => bit4(0x00C9E9)
function LavaMonsterBeaten() => bit5(0x00C9E9)
function MadScientistBeaten() => bit6(0x00C9E9)

// $C9EE: [8-bit] Health
function Health() => byte(0x00C9EE)

// $C9EF: [8-bit] Max hearts
function MaxHealth() => byte(0x00C9EF)

// $C9F0: [8-bit] Lives (Max = 0x0a)
function Lives() => byte(0x00C9F0)

// $C9F6: [8-bit] Number of stars. At twenty resets and grants extra life
function Stars() => byte(0x00C9F6)

// $CA78: [8-bit] Current world
//        0x00 = Sailor
//        0x01 = Cossack
//        0x02 = Caveman
//        0x03 = Incan
function World() => byte(0x00CA78)

// $CA7A: [8-bit] Current area
//        0 = Hub
//        1 = Level (Kidnap / Medicine / Robo Gobbo / Letter)
//        2 = Level (Sandwich / Mine / Rising lava / Grandpa)
//        3 = Level (Treasure / Snowman / Water pipe / Statue)
//        4 = Boss
function Area() => byte(0x00CA7A)

// $CA7D: [8-bit] Current room of level
function Room() => byte(0x00CA7D)

// $CA7E: [8-bit] Previous room
function PrevRoom() => byte(0x00CA7E)

// $CAB4: [8-bit] Jewel count (Max 100)
function Jewels() => byte(0x00CAB4)

// $CABC: [8-bit] Croc state effects (See also 0x00cabf)
//        Bit6 = Carrying object
//        Bit4 = Stomping
//        Bit3 = Helpless
//        Bit2 = Dashing
//        Bit1 = Jumping
//        Bit0 = Attacking
//        Some abilities are combinations of states.
//        Standing/Walking = 0x00
//        Tail Attack = 0x01 or 0x05 (while dashing)
//        Jump = 0x02
//        Dash = 0x04
//        Tumble jump = 0x07
//        Stomp = 0x12
//        Drop off ledge = 0x08
//        Fall = 0x0c
//        No effect as Robo Gobbo
function CrocState() => byte(0x00CABC)

// $CB1D: [8-bit] Baron Dante 1's HP
function DanteFirstHP() => byte(0x00CB1D)

// $CB24: [8-bit] Soveena / Lava Monster's HP
function RegBossHP() => byte(0x00CB24)

// $CF90: [8-bit] Game paused. 0 = No, 1 = Yes
function IsPaused() => byte(0x00CF90)

function DanteDefeated(){
    return once(never(prev(Lives()) > Lives() && World() == 3 && Area() == 4 && Room() == 1)) &&
        tally(5, prev(DanteDamaged() == 0), DanteDamaged() == 1, World() == 3, Area() == 4, Room() == 1)
        
}

function GameStarted(){
    return prev(InGameplay()) == 0 && InGamePlay() == 1 && World() == 0 && Area() == 0 && Room() == 0 && LevelsComplete() == 0
}

levelNames = [["kidnapped gobbo", "stolen sandwich", "missing treasures"],
    ["medicinal herb", "gobbo in the mines", "snowman"],
    ["save the robo gobbo", "rising lava", "water pipe"],
    ["letter delivery", "kidnapped grandpa gobbo", "missing statue piece"]]

villageNames = ["Sailor Village", "Cossack Village", "Caveman Village", "Inca Village"]

achievement(
    title = "Beat Sailor World",
    description = "Defeat Soveena the Squid to save Sailor Village",
    points = 0,
    trigger = prev(SoveenaBeaten() == 0) && SoveenaBeaten() == 1 && World() == 0,
    type = "progression"
)

achievement(
    title = "Beat Cossack World",
    description = "Defeat the Lava Monster to save Cossack Village",
    points = 0,
    trigger = prev(LavaMonsterBeaten() == 0) && LavaMonsterBeaten() == 1 && World() == 1,
    type = "progression"
)

achievement(
    title = "Beat Caveman World",
    description = "Defeat the Mad Scientist to save Caveman Village",
    points = 0,
    trigger = prev(MadScientistBeaten() == 0) && MadScientistBeaten() == 1 && World() == 2,
    type = "progression"
)

achievement(
    title = "Beat Incan World",
    description = "Defeat Baron Dante",
    points = 0,
    trigger = DanteDefeated(),
    type = "win_condition"
)

achievement(
    title = "True Ending",
    description = "Get the true ending by defeating Baron Dante after collecting all Golden Gobbos",
    points = 0,
    trigger = DanteDefeated() && GoldenGobbosSailor() == 0xe0 && GoldenGobbosCossack() == 0xe0 && GoldenGobbosCaveman() == 0xe0 && GoldenGobbosInca() == 0xe0
)

for i in range(0,3){
    for j in range(0,2){
        achievement(
            title = "Golden Gobbo " + villageNames[i] + " " + j+1,
            description = "Find the Golden Gobbo in the " + levelNames[i][j] + " mission in " + villageNames[i] + ".",
            points = 0,
            trigger = prev(bit(j+5, GoldenGobbosBaseAddress()+i)) == 0 && bit(j+5, GoldenGobbosBaseAddress()+i) == 1 && World() == i && Area() == j+1
        )
    }
}

achievement(
    title = "Max Health",
    description = "Get 8 maximum health",
    points = 0,
    trigger = prev(MaxHealth()) == 0x07 && MaxHealth() == 0x08
)

achievement(
    title = "Max Lives",
    description = "Reach 10 total lives",
    points = 0,
    trigger = prev(Lives() == 0x09) && Lives() == 0x0a
)

achievement(
    title = "Three Heart Run: Sailor World",
    description = "Defeat Soveena the Squid with only three max health",
    points = 0,
    trigger = prev(SoveenaBeaten() == 0) && SoveenaBeaten() == 1 && World() == 0 && MaxHealth() == 3
)

achievement(
    title = "Three Heart Run: Cossack World",
    description = "Defeat the Lava Monster with only three max health",
    points = 0,
    trigger = prev(LavaMonsterBeaten() == 0) && LavaMonsterBeaten() == 1 && World() == 1 && MaxHealth() == 3
)

achievement(
    title = "Three Heart Run: Caveman World",
    description = "Defeat the Mad Scientist with only three max health",
    points = 0,
    trigger = prev(MadScientistBeaten() == 0) && MadScientistBeaten() == 1 && World() == 2 && MaxHealth() == 3
)

achievement(
    title = "Three Heart Run: Incan World",
    description = "Defeat Baron Dante with only three max health",
    points = 0,
    trigger = DanteDefeated() && MaxHealth() == 3
)

AreaLookup = {
    0x00: "",
    0x01: "saving the kidnapped gobbo ",
    0x02: "seeking a stolen sandwich ",
    0x03: "finding stolen treasures ", 
    0x04: "Soveena the squid",
    0x05: "",
    0x06: "finding a medicinal herb ",
    0x07: "rescuing a gobbo from the mines ", 
    0x08: "repairing a wrecked snowman ",
    0x09: "the lava monster",
    0x0a: "",
    0x0b: "finding the stolen Robo Gobbo ",
    0x0c: "investigating the rising lava ", 
    0x0d: "repairing the water pipe ",
    0x0e: "the mad scientist",
    0x0f: "",
    0x10: "delivering a letter ",
    0x11: "rescuing a gobbo's grandpa ", 
    0x12: "finding the stolen statue piece ",
    0x13: "Baron Dante ",
}

WorldLookup = {
    0: "Sailor Village",
    1: "Cossack Village",
    2: "Caveman Village",
    3: "Inca Village"
}

PeteLookup = {
    2: "visiting",
    3: "at Swap Meet Pete's in"
}

function GemCount() => bit0(0x00C9E3) + bit1(0x00C9E3) + bit2(0x00C9E3) + bit3(0x00C9E3) + bit4(0x00C9E3)
function GoldenGobboCount() => bit5(0x00C9E5) + bit6(0x00C9E5) + bit7(0x00C9E5) +
    bit5(0x00C9E6) + bit6(0x00C9E6) + bit7(0x00C9E6) + 
    bit5(0x00C9E7) + bit6(0x00C9E7) + bit7(0x00C9E7) + 
    bit5(0x00C9E8) + bit6(0x00C9E8) + bit7(0x00C9E8)

rich_presence_conditional_display(GameScreen() == 0x08 || GameScreen() == 0x0a || GameScreen() == 0x0c || GameScreen() == 0x0d || GameScreen() == 0x0e || GameScreen() == 0x11, "On the main menu")
rich_presence_conditional_display(GameScreen() == 0x10 || (InGameplay() == 0 && GameScreen() != 0x11 && GameScreen() >= 0x10), "Croc saved the day!")
rich_presence_conditional_display(InGameplay() == 1 && Area() == 0, "Croc is {0} {1} ❤[{2}/{3}] 🐊[{4}] 🏆[{5}/12]", 
    rich_presence_lookup("Screen", GameScreen(), PeteLookup),
    rich_presence_lookup("World", World(), WorldLookup),
    rich_presence_value("Digit", Health()),
    rich_presence_value("Digit", MaxHealth()),
    rich_presence_value("Digit", Lives()),
    rich_presence_value("Digit", GoldenGobboCount())
)
rich_presence_conditional_display(InGameplay() == 1 && Area() == 4, "Croc is battling {0} ❤[{1}/{2}] 🐊[{3}] 🏆[{4}/12]", 
    rich_presence_lookup("Level", 5 * World() + Area(), AreaLookup),
    rich_presence_value("Digit", Health()),
    rich_presence_value("Digit", MaxHealth()),
    rich_presence_value("Digit", Lives()),
    rich_presence_value("Digit", GoldenGobboCount())
)
rich_presence_display("Croc is {0}at {1} ❤[{2}/{3}] 🐊[{4}] 💎[{5}/5] 🏆[{6}/12]",
    rich_presence_lookup("Level", 5 * World() + Area(), AreaLookup),
    rich_presence_lookup("World", World(), WorldLookup),
    rich_presence_value("Digit", Health()),
    rich_presence_value("Digit", MaxHealth()),
    rich_presence_value("Digit", Lives()),
    rich_presence_value("Digit", GemCount()),
    rich_presence_value("Digit", GoldenGobboCount())
)

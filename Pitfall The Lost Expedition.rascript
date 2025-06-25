// Pitfall: The Lost Expedition
// #ID = 30552
// #MinimumVersion=1.3.1

pointer_mask = 0x1fffffff


// $132CEF: [8-bit] Number of idols an Explorer Idol is worth
function ExplorerIdolReward() => byte(0x132CEE)

// $3D75E0: [32-bit BE] Aspect Ratio
function AspectRatio() => dword_be(0x3D75E0)

// $41A21C: [32-bit BE] Empty item pointer
function EmptyItemPointer() => dword_be(0x41A21C)

// $41A238: [32-bit BE] Sling pointer
function SlingPointer() => dword_be(0x41A238)

// $41A248: [32-bit BE] Sling unlocked
function Sling() => dword_be(0x41A248)

// $41A254: [32-bit BE] Torch pointer
function TorchPointer() => dword_be(0x41A254)

// $41A264: [32-bit BE] Torch unlocked
function Torch() => dword_be(0x41A264)

// $41A270: [32-bit BE] Pickaxes pointer
function PickaxePointer() => dword_be(0x41A270)

// $41A280: [32-bit BE] Pickaxes unlocked
function Pickaxe() => dword_be(0x41A280)

// $41A28C: [32-bit BE] TNT pointer
function TNTPointer() => dword_be(0x41A28C)

// $41A29C: [32-bit BE] TNT unlocked
function TNT() => dword_be(0x41A29C)

// $41A2A8: [32-bit BE] Shield pointer
function ShieldPointer() => dword_be(0x41A2A8)

// $41A2B8: [32-bit BE] Shield unlocked
function Shield() => dword_be(0x41A2B8)

// $41A2C4: [32-bit BE] Raft pointer
function RaftPointer() => dword_be(0x41A2C4)

// $41A2D4: [32-bit BE] Raft unlocked
function Raft() => dword_be(0x41A2D4)

// $41A2E0: [32-bit BE] Gas Mask pointer
function GasMaskPointer() => dword_be(0x41A2E0)

// $41A2F0: [32-bit BE] Gasmask unlocked
function GasMask() => dword_be(0x41A2F0)

// $41A2FC: [32-bit BE] Canteen Pointer
//          +0x5c for amount
//          +0x60 for capacity
function CanteenPointer() => dword_be(0x41A2FC) & pointer_mask
function CanteenContent() => dword_be(CanteenPointer() + 0x5c)
function CanteenCapacity() => dword_be(CanteenPointer() + 0x60)

// $41A30C: [32-bit BE] Canteen unlocked
function Canteen() => dword_be(0x41A30C)

// $41A318: [32-bit BE] Stink Bomb pointer
function StinkBombPointer() => dword_be(0x41A318) & pointer_mask

// $41A5CC: [32-bit BE] Connected to confirmable message prompts. Notably displays 0x43890000 into 0x439b8000 when unlocking Pitfall! from the shaman shop (before and after press A to confirm dialogue) and 0x43aa8000 into 0x43bc8000 when unlocking Pitfall 2. Maintains value until used again. See also 0x0041a5cc
function LastMessageBoxProperty() => dword_be(0x41A5CC)

// $41A5EC: [32-bit BE] Connected to confirmable message prompts. Notably displays 0x43700000 into 0x438c4000 when unlocking Pitfall! from the shaman shop (before and after press A to confirm dialogue) and 0x43998000 into 0x43ad4000 when unlocking Pitfall 2. Cleared when not in use. See also 0x0041a5cc
function MessageBoxProperty() => dword_be(0x41A5EC)

// $41BE4C: [32-bit BE] Harry pointer
//          +0x330 Rotation (1=flat, -1=upside-down)
//          +0x338 X position
//          +0x33C Y position
//          +0x340 Z position (height)
//          +0x658 Health capacity
//          +0x65C Health count
//          +0x680 Is inactionable
//          +0x79c Harry's State
//          +0x948 Is in healing fountain
//          +0x960 Invincibility
//          +0x970 Equipped items
//          ++0x0 Top item
//          ++0x4 Right item
//          ++0x8 Bottom item
//          ++0xc Left item
//          +0xb6c Displayed blue HP (for animal fights)
//          +0x195c Idol count
//          +0x1960 Rising strike
//          +0x1968 Super sling
//          +0x1970 Breakdance
//          +0x1978 Heroic dash
//          +0x1980 Heroic dive
//          +0x1988 Smash Strike
function HarryPointer() => dword_be(0x41BE4C) & pointer_mask
function HarryRotation() => float_be(HarryPointer() + 0x330)
function HarryX() => float_be(HarryPointer() + 0x338)
function HarryY() => float_be(HarryPointer() + 0x33C)
function HarryZ() => float_be(HarryPointer() + 0x340)
function MaxHealth() => dword_be(HarryPointer() + 0x658)
function CurrentHealth() => dword_be(HarryPointer() + 0x65C)
function Inactionable() => dword_be(HarryPointer() + 0x680)
function HarryState() => dword_be(HarryPointer() + 0x79c)
function InHealingFountain() => dword_be(HarryPointer() + 0x948)
function Invincible() => dword_be(HarryPointer() + 0x960)
function TopItem() => dword_be(dword_be(HarryPointer() + 0x970) & pointer_mask)
function RightItem() => dword_be(dword_be(HarryPointer() + 0x970) & pointer_mask + 0x4)
function BottomItem() => dword_be(dword_be(HarryPointer() + 0x970) & pointer_mask + 0x8)
function LeftItem() => dword_be(dword_be(HarryPointer() + 0x970) & pointer_mask + 0x4c)
function AnimalHarryHealth() => dword_be(HarryPointer() + 0xb6c)
function IdolCount() => dword_be(HarryPointer() + 0x195c)
function RisingStrike() => dword_be(HarryPointer() + 0x1960)
function SuperSling() => dword_be(HarryPointer() + 0x1968)
function Breakdance() => dword_be(HarryPointer() + 0x1970)
function HeroicDash() => dword_be(HarryPointer() + 0x1970)
function HeroicDive() => dword_be(HarryPointer() + 0x1980)
function SmashStrike() => dword_be(HarryPointer() + 0x1988)

animal_spirit_defeated = prev(AnimalHarryHealth()) == 0x01 && AnimalHarryHealth() == 0x00

// $41BEB0: [32-bit] Loading a map
function MapLoading() => dword_be(0x41BEB0)

// $41BEB4: [32-bit BE] Current map
function Map() => dword_be(0x41BEB4)

// $41BEE0: [32-bit BE] UI Pointer
//          +0xf8
//          ++0xbc = Displayed time left in Monkey Temple fight
//          ++0x130 = Current displayed health
//          +0xfc
//          ++0xd4 = Tuco Shoot score
//          +0x100
//          ++0xbc = Tuco Shoot timer
//          ++0xd8 = KaBOOM! timer
//          +0x104
//          ++0xbc = KaBOOM! timer
//          +0x108
//          ++0xd8 = Butterflies remaining
//          +0x114
//          ++0xd8 = Whack-a-tuco first native score
//          +0x118
//          ++0xd8 = Whack-a-tuco second native score
//          +0x11c
//          ++0xd8 = Whack-a-tuco score
//          +0x21c
//          ++0x08 = [16-bit BE] Raft Bowling first frame score. Future frames are spaced +0x2c along. Value of 301 when undetermined
function UIPointer() => dword_be(0x41BEE0) & pointer_mask
function MonkeyTimer() => dword_be((dword_be(UIPointer() + 0xf8) & pointer_mask) + 0xbc)
function DisplayedHealth() => dword_be((dword_be(UIPointer() + 0xf8) & pointer_mask) + 0x130)
tuco_shoot_score = dword_be((dword_be(UIPointer() + 0xfc) & pointer_mask) + 0xd4)
tuco_shoot_timer = dword_be((dword_be(UIPointer() + 0x100) & pointer_mask) + 0xbc)
kaboom_timer = dword_be((dword_be(UIPointer() + 0x100) & pointer_mask) + 0xd8)
kaboom_score = dword_be((dword_be(UIPointer() + 0x104) & pointer_mask) + 0xbc)
whack_tuco_enemy1_score = dword_be((dword_be(UIPointer() + 0x114) & pointer_mask) + 0xd8)
whack_tuco_enemy2_score = dword_be((dword_be(UIPointer() + 0x118) & pointer_mask) + 0xd8)
whack_tuco_score = dword_be((dword_be(UIPointer() + 0x11c) & pointer_mask) + 0xd8)
function RaftBowlingFrameScore(frame) => word_be((dword_be(UIPointer() + 0x21c) & pointer_mask) + (0x08) + (0x2c * frame))

// $41BEF8: [32-bit BE] Updates with the map ID when moving to a new region, but remains 0 when loading game.
function FauxMap() => dword_be(0x41BEF8)

// $421168: [32-bit BE] Is loading
function Loading() => dword_be(0x421168)

// $425E50: [32-bit BE] Playing a classic Pitfall game. See also 0x004cbe78
function PlayingRetroGame() => dword_be(0x425E50)

// $427408: [Bitfield] Face Buttons
//          Bit 0: A Button
//          Bit 1: B Button
//          Bit 2: X Button
//          Bit 3: Y Button
function FaceButtons() => byte(0x427408)

// $427409: [Bitfield] Shoulder Buttons and D-Pad
//          Bit 0: D-Pad Left
//          Bit 1: D-Pad Right
//          Bit 2: D-Pad Left
//          Bit 3: D-Pad Up
//          Bit 4: Z Button
//          Bit 5: R-Button (Full)
//          Bit 6: L-Button (Full)
function LRDPad() => byte(0x427409)

// $42740A: [8-bit] Control Stick X-Axis input. Not sure about format. Bit 7 and maybe 6 are only on for left movement
function ControlStickX() => byte(0x42740A)

// $42740B: [8-bit] Control Stick Y-Axis input. Not sure about format. Bit 7 and maybe 6 are only on for down movement
function ControlStickY() => byte(0x42740B)

// $42740C: [8-bit] C-Stick X-Axis input. Not sure about format. Bit 7 and maybe 6 are only on for left movement
function CStickX() => byte(0x42740C)

// $42740D: [8-bit] C-Stick Y-Axis input. Not sure about format. Bit 7 and maybe 6 are only on for down movement
function CStickY() => byte(0x42740D)

// $42740E: [8-bit] Analog L Button input
function LButton() => byte(0x42740E)

// $42740F: [8-bit] Analog R Button input
function RButton() => byte(0x42740F)

// $45D990: [32-bit BE] Playing as Nicole
function NicoleHarry() => dword_be(0x45D990)

// $45D994: [32-bit BE] Playing as a Native
function NativeHarry() => dword_be(0x45D994)

// $45D9A0: [32-bit BE] Global Slow Motion
function SlowMo() => dword_be(0x45D9A0)

// $45D9A4: [32-bit BE] Super Slow Motion
function SuperSlowMo() => dword_be(0x45D9A4)

// $45D9A8: [32-bit BE] Fast Motion
function FastMo() => dword_be(0x45D9A8)

// $45D9AC: [32-bit BE] Playing as Retro Harry
function RetroHarry() => dword_be(0x45D9AC)

// $45D9B0: [32-bit BE] Emulator: Pitfall
function PitfallEmulator() => dword_be(0x45D9B0)

// $45D9B4: [32-bit BE] Emulator: Pitfall II: Lost Caverns
function Pitfall2Emulator() => dword_be(0x45D9B4)

// $45D9B8: [32-bit BE] Stink Bombs
function StinkBombs() => dword_be(0x45D9B8)

// $45D9BC: [32-bit BE] Bottomless Canteen Cheat
function BottomlessCanteen() => dword_be(0x45D9BC)

// $45D9C0: [32-bit BE] Hyperpunch cheat
function Hyperpunch() => dword_be(0x45D9C0)
no_illegal_cheats = BottomlessCanteen() == 0x00 && Hyperpunch() == 0x00 && SlowMo() == 0x00 && SuperSlowMo() == 0x00
no_speedrun_illegal_cheats = BottomlessCanteen() == 0x00 && Hyperpunch() == 0x00 && FastMo() == 0x00 && SlowMo() == 0x00 && SuperSlowMo() == 0x00

// $45E0AC: [32-bit BE] Flips from 0x48 to 0x08 on chapter start map scene and in Shaman Shop. Also periodically flips when sling equipped in Mouth of Inti.
function ForcedMenu() => dword_be(0x45E0AC)

// $4CB78C: [32-bit BE] Corresponds to Hints Visible option. Visible is 0, hidden is 1
//          See also 0x0083276f and 0x0083277f
function HintsVisible() => dword_be(0x4CB78C)

// $4CB940: [32-bit BE] Boss pointer
//          +0x68c = Boss's HP
function BossPointer() => dword_be(0x4CB940) & pointer_mask
function BossHealth() => dword_be(BossPointer() + 0x68c)

boss_starts = prev(BossPointer()) == 0x00 &&
    BossPointer() != 0x00
boss_defeated = prev(BossHealth() == 0x01) && 
    BossHealth() == 0x00

// $4CBA08: [32-bit BE] Pointer to Atari emulation
//          +0x08		4 if playing Pitfall, 0 if playing Pitfall 2
//          +0x14		
//          ++0x104	
//          +++0x42fc8
//          ++++0x50
//          +++++0x00 = Atari Emulated memory. All addresses same as in original Atari
function AtariPointer() => dword_be(0x4cba08) & pointer_mask
playing_pitfall_1 = dword_be(AtariPointer() + 0x08) == 0x04
playing_pitfall_2 = dword_be(AtariPointer() + 0x08) == 0x00

function AtariMemoryBase() => (dword_be((dword_be((dword_be((dword_be(AtariPointer() + 0x14) & pointer_mask)
     + 0x104) & pointer_mask)
     + 0x42fc8) & pointer_mask)
     + 0x50) & pointer_mask)

// $4CCAFC: [32-bit BE] Difficulty of last played Native Game
function NativeGameDifficulty() => dword_be(0x4CCAFC)

// $4CCE68: [32-bit BE] Pointer to pointer to object tree start point
//          +0xc Pointer to object tree start point
function TreeRootPointer() => dword_be(0x4CCE68)

function TreeRoot() => dword_be((TreeRootPointer() & pointer_mask) + 0x0c) & pointer_mask

// $832760: [32-bit BE] Head of the object table
function ObjectTableHead() => dword_be(0x832760)

// $962688: [32-bit BE] Pause menu tracker
//          0x01 = Opening handbook animation
//          0x02 = Pause menu
//          0x03 = Closing handbook animation
//          0x04 = New item dialog
//          0x05 = Save game dialog
//          0x06 = Changning item
//          0x07 = Shaman shop dialog
//          0x08 = Minigame select
//          0x09 = Entering 2D Pitfall mode
//          0x0a = 2d Pitfall mode
//          0x0b = Exiting 2D pitfall mode
function PauseTracker() => dword_be(0x962688)

MapIDs = {
    "Abandoned Cavern": 0xEA667977,
    "The Altar of Ages": 0xABD7CCD8,
    "Altar of Huitaca": 0x70EBFCA3,
    "Ancient El Dorado (Pusca)": 0xCFD2FE10,
    "Apu Illapu Shrine": 0x5511C46C,
    "Battered Bridge": 0x69F0CDE2,
    "Bittenbinder's Camp": 0x0EF63551,
    "Butterfly Glade": 0xCD944049,
    "Cavern Lake": 0x8B372E42,
    "Chameleon Temple": 0x0081082C,
    "Copacanti Lake": 0x8147EA91,
    "Crash Site": 0xEE8F6900,
    "Crystal Cavern": 0x0DDE5470,
    "Ekkeko Ice Cavern": 0x3E7EE822,
    "Eyes of Doom": 0x9A0C8DF8,
    "Fire-bombed Towers": 0xF0F99C58,
    "Flooded Cave": 0x3A811024,
    "Flooded Courtyard": 0xECC9D759,
    "Gates of El Dorado": 0x93F89D45,
    "The Great Tree": 0x3292B6C9,
    "Jungle Canyon": 0xDEDA69BC,
    "Jungle Trail": 0x7A9B3870,
    "KaBOOM!": 0xE411440A,
    "Ladder of Miles": 0x619E1126,
    "Mama-Oullo Tower": 0x07ECCC35,
    "Monkey Temple (Harry)": 0xF3B4DC8E,
    "Monkey Temple (Spirit)": 0x02C7B675,
    "Mountain Overlook": 0x907C492B,
    "Mountain Sled Run": 0x1B8833D3,
    "Mouth of Inti": 0xB8D5CE86,
    "Mysterious Temple": 0x099BF148,
    "Native Jungle": 0x0AF1CCFF,
    "Native Village": 0x05AA726C,
    "Penguin Den": 0x1553BBE1,
    "Penguin Temple (Harry)": 0x1B11EC74,
    "Penguin Temple (Spirit)": 0x1F237F32,
    "Plane Cockpit": 0x4A3E4058,
    "Plane Crash": 0x53257119,
    "Pickaxe Race": 0x7A75D1A9,
    "Punchau Shrine": 0x38C7AE7D,
    "Raft Bowling": 0x9316749C,
    "Renegade Fort": 0x0C1C3E47,
    "Renegade Headquarters": 0x1CB1432D,
    "Ruins of El Dorado (Supai/Jaguar)": 0x99885996,
    "Scorpion Temple (Harry)": 0x4B08BBEB,
    "Scorpion Temple (Spirit)": 0x0305DC42,
    "Spinja Lair": 0x7652BAFC,
    "St. Claire's Excavation Camp (Night)": 0x72AD42FA,
    "St. Claire's Excavation Camp (Day)": 0xBA9370DF,
    "Statues of Ayar": 0xA85A2793,
    "Teleport": 0xE97CB47C,
    "Tuco Shoot": 0x0D72E13F,
    "Turtle Monument": 0x239A2165,
    "Twin Outposts (Underwater Cave)": 0xDE524Da6,
    "Twin Outposts": 0xE6B9138A,
    "Underground Dam": 0x9D6149E1,
    "Valley of the Sprits": 0x08E3C641,
    "Viracocha Monoliths (Cutscene)": 0xE8362F5F,
    "Viracocha Monoliths": 0x6F498BBD,
    "Whack-A-Tuco": 0x0A1F2526,
    "White Valley": 0x62548B77
}


ChapterTitles = ["Welcome to the Jungle",
    "The Rescue Mission Begins",
    "A Torch to Light the Way",
    "Extending the Olive Branch",
    "A Princess in Danger",
    "The Royal Welcome",
    "Into Hostile Territory",
    "The Snowy Mountains Await",
    "The Search for the Caverns",
    "The Mission Gets Personal",
    "A Fork in the Road",
    "Revisiting Old Haunts",
    "The Mystery Deepens",
    "A Desperate Plan",
    "The Road to El Dorado"]

in_gameplay = HarryPointer() != 0x00000000
stopped_gameplay = MapLoading() != 0x01 && Loading() != 0x01 && HarryPointer() == 0x00000000
active_gameplay = in_gameplay && Loading() == 0x00 && PauseTracker() == 0x00

gained_sling = prev(Sling()) == 0x00 && Sling() == 0x01
gained_rising_strike = prev(RisingStrike()) == 0x00 && RisingStrike() == 0x01
gained_torch = prev(Torch()) == 0x00 && Torch() == 0x01
gained_shield = prev(Shield()) == 0x00 && Shield() == 0x01
lost_shield = prev(Shield()) == 0x01 && Shield() == 0x00
gained_gas_mask = prev(GasMask()) == 0x00 && GasMask() == 0x01
gained_raft = prev(Raft()) == 0x00 && Raft() == 0x01
gained_TNT = prev(TNT()) == 0x00 && TNT() == 0x01

finished_cutscene = prev(HarryState()) == 0x76 && HarryState() != 0x76
entering_map = HarryState() == 0x58

//chapter_start = prev(ForcedMenu()) != 0x08 && ForcedMenu() == 0x08 && prior(PauseTracker()) == 0x01 && PauseTracker() == 0x02
chapter_start = prev(PauseTracker()) == 0x00 && PauseTracker() == 0x01 && prev(HarryState()) == 0x76

function inMap(mapName){
    return Map() == MapIDs[mapName]
}

function leftMap(mapName){
    return prev(Map()) == MapIDs[mapName] &&
        Map() != MapIDs[mapName]
}

function movedMap(movedFrom, movedTo){
    return prev(inMap(movedFrom)) && inMap(movedTo)
}

function finishNthCutscene(cutscene_count, map_name){   //Bittenbinder's Camp can be entered by swimming
    return repeated(cutscene_count, 
        finished_cutscene &&
        inMap(map_name) &&
        never(entering_map &&
        inMap(map_name)))
}
in_initial_jaguar_fight = inMap("Ruins of El Dorado (Supai/Jaguar)") && Canteen() == 0
finish_torch_cutscene = once(gained_torch &&
    never(entering_map)) &&
    finished_cutscene &&
    inMap("Mouth of Inti")

grabbed_key_item = prev(HarryState()) == 0x53 && HarryState() == 0x76

finished_initiation = once(gained_shield) &&
    repeated(2, finished_cutscene &&
        inMap("Native Village") &&
        Shield() == 0x01) &&
        never(lost_shield || 
        leftMap("Native Village") ||
        stopped_gameplay)

displaced = prev(HarryX()) - HarryX() > 10 ||
    prev(HarryX()) - HarryX() < -10 ||
    prev(HarryY()) - HarryY() > 10 ||
    prev(HarryY()) - HarryY() < -10

function Caught() => prev(inMap("St. Claire's Excavation Camp (Night)")) &&
    prior(HarryState() != 0x76) &&
    (displaced)

function StClairesSpawn() => inMap("St. Claire's Excavation Camp (Night)") && 
    finished_cutscene &&
    Shield() == 0x00

pitfall_1_lives = 1 + bit5(AtariMemoryBase()) + bit7(AtariMemoryBase())
pitfall_1_score = bcd(byte(AtariMemoryBase()+0x55)) * 10000 + 
    bcd(byte(AtariMemoryBase()+0x56)) * 100 + 
    bcd(byte(AtariMemoryBase()+0x57))
pitfall_1_minutes = bcd(byte(AtariMemoryBase() + 0x58))
pitfall_1_seconds = bcd(byte(AtariMemoryBase() + 0x59))
pitfall_1_treasures = bitcount(AtariMemoryBase() + 0x6d) + 
    bitcount(AtariMemoryBase() + 0x6e) + 
    bitcount(AtariMemoryBase() + 0x6f) + 
    bitcount(AtariMemoryBase() + 0x70)
pitfall_2_score = bcd(byte(AtariMemoryBase()+0x47)) * 10000 + 
    bcd(byte(AtariMemoryBase()+0x48)) * 100 + 
    bcd(byte(AtariMemoryBase()+0x49))
pitfall_2_quickclaw = bit6(AtariMemoryBase() + 0x6f)
pitfall_2_rhonda = bit6(AtariMemoryBase() + 0x70)
pitfall_2_raj_diamond = bit6(AtariMemoryBase() + 0x71)
pitfall_2_treasures = bitcount(AtariMemoryBase() + 0x6f) - pitfall_2_quickclaw +
    bitcount(AtariMemoryBase() + 0x70) - pitfall_2_rhonda +
    bitcount(AtariMemoryBase() + 0x71) - pitfall_2_raj_diamond +
    bitcount(AtariMemoryBase() + 0x72)

achievement(
    title = "Testing st claire's camp stealth",
    description = "Making sure this behaves as I expect",
    points = 0,
    trigger = once(StClairesSpawn() && 
        never(Caught())) &&
        trigger_when(prev(Canteen() == 0x00) && Canteen() == 0x01)
)

game_start = in_initial_jaguar_fight &&
    finished_cutscene &&
    BossHealth() == 0x0a
supai_1_end = in_initial_jaguar_fight &&
        boss_defeated
prologue_end = chapter_start &&
        inMap("Plane Cockpit")
chapter_1_end = chapter_start &&
        inMap("Bittenbinder's Camp")
chapter_2_end = chapter_start &&
        inMap("Mouth of Inti")
chapter_3_end = grabbed_key_item &&
        inMap("Monkey Temple (Harry)")
chapter_4_end = chapter_start &&
        inMap("Native Village") &&
        Shield() == 0x00
chapter_5_end = chapter_start &&
        inMap("Butterfly Glade")
chapter_6_end = chapter_start &&
        inMap("Native Village") &&
        Shield() == 0x01
chapter_7_end = gained_gas_mask &&
        inMap("Renegade Headquarters")
chapter_8_end = chapter_start &&
        inMap("Cavern Lake")
chapter_9_end = grabbed_key_item &&
        inMap("Scorpion Temple (Harry)")
chapter_10_end = grabbed_key_item &&
        inMap("Penguin Temple (Harry)")
chapter_11_end = chapter_start &&
        inMap("Apu Illapu Shrine")
chapter_12_end = chapter_start &&
        inMap("Chameleon Temple")
chapter_13_end = chapter_start &&
        inMap("The Altar of Ages")
chapter_14_end = chapter_start &&
        inMap("St. Claire's Excavation Camp (Night)")
pusca_defeated = inMap("Ancient El Dorado (Pusca)") &&
    boss_defeated


achievement(
    title = "It's A Long Story",
    description = "Fend off a demonic jaguar",
    points = 1,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        supai_1_end,
    type = "progression"
)


achievement(
    title = "The Lost Expeditioner",
    description = "Follow the flares to find another survivor",
    points = 3,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        prologue_end,
    type = "progression"
)

achievement(
    title = ChapterTitles[0],
    description = "Follow the tracks to Bittenbinder's Camp",
    points = 5,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        chapter_1_end,
    type = "progression"
)

achievement(
    title = ChapterTitles[1],
    description = "Get Nicole out of the tree",
    points = 5,
    trigger = in_gameplay &&
        no_illegal_cheats &&
        chapter_2_end,
    type = "progression"
)

achievement(
    title = ChapterTitles[2],
    description = "Find an ancient artifact inside Monkey Temple",
    points = 10,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        chapter_3_end,
    type = "progression"
)

achievement(
    title = ChapterTitles[3],
    description = "Make contact with the Native tribe",
    points = 2,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        chapter_4_end,
    type = "progression"
)

achievement(
    title = ChapterTitles[4],
    description = "See Princess Micay returned to her village",
    points = 2,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        chapter_5_end,
    type = "progression"
)

achievement(
    title = ChapterTitles[5],
    description = "Get initiated into the Native tribe",
    points = 1,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        chapter_6_end,
    type = "progression"
)

achievement(
    title = ChapterTitles[6],
    description = "Recover a gas mask from the Renegade Headquarters",
    points = 5,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        chapter_7_end,
    type = "progression"
)

achievement(
    title = ChapterTitles[7],
    description = "Enter the Snowy Mountains and rescue Leech",
    points = 5,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        chapter_8_end,
    type = "progression"
)

achievement(
    title = ChapterTitles[8],
    description = "Find an ancient artifact inside Scorpion Temple",
    points = 10,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        chapter_9_end,
    type = "progression"
)

achievement(
    title = ChapterTitles[9],
    description = "Find an ancient artifact inside Penguin Temple",
    points = 10,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        chapter_10_end,
    type = "progression"
)

achievement(
    title = ChapterTitles[10],
    description = "Rescue Mole in the heart of the Snowy Mountains",
    points = 5,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        chapter_11_end,
    type = "progression"
)

achievement(
    title = ChapterTitles[11],
    description = "Seek an ancient artifact inside Chameleon Temple",
    points = 2,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        chapter_12_end,
    type = "progression"
)

achievement(
    title = ChapterTitles[12],
    description = "Hear the whole story from Micay",
    points = 2,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        chapter_13_end,
    type = "progression"
)

achievement(
    title = ChapterTitles[13],
    description = "Gather the treasures St. Claire has collected",
    points = 5,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        chapter_14_end,
    type = "progression"
)

achievement(
    title = ChapterTitles[14],
    description = "Save El Dorado from Spanish invasion, and from Pusca",
    points = 25,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        pusca_defeated,
    type = "win_condition"
)

entered_final_bosses = prev(inMap("Gates of El Dorado")) && inMap("Ruins of El Dorado (Supai/Jaguar)")
drank_canteen = prev(CanteenContent()) == CanteenContent() + 1

achievement(
    title = "Shove Off St. Scum",
    description = "Defeat St. Claire in Mouth of Inti without any health upgrades and without using the canteen",
    points = 10,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        once(inMap("Mouth of Inti") &&
            boss_starts && 
            MaxHealth() == 0x05 &&
            never(drank_canteen)) &&
        inMap("Mouth of Inti") &&
        boss_defeated && 
        MaxHealth() == 0x05
)

achievement(
    title = "Renegade Wrangler",
    description = "Enter Renegade Headquarters and claim the Gas Mask without any health upgrades and without using the canteen",
    points = 10,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        once(inMap("Renegade Headquarters") &&
            GasMask() == 0x00 &&
            MaxHealth() == 0x05 &&
            never(drank_canteen)) &&
        inMap("Renegade Headquarters") &&
        gained_gas_mask && 
        MaxHealth() == 0x05
)

achievement(
    title = "Do I Look Like I've Got Money?",
    description = "Defeat St. Claire in Crystal Cavern without any health upgrades and without using the canteen",
    points = 10,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        once(inMap("Crystal Cavern") &&
            boss_starts && 
            MaxHealth() == 0x05 &&
            never(drank_canteen)) &&
        inMap("Crystal Cavern") &&
        boss_defeated && 
        MaxHealth() == 0x05
)

achievement(
    title = "Could I Be The Green Ninja?",
    description = "Enter Apu Illapu Shrine and rescue Mole from the spinjas without any health upgrades and without using the canteen",
    points = 10,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        once(inMap("Apu Illapu Shrine") &&
            TNT() == 0x00 &&
            MaxHealth() == 0x05 &&
            never(drank_canteen)) &&
        inMap("Apu Illapu Shrine") &&
        gained_TNT && 
        MaxHealth() == 0x05
)

achievement(
    title = "I Don't Need It",
    description = "Defeat the demonic jaguar and Pusca without any health upgrades and without using the canteen",
    points = 25,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        once(entered_final_bosses && 
            MaxHealth() == 0x05 &&
            never(drank_canteen)) &&
        inMap("Ancient El Dorado (Pusca)") &&
        boss_defeated && 
        MaxHealth() == 0x05
)

achievement(
    title = "Pitfall Healthy",
    description = "Max out your health bar",
    points = 10,
    trigger = in_gameplay &&
        prev(MaxHealth()) == 0x09 &&
        MaxHealth() == 0x0a
)

achievement(
    title = "Stay Hydrated",
    description = "Max out your canteen capacity",
    points = 10,
    trigger = in_gameplay &&
        prev(CanteenCapacity()) == 0x09 &&
        CanteenCapacity() == 0x0a
)

achievement(
    title = "It Helps You Be Heroic, Or a Handbook",
    description = "Gather all the missing technique pages of the Heroic Handbook",
    points = 10,
    trigger = in_gameplay &&
        prev(HeroicDash()) + prev(SuperSling()) + prev(HeroicDive()) + prev(RisingStrike()) + prev(Breakdance()) + prev(SmashStrike()) == 5 &&
        HeroicDash() + SuperSling() + HeroicDive() + RisingStrike() + Breakdance() + SmashStrike() == 6
)

all_trackable_upgrades = MaxHealth() == 0x0a && 
    CanteenCapacity() == 0x0a &&
    SmashStrike() == 0x01 && 
    SuperSling() == 0x01 && 
    Breakdance() == 0x01

function PitfallAccess() => once(prev(PauseTracker()) == 0x07 && PauseTracker() == 0x02) && 
    prev(PauseTracker()) == 0x00 && PauseTracker() == 0x04 &&
    never(once(prev(PauseTracker()) == 0x07 && PauseTracker() == 0x02) &&
        repeated(300, PauseTracker() == 0x00)
    )

achievement(
    title = "Worth My Weight In Gold, Apparently",
    description = "Get a special prize for purchasing all the Shaman's wares",
    points = 25,
    trigger = in_gameplay && 
        PitfallAccess() &&
        MessageBoxProperty() == 0x43998000 &&
        all_trackable_upgrades &&
        LastMessageBoxProperty() == 0x43aa8000
)

achievement(
    title = "Snake in the Grass",
    description = "Recover everything in St. Claire's Excavation Camp without ever being caught",
    points = 10,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        once(StClairesSpawn() && 
            never(Caught())) &&
        trigger_when(chapter_start &&
        inMap("St. Claire's Excavation Camp (Night)") &&
        Canteen() == 0x01 &&
        Sling() == 0x01 &&
        Torch() == 0x01 &&
        Shield() == 0x01 &&
        GasMask() == 0x01 &&
        Raft() == 0x01 &&
        Pickaxe() == 0x01 &&
        TNT() == 0x01)
)

timer_active = PauseTracker() + Loading() == 0

achievement(
    title = "Retrace Your Steps",
    description = "Travel from the Gates of El Dorado back to the Crash Site in under X:XX",
    points = 10,
    trigger = in_gameplay && 
        no_speedrun_illegal_cheats &&
        once(no_speedrun_illegal_cheats && 
            prev(Map()) != Map() &&
            never(repeated(25*60*60, !timer_active)) &&
            prev(inMap("Gates of El Dorado"))) &&
        trigger_when(inMap("Crash Site")) &&
        never(stopped_gameplay)
)

achievement(
    title = "Native Envoy",
    description = "Travel from the Native Village to the top of the Renegade Headquarters in under X:XX",
    points = 10,
    trigger = in_gameplay && 
        no_speedrun_illegal_cheats &&
        once(no_speedrun_illegal_cheats && 
            prev(Map()) != Map() &&
            never(repeated(25*60*60, !timer_active)) &&
            prev(inMap("Native Village"))) &&
        trigger_when(inMap("Renegade Headquarters")) &&
        never(stopped_gameplay)
)

achievement(
    title = "Cavern Circuit",
    description = "Travel from the Underground Dam to the Mountain Overlook and return to the Underground Dam in under X:XX",
    points = 10,
    trigger = in_gameplay && 
        no_speedrun_illegal_cheats &&
        once(no_speedrun_illegal_cheats && 
            prev(Map()) != Map() &&
            never(repeated(25*60*60, !timer_active)) &&
            prev(inMap("Underground Dam"))) &&
        trigger_when(inMap("Underground Dam") &&
            once(inMap("Mountain Overlook") &&
                never(prev(inMap("Underground Dam"))))) &&
        never(stopped_gameplay)
)

achievement(
    title = "Mountaintop Tour",
    description = "Travel from White Valley to Apu Illapu Shrine and back to White Valley in under X:XX without taking White Valley's geyser",
    points = 10,
    trigger = in_gameplay && 
        no_speedrun_illegal_cheats &&
        once(no_speedrun_illegal_cheats && 
            prev(Map()) != Map() &&
            never(repeated(25*60*60, !timer_active)) &&
            never(movedMap("White Valley", "Mountain Sled Run")) &&
            prev(inMap("White Valley")) &&
            !inMap("White Valley")) &&
        trigger_when(inMap("White Valley") &&
            once(inMap("Apu Illapu Shrine") &&
                never(prev(inMap("White Valley"))))) &&
        never(stopped_gameplay)
)

achievement(
    title = "Holy Pilgrimage",
    description = "Visit all four animal temples, The Altar of Ages, and the Gates of El Dorado in any order in under 25:00",
    points = 25,
    trigger = in_gameplay && 
        no_speedrun_illegal_cheats &&
        once(no_speedrun_illegal_cheats && 
            prev(Map()) != Map() &&
            never(repeated(25*60*60, !timer_active)) &&
            (prev(inMap("Monkey Temple (Harry)")) || 
            prev(inMap("Scorpion Temple (Harry)")) || 
            prev(inMap("Penguin Temple (Harry)")) || 
            prev(inMap("Chameleon Temple")) || 
            prev(inMap("The Altar of Ages")) || 
            prev(inMap("Gates of El Dorado"))) ) &&
        trigger_when(tally(6, once(prev(inMap("Monkey Temple (Harry)"))), 
            once(prev(inMap("Scorpion Temple (Harry)"))),
            once(prev(inMap("Penguin Temple (Harry)"))),
            once(prev(inMap("Chameleon Temple"))),
            once(prev(inMap("The Altar of Ages"))),
            once(prev(inMap("Gates of El Dorado"))))) &&
        never(stopped_gameplay)
)

abandoned_challenge = prev(Map()) != Map() || stopped_gameplay

achievement(
    title = "Target Sighted",
    description = "Defeat St. Claire at the Mouth of Inti without getting hit and without unequipping the sling",
    points = 5,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        once(inMap("Mouth of Inti") &&
            boss_starts &&
            never(abandoned_challenge) &&
            never(prev(HarryState()) == 0x13) &&
            HarryState() != 0x13) &&
            never(prev(CurrentHealth()) > CurrentHealth()) &&
        boss_defeated,
    type = "Missable"
)

achievement(
    title = "Apes Together Strong",
    description = "Defeat the animal spirit in Monkey Temple with 30 or more seconds left on the timer",
    points = 5,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        inMap("Monkey Temple (Spirit)") &&
        MonkeyTimer() >= 30 &&
        trigger_when(animal_spirit_defeated),
    type = "Missable"
)

using_non_breakdance_attack = HarryState() == 0x11 ||
    HarryState() == 0x13 ||
    HarryState() == 0x27 ||
    HarryState() == 0x2f ||
    HarryState() == 0x31 ||
    HarryState() == 0x32 ||
    HarryState() == 0x4c ||
    HarryState() == 0x5a ||
    HarryState() == 0x5e ||
    HarryState() == 0x66 ||
    HarryState() == 0x7c

achievement(
    title = "Dance Battle",
    description = "Defeat St. Claire in the Crystal Cavern without using any attacks except for the breakdance",
    points = 5,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        once(inMap("Crystal Cavern") && 
            boss_starts &&
            never(using_non_breakdance_attack) &&
            never(abandoned_challenge)) &&
        boss_defeated,
    type = "Missable"
)

achievement(
    title = "The Ceiling is Lava",
    description = "Defeat the scorpion spirit without spending more than 30 seconds on the ceiling at a time. (Ceiling is counted as where your body is fully above the top of the constellation murals)",
    points = 5,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        once(inMap("Scorpion Temple (Spirit)") &&
        MapLoading() == 0x01 &&
        never(repeated(45*60, HarryRotation() <= -0.75 &&
                never(HarryRotation() > -0.75))) &&
        never(abandoned_challenge)) &&
    trigger_when(animal_spirit_defeated),
    type = "Missable"
)

achievement(
    title = "Cold Comfort",
    description = "Defeat the penguin spirit without ever being hit",
    points = 5,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        once(inMap("Penguin Temple (Spirit)") &&
        MapLoading() == 0x01 &&
        never(HarryState() == 0x08) &&
        never(abandoned_challenge)),
    type = "Missable"
)

achievement(
    title = "Atari Jaguar",
    description = "Defeat the demonic jaguar without being hit and in under 1:00",
    points = 5,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        once(inMap("Ruins of El Dorado (Supai/Jaguar)") &&
            Canteen() == 0x01 &&
            finished_cutscene &&
            BossHealth() == 0xa &&
            never(prev(CurrentHealth()) > CurrentHealth()) &&
            never(abandoned_challenge) &&
            never(repeated(60*60, PauseTracker() == 0x00))) &&
        trigger_when(boss_defeated),
    type = "Missable"
)

reset_challenge = stopped_gameplay || MapLoading() == 0x01

achievement(
    title = "I'll Get That Blasted Porcupine!",
    description = "Beat a round of Tuco Shoot on hard without hitting any Tuco Tucos",
    points = 5,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        inMap("Tuco Shoot") &&
        NativeGameDifficulty() == 0x02 &&
        once(inMap("Tuco Shoot") &&
            NativeGameDifficulty() == 0x02 &&
            prev(PauseTracker()) == 0x04 &&
            PauseTracker() == 0x00 &&
            never(prev(tuco_shoot_score) + 1 == tuco_shoot_score) && 
            never(reset_challenge)) &&
        trigger_when(prev(tuco_shoot_score) < 10 &&
            tuco_shoot_score >= 10 &&
            tuco_shoot_timer <= 0x3c &&
            tuco_shoot_timer > 0x00)
)



achievement(
    title = "Turkey of the Sea",
    description = "Get three strikes in a row in Raft Bowling on hard",
    points = 5,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        inMap("Raft Bowling") &&
        NativeGameDifficulty() == 0x02 &&
        (prev(RaftBowlingFrameScore(0)) == 301 && 
        RaftBowlingFrameScore(0) == 30) ||
        (prev(RaftBowlingFrameScore(1)) == 301 &&
            RaftBowlingFrameScore(1) - RaftBowlingFrameScore(0) == 30) ||
        (prev(RaftBowlingFrameScore(2)) == 301 &&
            RaftBowlingFrameScore(2) - RaftBowlingFrameScore(1) == 30) ||
        (prev(RaftBowlingFrameScore(3)) == 301 &&
            RaftBowlingFrameScore(3) - RaftBowlingFrameScore(2) == 30) ||
        (prev(RaftBowlingFrameScore(4)) == 301 &&
            RaftBowlingFrameScore(4) - RaftBowlingFrameScore(3) == 30) ||
        (prev(RaftBowlingFrameScore(5)) == 301 &&
            RaftBowlingFrameScore(5) - RaftBowlingFrameScore(4) == 30) ||
        (prev(RaftBowlingFrameScore(6)) == 301 &&
            RaftBowlingFrameScore(6) - RaftBowlingFrameScore(5) == 30) ||
        (prev(RaftBowlingFrameScore(7)) == 301 &&
            RaftBowlingFrameScore(7) - RaftBowlingFrameScore(6) == 30) ||
        (prev(RaftBowlingFrameScore(8)) == 301 &&
            RaftBowlingFrameScore(8) - RaftBowlingFrameScore(7) == 30) ||
        (prev(RaftBowlingFrameScore(9)) == 301 &&
            RaftBowlingFrameScore(9) - RaftBowlingFrameScore(8) == 30)

)

pickaxe_race_winning_height = 214.64278

achievement(
    title = "Pickaxe Race",
    description = "Beat Pickaxe Race on hard in under 1:30",
    points = 5,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        inMap("Pickaxe Race") &&
        NativeGameDifficulty() == 0x02 &&
        once(inMap("Pickaxe Race") &&
            NativeGameDifficulty() == 0x02 &&
            prev(PauseTracker()) == 0x04 &&
            PauseTracker() == 0x00 &&
            never(reset_challenge) &&
            never(tally(60 * 90, PauseTracker() == 0x00))) &&
        trigger_when(prev(HarryZ()) < pickaxe_race_winning_height &&
            HarryZ() >= pickaxe_race_winning_height)
)


achievement(
    title = "Hands Off My Prey",
    description = "Win Whack-a-Tuco on hard without either native athlete getting more than 5 points",
    points = 5,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        inMap("Whack-A-Tuco") &&
        NativeGameDifficulty() == 0x02 &&
        prev(whack_tuco_score) == 9 &&
        whack_tuco_enemy1_score <= 5 &&
        whack_tuco_enemy2_score <= 5 &&
        whack_tuco_score == 10

)

achievement(
    title = "Win, Lose, And KaBOOM!",
    description = "Win KaBOOM! on hard without exiting TNT throwing mode for movement",
    points = 5,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        inMap("KaBOOM!") &&
        NativeGameDifficulty() == 0x02 &&
        once(inMap("KaBOOM!") &&
            NativeGameDifficulty() == 0x02 &&
            prev(PauseTracker()) == 0x04 &&
            PauseTracker() == 0x00 &&
            never(HarryState() == 0x08) && 
            never(HarryState() == 0x09) && 
            never(HarryState() == 0x63) && 
            never(reset_challenge)) &&
        trigger_when(prev(kaboom_score) > 0 &&
            kaboom_score == 0 &&
            kaboom_timer <= 0x3c &&
            kaboom_timer > 0x00)

)

achievement(
    title = "Float Like a Butterfly",
    description = "Cross the Butterfly Glade and enter Renegade Fort without swimming or using the Heroic Dive",
    points = 10,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        once(inMap("Butterfly Glade") &&
            HarryX() < 270 &&
            HarryX() != 0 &&
            (HarryState() == 0x08 ||
            HarryState() == 0x09) &&
            never(HarryState() == 0x1c) &&
            never(HarryState() == 0x36) &&
            never(stopped_gameplay)) &&
        trigger_when(prev(inMap("Butterfly Glade")) &&
            inMap("Renegade Fort"))
)

achievement(
    title = "The Path of Peace",
    description = "Cross the Underground Dam from Jungle Canyon to Abandoned Cavern without using any attacks except for one Rising Strike",
    points = 10,
    trigger = in_gameplay &&
        no_illegal_cheats &&
        once(movedMap("Jungle Canyon", "Underground Dam")) &&
        never(repeated(2, prev(HarryState()) == 0x2f && HarryState() != 0x2f) &&
            inMap("Underground Dam")) &&
        never(prev(HarryState()) == 0x27 && HarryState() != 0x2f && HarryState() != 0x27 &&
            inMap("Underground Dam")) &&
        never(inMap("Underground Dam") &&
            (HarryState() == 0x11 || 
            HarryState() == 0x29 ||
            HarryState() == 0x31 ||
            HarryState() == 0x32 ||
            HarryState() == 0x4c ||
            HarryState() == 0x5a ||
            HarryState() == 0x5e ||
            HarryState() == 0x66 ||
            HarryState() == 0x7c)) &&
        never(stopped_gameplay)
)

achievement(
    title = "Hole in One",
    description = "Take the jump from the end of the Mountain Sled Run and land in the healing fountain",
    points = 5,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        once(inMap("Mountain Sled Run") &&
            HarryState() == 0x6e && 
            HarryZ() > 0 && 
            never(
                inMap("Mountain Sled Run") &&
                prev(HarryState()) == 0x6e &&
                HarryState() != 0x6e &&
                HarryZ() < 0)) && 
        inMap("Mountain Sled Run") &&
        HarryState() == 0x6e && 
        InHealingFountain() == 0x01
)

achievement(
    title = "Explorer Extraordinaire",
    description = "Join the Explorer's Club by surpassing a score of 20,000 in Pitfall!",
    points = 5,
    trigger = PlayingRetroGame() == 0x01 &&
        playing_pitfall_1 &&
        prev(pitfall_1_score) < 20000 &&
        pitfall_1_score >= 20000
)

achievement(
    title = "There's Always Another Adventure",
    description = "Find a treasure in Pitfall 2: Lost Caverns",
    points = 5,
    trigger = PlayingRetroGame() == 0x01 &&
        playing_pitfall_2 &&
        pitfall_2_score > prev(pitfall_2_score) &&
        prev(pitfall_2_score) != 0
)




// Climbing the Great Tree (Now covered by Holy Pilgrimage - maybe)
// Underground Dam without attacking? Need Rising Strikes though...
// Apu Illapu without pickaxes? Force dizzy?
// I should have a glitch showcase set. Might need to visit the Discord for that




/*
achievement(
    title = "Retro Score Test",
    description = "Achievements are easier than RP",
    points = 0,
    trigger = prev(pitfall_1_score) <= 2000 && pitfall_1_score > 2000
)
*/

/*
search_key = 0x290ae8fb

achievement(
    title = "Testing a Single Tree Step",
    description = "Please",
    points = 0,
    trigger = TreeRoot() == 0x0081a980
)

achievement(
    title = "Testing a Single Tree Step Part 2",
    description = "Please",
    points = 0,
    trigger = TreeRoot() + 
        (((TreeRoot() - dword_be(TreeRoot()) + bit(31, dword_be(TreeRoot() + 0x18) - search_key) * 4) *
        ((dword_be(TreeRoot() + 0x18) - search_key)/(dword_be(TreeRoot() + 0x18) - search_key))) == 0x00817980 &&
        Map() == MapIDs["Crash Site"]
)
*/

// ---------------------------------------------------------------------------------------------  RICH PRESENCE  ---------------------------------------------------------------------------------------------

leaderboard(
    title = "Any% Speedrun",
    description = "Beat the game from a fresh file",
    start = no_speedrun_illegal_cheats &&
        game_start,
    cancel = stopped_gameplay,
    submit = pusca_defeated,
    value = timer_active,
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    title = "100% Speedrun",
    description = "From a fresh file defeat Pusca and buy every item from the Shaman shop",
    start = no_speedrun_illegal_cheats &&
        game_start,
    cancel = stopped_gameplay,
    submit = pusca_defeated,
    value = timer_active,
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    title = "Introductory Chapter Speedrun",
    description = "Go from the start of the game to receiving the canteen as fast as you can",
    start = no_speedrun_illegal_cheats &&
        game_start,
    cancel = stopped_gameplay,
    submit = prologue_end,
    value = timer_active,
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    title = ChapterTitles[0] + " Speedrun",
    description = "Complete the chapter " + ChapterTitles[0] + " as fast as you can",
    start = no_speedrun_illegal_cheats &&
        prologue_end,
    cancel = stopped_gameplay,
    submit = chapter_1_end,
    value = timer_active,
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    title = ChapterTitles[1] + " Speedrun",
    description = "Complete the chapter " + ChapterTitles[1] + " as fast as you can",
    start = no_speedrun_illegal_cheats &&
        chapter_1_end,
    cancel = stopped_gameplay,
    submit = chapter_2_end,
    value = timer_active,
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    title = ChapterTitles[2] + " Speedrun",
    description = "Complete the chapter " + ChapterTitles[2] + " as fast as you can",
    start = no_speedrun_illegal_cheats &&
        chapter_2_end,
    cancel = stopped_gameplay,
    submit = chapter_3_end,
    value = timer_active,
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    title = ChapterTitles[3] + " Speedrun",
    description = "Complete the chapter " + ChapterTitles[3] + " as fast as you can",
    start = no_speedrun_illegal_cheats &&
        chapter_3_end,
    cancel = stopped_gameplay,
    submit = chapter_4_end,
    value = timer_active,
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    title = ChapterTitles[4] + " Speedrun",
    description = "Complete the chapter " + ChapterTitles[4] + " as fast as you can",
    start = no_speedrun_illegal_cheats &&
        chapter_4_end,
    cancel = stopped_gameplay,
    submit = chapter_5_end,
    value = timer_active,
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    title = ChapterTitles[5] + " Speedrun",
    description = "Complete the chapter " + ChapterTitles[5] + " as fast as you can",
    start = no_speedrun_illegal_cheats &&
        chapter_5_end,
    cancel = stopped_gameplay,
    submit = chapter_6_end,
    value = timer_active,
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    title = ChapterTitles[6] + " Speedrun",
    description = "Complete the chapter " + ChapterTitles[6] + " as fast as you can",
    start = no_speedrun_illegal_cheats &&
        chapter_6_end,
    cancel = stopped_gameplay,
    submit = chapter_7_end,
    value = timer_active,
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    title = ChapterTitles[7] + " Speedrun",
    description = "Complete the chapter " + ChapterTitles[7] + " as fast as you can",
    start = no_speedrun_illegal_cheats &&
        chapter_7_end,
    cancel = stopped_gameplay,
    submit = chapter_8_end,
    value = timer_active,
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    title = ChapterTitles[8] + " Speedrun",
    description = "Complete the chapter " + ChapterTitles[8] + " as fast as you can",
    start = no_speedrun_illegal_cheats &&
        chapter_8_end,
    cancel = stopped_gameplay,
    submit = chapter_9_end,
    value = timer_active,
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    title = ChapterTitles[9] + " Speedrun",
    description = "Complete the chapter " + ChapterTitles[9] + " as fast as you can",
    start = no_speedrun_illegal_cheats &&
        chapter_9_end,
    cancel = stopped_gameplay,
    submit = chapter_10_end,
    value = timer_active,
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    title = ChapterTitles[10] + " Speedrun",
    description = "Complete the chapter " + ChapterTitles[10] + " as fast as you can",
    start = no_speedrun_illegal_cheats &&
        chapter_10_end,
    cancel = stopped_gameplay,
    submit = chapter_11_end,
    value = timer_active,
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    title = ChapterTitles[11] + " Speedrun",
    description = "Complete the chapter " + ChapterTitles[11] + " as fast as you can",
    start = no_speedrun_illegal_cheats &&
        chapter_11_end,
    cancel = stopped_gameplay,
    submit = chapter_12_end,
    value = timer_active,
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    title = ChapterTitles[12] + " Speedrun",
    description = "Complete the chapter " + ChapterTitles[12] + " as fast as you can",
    start = no_speedrun_illegal_cheats &&
        chapter_12_end,
    cancel = stopped_gameplay,
    submit = chapter_13_end,
    value = timer_active,
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    title = ChapterTitles[13] + " Speedrun",
    description = "Complete the chapter " + ChapterTitles[13] + " as fast as you can",
    start = no_speedrun_illegal_cheats &&
        chapter_13_end,
    cancel = stopped_gameplay,
    submit = chapter_14_end,
    value = timer_active,
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    title = ChapterTitles[14] + " Speedrun",
    description = "Complete the chapter " + ChapterTitles[14] + " as fast as you can",
    start = no_speedrun_illegal_cheats &&
        chapter_14_end,
    cancel = stopped_gameplay,
    submit = pusca_defeated,
    value = timer_active,
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    title = "Holy Pilgrimage Test",
    description = "I need to get times",
    start = no_speedrun_illegal_cheats &&
        (leftMap("Monkey Temple (Harry)") ||
        leftMap("Scorpion Temple (Harry)") ||
        leftMap("Penguin Temple (Harry)") ||
        leftMap("Chameleon Temple") ||
        leftMap("The Altar of Ages") ||
        leftMap("Gates of El Dorado")),
    cancel = stopped_gameplay,
    submit = tally(6, once(prev(inMap("Monkey Temple (Harry)"))), 
            once(prev(inMap("Scorpion Temple (Harry)"))),
            once(prev(inMap("Penguin Temple (Harry)"))),
            once(prev(inMap("Chameleon Temple"))),
            once(prev(inMap("The Altar of Ages"))),
            once(prev(inMap("Gates of El Dorado")))),
    value = timer_active,
    format = "FRAMES",
    lower_is_better = true
)

// ---------------------------------------------------------------------------------------------  RICH PRESENCE  ---------------------------------------------------------------------------------------------

// TODO
//  -Add emojis for Equipped items?  🥤🪨🔥🛡️🤿🚣⛏️💣🤢

rp_maps = {
    MapIDs["Abandoned Cavern"]: "exploring the Abandoned Cavern",
    MapIDs["The Altar of Ages"]: "exploring The Altar of Ages",
    MapIDs["Altar of Huitaca"]: "exploring the Altar of Huitaca",
    MapIDs["Ancient El Dorado (Pusca)"]: "battling Pusca in Ancient El Dorado",
    MapIDs["Apu Illapu Shrine"]: "exploring the Apu Illapu Shrine",
    MapIDs["Battered Bridge"]: "exploring the Battered Bridge",
    MapIDs["Bittenbinder's Camp"]: "exploring Bittenbinder's Camp",
    MapIDs["Butterfly Glade"]: "exploring the Butterfly Glade",
    MapIDs["Cavern Lake"]: "exploring the Cavern Lake",
    MapIDs["Chameleon Temple"]: "exploring Chameleon Temple",
    MapIDs["Copacanti Lake"]: "exploring Copacanti Lake",
    MapIDs["Crash Site"]: "exploring the Crash Site",
    MapIDs["Crystal Cavern"]: "exploring the Crystal Cavern",
    MapIDs["Ekkeko Ice Cavern"]: "exploring Ekkeko Ice Cavern",
    MapIDs["Eyes of Doom"]: "exploring the Eyes of Doom",
    MapIDs["Fire-bombed Towers"]: "exploring the Fire-bombed Towers",
    MapIDs["Flooded Cave"]: "exploring the Flooded Cave",
    MapIDs["Flooded Courtyard"]: "exploring the Flooded Courtyard",
    MapIDs["Gates of El Dorado"]: "exploring the Gates of El Dorado",
    MapIDs["The Great Tree"]: "exploring The Great Tree",
    MapIDs["Jungle Canyon"]: "exploring the Jungle Canyon",
    MapIDs["Jungle Trail"]: "exploring the Jungle Trail",
    MapIDs["KaBOOM!"]: "playing KaBOOM!",
    MapIDs["Ladder of Miles"]: "exploring the Ladder of Miles",
    MapIDs["Mama-Oullo Tower"]: "exploring Mama-Oullo Tower",
    MapIDs["Monkey Temple (Harry)"]: "exploring the Monkey Temple",
    MapIDs["Monkey Temple (Spirit)"]: "fighting for his soul in the Monkey Temple",
    MapIDs["Mountain Overlook"]: "exploring the Mountain Overlook",
    MapIDs["Mountain Sled Run"]: "exploring the Mountain Sled Run",
    MapIDs["Mouth of Inti"]: "exploring the Mouth of Inti",
    MapIDs["Mysterious Temple"]: "exploring the Mysterious Temple",
    MapIDs["Native Jungle"]: "exploring the Native Jungle",
    MapIDs["Native Village"]: "exploring the Native Village",
    MapIDs["Penguin Den"]: "exploring the Penguin Den",
    MapIDs["Penguin Temple (Harry)"]: "exploring the Penguin Temple",
    MapIDs["Penguin Temple (Spirit)"]: "fighting for his soul in the Penguin Temple",
    MapIDs["Plane Cockpit"]: "exploring the Plane Cockpit",
    MapIDs["Plane Crash"]: "exploring the Plane Crash",
    MapIDs["Pickaxe Race"]: "playing Pickaxe Race",
    MapIDs["Punchau Shrine"]: "exploring Punchau Shrine",
    MapIDs["Raft Bowling"]: "playing Raft Bowling",
    MapIDs["Renegade Fort"]: "exploring the Renegade Fort",
    MapIDs["Renegade Headquarters"]: "exploring the Renegade Headquarters",
    MapIDs["Ruins of El Dorado (Supai/Jaguar)"]: "battling a demonic jaguar in the ruins of El Dorado",
    MapIDs["Scorpion Temple (Harry)"]: "exploring the Scorpion Temple",
    MapIDs["Scorpion Temple (Spirit)"]: "fighting for his soul in the Scorpion Temple",
    MapIDs["Spinja Lair"]: "exploring the Spinja Lair",
    MapIDs["St. Claire's Excavation Camp (Night)"]: "sneaking through St. Claire's Excavation Camp",
    MapIDs["St. Claire's Excavation Camp (Day)"]: "exploring St. Claire's Excavation Camp",
    MapIDs["Statues of Ayar"]: "exploring the Statues of Ayar",
    MapIDs["Teleport"]: "exploring the Teleport Chamber",
    MapIDs["Tuco Shoot"]: "playing Tuco Shoot",
    MapIDs["Turtle Monument"]: "exploring Turtle Monument",
    MapIDs["Twin Outposts (Underwater Cave)"]: "exploring the Twin Outposts",
    MapIDs["Twin Outposts"]: "exploring the Twin Outposts",
    MapIDs["Underground Dam"]: "exploring the Underground Dam",
    MapIDs["Valley of the Sprits"]: "exploring the Valley of the Spirits",
    MapIDs["Viracocha Monoliths (Cutscene)"]: "exploring the Viracocha Monoliths",
    MapIDs["Viracocha Monoliths"]: "exploring the Viracocha Monoliths",
    MapIDs["Whack-A-Tuco"]: "playing Whack-A-Tuco",
    MapIDs["White Valley"]: "exploring the White Valley"
}

function RPCharacter() => RetroHarry() + NativeHarry()*2 + NicoleHarry()*3
characters = { 0: "Harry", 1: "Retro Harry", 2: "A Native", 3: "Nicole"}


p2_rhonda = { 0: "", 1: " 👧"}
p2_quickclaw = { 0: "", 1: " 🐱"}
p2_raj_diamond = { 0: "", 1: " 💎"}

function RPCheats() => FastMo() + 2 * SlowMo() + 2 * SuperSlowMo() + 2 * BottomlessCanteen() + 2 * Hyperpunch()
rp_cheater_warning = { 0: ""}

rp_cheater_canteen = { 0: "", 1: " 🚰"}
rp_cheater_hyperpunch = { 0: "", 1: " 👊️"}
rp_cheater_fastmo = { 0: "", 1: " ⏩"}
rp_cheater_slowmo = { 0: "", 1: " ⏪"}
rp_cheater_super_slowmo = { 0: "", 1: " ⏮️"}

rich_presence_conditional_display(PlayingRetroGame() == 0x01 && playing_pitfall_1, "Playing Pitfall! | 🏃{0} | 💯{1} | ⏰{2} | 💰{3}/32",
    rich_presence_value("Pitfall Lives", pitfall_1_lives),
    rich_presence_value("Pitfall Score", pitfall_1_score),
    rich_presence_value("Pitfall Time", pitfall_1_minutes * 60 + pitfall_1_seconds, "SECS"),
    rich_presence_value("Pitfall Loot", pitfall_1_treasures)
)
rich_presence_conditional_display(PlayingRetroGame() == 0x01 && playing_pitfall_2, "Playing Pitfall II: Lost Caverns | 💯{0} | 💰{1}/28{2}{3}{4}",
    rich_presence_value("Pitfall 2 Score", pitfall_2_score),
    rich_presence_value("Pitfall 2 Treasure", pitfall_2_treasures),
    rich_presence_lookup("Pitfall 2 Rhonda", pitfall_2_rhonda, p2_rhonda),
    rich_presence_lookup("Pitfall 2 Quickclaw", pitfall_2_quickclaw, p2_quickclaw),
    rich_presence_lookup("Pitfall 2 Diamond", pitfall_2_raj_diamond, p2_raj_diamond)
)
rich_presence_conditional_display(!in_gameplay && Loading() == 0x01, "Now Loading...")
rich_presence_conditional_display(!in_gameplay, "On the Main Menu")
rich_presence_conditional_display(in_initial_jaguar_fight, "{0} is fighting a demonic jaguar",
    rich_presence_lookup("Character", RPCharacter(), characters)
)
rich_presence_display("{0} is {1} | ❤️{2}/{3} | 🗿 {4}{5}{6}{7}{8}{9}{10}",
    rich_presence_lookup("Character", RPCharacter(), characters),
    rich_presence_lookup("Map", Map(), rp_maps),
    rich_presence_value("Health", CurrentHealth()),
    rich_presence_value("Max Health", MaxHealth()),
    rich_presence_value("Spare Idols", IdolCount()),
    rich_presence_lookup("Cheat Warning", RPCheats(), rp_cheater_warning, fallback="⚠️ Cheats active-Some achievements disabled ⚠️ Cheats:"),
    rich_presence_lookup("Canteen Cheat", BottomlessCanteen(), rp_cheater_canteen),
    rich_presence_lookup("Hyperpunch Cheat", Hyperpunch(), rp_cheater_hyperpunch),
    rich_presence_lookup("Fastmo Cheat", FastMo(), rp_cheater_fastmo),
    rich_presence_lookup("Slowmo Cheat", SlowMo(), rp_cheater_slowmo),
    rich_presence_lookup("Super Slowmo Cheat", SuperSlowMo(), rp_cheater_super_slowmo)
)
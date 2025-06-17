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
//          +0x338 X position
//          +0x33C Y position
//          +0x340 Z position (height)
//          +0x658 Health capacity
//          +0x65C Health count
//          +0x680 Is inactionable
//          +0x79c Harry's State
//          +0x960 Invincibility
//          +0x970 Equipped items
//          ++0x0 Top item
//          ++0x4 Right item
//          ++0x8 Bottom item
//          ++0xc Left item
//          +0x195c Idol count
//          +0x1960 Rising strike
//          +0x1968 Super sling
//          +0x1970 Breakdance
//          +0x1978 Heroic dash
//          +0x1980 Heroic dive
//          +0x1988 Smash Strike
function HarryPointer() => dword_be(0x41BE4C) & pointer_mask
function MaxHealth() => dword_be(HarryPointer() + 0x658)
function CurrentHealth() => dword_be(HarryPointer() + 0x65C)
function Inactionable() => dword_be(HarryPointer() + 0x680)
function HarryState() => dword_be(HarryPointer() + 0x79c)
function TopItem() => dword_be(dword_be(HarryPointer() + 0x970) & pointer_mask)
function RightItem() => dword_be(dword_be(HarryPointer() + 0x970) & pointer_mask + 0x4)
function BottomItem() => dword_be(dword_be(HarryPointer() + 0x970) & pointer_mask + 0x8)
function LeftItem() => dword_be(dword_be(HarryPointer() + 0x970) & pointer_mask + 0x4c)
function IdolCount() => dword_be(HarryPointer() + 0x195c)
function RisingStrike() => dword_be(HarryPointer() + 0x1960)
function SuperSling() => dword_be(HarryPointer() + 0x1968)
function Breakdance() => dword_be(HarryPointer() + 0x1970)
function HeroicDash() => dword_be(HarryPointer() + 0x1970)
function HeroicDive() => dword_be(HarryPointer() + 0x1980)
function SmashStrike() => dword_be(HarryPointer() + 0x1988)
function Invincible() => dword_be(HarryPointer() + 0x960)

// $41BEB0: [32-bit] Transitioning maps
function MapTransition() => dword(0x41BEB0)

// $41BEB4: [32-bit BE] Current map
function Map() => dword_be(0x41BEB4)

// $41BEE0: [32-bit BE] UI Pointer
//          +0xf8
//          ++0x130 = Current displayed health
//          +0x108
//          ++0xd8 = Butterflies remaining
function UIPointer() => dword_be(0x41BEE0) & pointer_mask
function DisplayedHealth() => dword_be(dword_be(UIPointer() + 0xf8) + 0x130)

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
function Pitfarll2Emulator() => dword_be(0x45D9B4)

// $45D9B8: [32-bit BE] Stink Bombs
function StinkBombs() => dword_be(0x45D9B8)

// $45D9BC: [32-bit BE] Bottomless Canteen Cheat
function BottomlessCanteen() => dword_be(0x45D9BC)

// $45D9C0: [32-bit BE] Hyperpunch cheat
function Hyperpunch() => dword_be(0x45D9C0)
no_illegal_cheats = BottomlessCanteen() == 0x00 && Hyperpunch() == 0x00 && SlowMo() == 0x00 && SuperSlowMo() == 0x00

// $45E0AC: [32-bit BE] Flips from 0x48 to 0x08 on chapter start map scene and in Shaman Shop. Also periodically flips when sling equipped in Mouth of Inti.
function ForcedMenu() => dword_be(0x45E0AC)

// $4CB78C: [32-bit BE] Corresponds to Hints Visible option. Visible is 0, hidden is 1
//          See also 0x0083276f and 0x0083277f
function HintsVisible() => dword_be(0x4CB78C)

// $4CB940: [32-bit BE] Pusca pointer
//          +0x68c = Pusca's HP
function PuscaPointer() => dword_be(0x4CB940) & pointer_mask
function PuscaHP() => dword_be(PuscaPointer() + 0x68c)

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
stopped_gameplay = prev(HarryPointer()) != 0x00000000 && HarryPointer() == 0x00000000

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

function finishNthCutscene(cutscene_count, map_name){   //Bittenbinder's Camp can be entered by swimming
    return repeated(cutscene_count, 
        finished_cutscene &&
        inMap(map_name) &&
        never(entering_map &&
        inMap(map_name)))
}
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
    title = "Testing chapter start detector",
    description = "Making sure this behaves as I expect",
    points = 0,
    trigger = chapter_start
)

achievement(
    title = "The Lost Expeditioner",
    description = "Follow the flares to find another survivor",
    points = 5,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        chapter_start &&
        inMap("Plane Cockpit"),
    type = "progression"
)

achievement(
    title = ChapterTitles[0],
    description = "Follow the tracks to Bittenbinder's Camp",
    points = 5,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        chapter_start &&
        inMap("Bittenbinder's Camp"),
    type = "progression"
)

achievement(
    title = ChapterTitles[1],
    description = "Get Nicole out of the Tree",
    points = 5,
    trigger = in_gameplay &&
        no_illegal_cheats &&
        chapter_start &&
        inMap("Mouth of Inti"),
    type = "progression"
)

achievement(
    title = ChapterTitles[2],
    description = "Find an ancient artifact inside Monkey Temple",
    points = 5,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        grabbed_key_item &&
        inMap("Monkey Temple (Harry)"),
    type = "progression"
)

achievement(
    title = ChapterTitles[3],
    description = "Make contact with the Native tribe",
    points = 2,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        chapter_start &&
        inMap("Native Village") &&
        Shield() == 0x00,
    type = "progression"
)

achievement(
    title = ChapterTitles[4],
    description = "See Princess Micay returned to her village",
    points = 2,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        chapter_start &&
        inMap("Butterfly Glade"),
    type = "progression"
)

achievement(
    title = ChapterTitles[5],
    description = "Get initiated into the Native tribe",
    points = 1,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        chapter_start &&
        inMap("Native Village") &&
        Shield() == 0x01,
    type = "progression"
)

achievement(
    title = ChapterTitles[6],
    description = "Recover a gas mask from the Renegade Headquarters",
    points = 5,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        gained_gas_mask &&
        inMap("Renegade Headquarters"),
    type = "progression"
)

achievement(
    title = ChapterTitles[7],
    description = "Rescue Leech at the Cavern Lake",
    points = 5,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        chapter_start &&
        inMap("Cavern Lake"),
    type = "progression"
)

achievement(
    title = ChapterTitles[8],
    description = "Find an ancient artifact inside Scorpion Temple",
    points = 5,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        grabbed_key_item &&
        inMap("Scorpion Temple (Harry)"),
    type = "progression"
)

achievement(
    title = ChapterTitles[9],
    description = "Find an ancient artifact inside Penguin Temple",
    points = 5,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        grabbed_key_item &&
        inMap("Penguin Temple (Harry)"),
    type = "progression"
)

achievement(
    title = ChapterTitles[10],
    description = "Rescue Mole in the heart of the Snowy Mountains",
    points = 5,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        chapter_start &&
        inMap("Apu Illapu Shrine"),
    type = "progression"
)

achievement(
    title = ChapterTitles[11],
    description = "Seek an ancient artifact inside Chameleon Temple",
    points = 1,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        chapter_start &&
        inMap("Chameleon Temple"),
    type = "progression"
)

achievement(
    title = ChapterTitles[12],
    description = "Hear the whole story from Princess Micay",
    points = 1,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        chapter_start &&
        inMap("The Altar of Ages"),
    type = "progression"
)

achievement(
    title = ChapterTitles[13],
    description = "Gather the treasures St. Claire has collected",
    points = 5,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        chapter_start &&
        inMap("St. Claire's Excavation Camp (Night)"),
    type = "progression"
)

achievement(
    title = ChapterTitles[14],
    description = "Save El Dorado from Spanish invasion, and from Pusca",
    points = 10,
    trigger = in_gameplay && 
        no_illegal_cheats &&
        inMap("Ancient El Dorado (Pusca)") &&
        prev(PuscaHP()) == 0x01 &&
        PuscaHP() == 0x00,
    type = "win_condition"
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
    description = "Gather all the pages of the Heroic Handbook",
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
        tally(300, PauseTracker() == 0x00)
    )

achievement(
    title = "Worth My Weight In Gold, Apparently",
    description = "Get a bonus prize for purchasing all the Shaman's wares",
    points = 25,
    trigger = in_gameplay && 
        PitfallAccess() &&
        MessageBoxProperty() == 0x43998000 &&
        all_trackable_upgrades &&
        LastMessageBoxProperty() == 0x43aa8000
)

achievement(
    title = "Bonafide Explorer",
    description = "Join the Explorer's Club by surpassing a score of 20,000 in Pitfall!",
    points = 5,
    trigger = PlayingRetroGame() == 0x01 &&
        playing_pitfall_1 &&
        prev(pitfall_1_score) < 20000 &&
        pitfall_1_score >= 20000
)

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

// TODO
//  -Classic Pitfall games in both main menu and Punchau
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

in_initial_jaguar_fight = inMap("Ruins of El Dorado (Supai/Jaguar)") && TNT() == 0


p2_rhonda = { 0: "", 1: " 👧"}
p2_quickclaw = { 0: "", 1: " 🐱"}
p2_raj_diamond = { 0: "", 1: " 💎"}

rp_cheater_canteen = { 0: "", 1: " ⚠️ BOTTOMLESS CANTEEN CHEAT ⚠️"}
rp_cheater_hyperpunch = { 0: "", 1: " ⚠️ HYPERPUNCH CHEAT ⚠️"}
rp_cheater_slowmo = { 0: "", 1: " ⚠️ SLOW-MO CHEAT ⚠️"}
rp_cheater_super_slowmo = { 0: "", 1: " ⚠️ SUPER SLOW-MO CHEAT ⚠️"}

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
rich_presence_display("{0} is {1} | ❤️{2}/{3} | 🗿{4}{5}{6}{7}{8}",
    rich_presence_lookup("Character", RPCharacter(), characters),
    rich_presence_lookup("Map", Map(), rp_maps),
    rich_presence_value("Health", CurrentHealth()),
    rich_presence_value("Max Health", MaxHealth()),
    rich_presence_value("Spare Idols", IdolCount()),
    rich_presence_lookup("Canteen Cheat", BottomlessCanteen(), rp_cheater_canteen),
    rich_presence_lookup("Hyperpunch Cheat", Hyperpunch(), rp_cheater_hyperpunch),
    rich_presence_lookup("Slowmo Cheat", SlowMo(), rp_cheater_slowmo),
    rich_presence_lookup("Super Slowmo Cheat", SuperSlowMo(), rp_cheater_super_slowmo)
)
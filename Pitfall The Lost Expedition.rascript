// Pitfall: The Lost Expedition
// #ID = 30552
// #MinimumVersion=1.3.1


// $132CEE: [8-bit] Explorer idol reward
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
function CanteenPointer() => dword_be(0x41A2FC)

// $41A30C: [32-bit BE] Canteen unlocked
function Canteen() => dword_be(0x41A30C)

// $41A318: [32-bit BE] Stink Bomb pointer
function StinkBombPointer() => dword_be(0x41A318)

// $41BE4C: [32-bit BE] Harry pointer
//          +0x338 X position
//          +0x33C Y position
//          +0x340 Z position (height)
//          +0x658 Health capacity
//          +0x680 In a cutscene
//          +0x65C Health count
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
function HarryPointer() => dword_be(0x41BE4C)

// $41BEB0: [32-bit] Transitioning maps
function MapTransition() => dword(0x41BEB0)

// $41BEB4: [32-bit BE] Current map
function Map() => dword_be(0x41BEB4)

// $41BEF8: [32-bit BE] Updates with the map ID when moving to a new region, but remains 0 when loading game.
function FauxMap() => dword_be(0x41BEF8)

// $421168: [32-bit BE] Is loading
function Loading() => dword_be(0x421168)

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

// $4CB78C: [32-bit BE] Corresponds to Hints Visible option. Visible is 0, hidden is 1
//          See also 0x0083276f and 0x0083277f
function HintsVisible() => dword_be(0x4CB78C)

// $4CCE68: [32-bit BE] Pointer to pointer to object tree start point
//          +0xc Pointer to object tree start point
function TreeRootPointer() => tbyte_be(0x4CCE68)

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
    "Apu Illapu Shrine (Spinjas)": 0x5511C46C,
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


// ---------------------------------------------------------------------------------------------  RICH PRESENCE  ---------------------------------------------------------------------------------------------
rp_maps = {
    MapIDs["Abandoned Cavern"]: "exploring the Abandoned Cavern",
    MapIDs["The Altar of Ages"]: "exploring The Altar of Ages",
    MapIDs["Altar of Huitaca"]: "exploring the Altar of Huitaca",
    MapIDs["Ancient El Dorado (Pusca)"]: "battling Pusca in Ancient El Dorado",
    MapIDs["Apu Illapu Shrine (Spinjas)"]: "exploring the Apu Illapu Shrine",
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
    MapIDs["Ruins of El Dorado (Supai/Jaguar)"]: "battling Supai in the ruins of El Dorado",
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
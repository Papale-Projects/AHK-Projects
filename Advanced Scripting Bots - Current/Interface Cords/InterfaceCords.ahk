#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;Runescape window settings w: 1060	h: 840 mode: Resized

;Function to force a random number to generate each time
Cords()
{
	;Cordinate points for each interface tab
	CombatTabX := RandomWeight(728, 644, 658)
	CombatTabY := RandomWeight(800, 817, 835)
	
	SkillTabX := RandomWeight(662, 676, 692)
	SkillTabY := RandomWeight(800, 817, 835)
	
	QuestTabX := RandomWeight(695, 710, 725)
	QuestTabY := RandomWeight(800, 817, 835)
	
	InventoryTabX := RandomWeight(728, 743, 758)
	InventoryTabY := RandomWeight(800, 817, 835)
	
	EquipmentTabX := RandomWeight(761, 774, 758)
	EquipmentTabY := RandomWeight(800, 817, 835)
	
	PrayerTabX := RandomWeight(792, 808, 824)
	PrayerTabY := RandomWeight(800, 817, 835)
	
	SpellTabX := RandomWeight(825, 841, 857)
	SpellTabY := RandomWeight(800, 817, 835)
	
	FriendTabX := RandomWeight(858, 874, 890)
	FriendTabY := RandomWeight(800, 817, 835)
	
	AccountTabX := RandomWeight(892, 908, 923)
	AccountTabY := RandomWeight(800, 817, 835)
	
	ClanTabX := RandomWeight(924, 940, 955)
	ClanTabY := RandomWeight(800, 817, 835)
	
	OptionsTabX := RandomWeight(959, 975, 987)
	OptionsTabY := RandomWeight(800, 817, 835)
	
	EmoteTabX := RandomWeight(992, 1008, 1021)
	EmoteTabY := RandomWeight(800, 817, 835)
	
	MusicTabX := RandomWeight(1023, 1039, 1054)
	MusicTabY := RandomWeight(800, 817, 835)
	
	PrayerOrbX := RandomWeight(848, 871, 895)
	PrayerOrbY := RandomWeight(115, 127, 140)
	
	RunOrbX := RandomWeight(858, 882, 907)
	RunOrbY := RandomWeight(148, 160, 172)
	
	ExitButtonX := RandomWeight(1028, 1040, 1053)
	ExitButtonY := RandomWeight(31, 42, 53)
	
	LogoutButtonX := RandomWeight(884, 954, 1025)
	LogoutButtonY := RandomWeight(742, 758, 775)
}
return
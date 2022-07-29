#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;Runescape window settings w: 1060	h: 840 mode: Resized
Global CombatTabX
Global CombatTabY
Global SkillTabX
Global SkillTabY
Global QuestTabX
Global QuestTabY
Global InventoryTabX
Global InventoryTabY
Global EquipmentTabX
Global EquipmentTabY
Global PrayerTabX
Global PrayerTabY
Global SpellTabX
Global SpellTabY
Global FriendTabX
Global FriendTabY
Global AccountTabX
Global AccountTabY
Global ClanTabX
Global ClanTabY
Global OptionsTabX
Global OptionsTabY
Global EmoteTabX
Global EmoteTabY
Global MusicTabX
Global MusicTabY
Global PrayerOrbX
Global PrayerOrbY
Global RunOrbX
Global RunOrbY
Global ExitButtonX
Global ExitButtonY
Global LogoutButtonX
Global LogoutButtonY

MenuCordz()
{
	;Cordinate points for each interface tab
	CombatTabX := RandomWeight(638, 650, 667)
	CombatTabY := RandomWeight(834, 850, 866)
	
	SkillTabX := RandomWeight(650, 665, 680)
	SkillTabY := RandomWeight(831, 850, 865)
	
	QuestTabX := RandomWeight(702, 718, 733)
	QuestTabY := RandomWeight(834, 850, 866)
	
	InventoryTabX := RandomWeight(714, 730, 745)
	InventoryTabY := RandomWeight(831, 850, 865)
	
	EquipmentTabX := RandomWeight(768, 782, 799)
	EquipmentTabY := RandomWeight(834, 850, 866)
	
	PrayerTabX := RandomWeight(802, 817, 830)
	PrayerTabY := RandomWeight(834, 850, 866)
	
	SpellTabX := RandomWeight(816, 822, 831)
	SpellTabY := RandomWeight(845, 852, 866)
	
	FriendTabX := RandomWeight(866, 880, 897)
	FriendTabY := RandomWeight(834, 850, 866)
	
	AccountTabX := RandomWeight(900, 920, 931)
	AccountTabY := RandomWeight(834, 850, 866)
	
	ClanTabX := RandomWeight(933, 950, 963)
	ClanTabY := RandomWeight(834, 850, 866)
	
	OptionsTabX := RandomWeight(967, 980, 995)
	OptionsTabY := RandomWeight(834, 850, 866)
	
	EmoteTabX := RandomWeight(998, 1010, 1029)
	EmoteTabY := RandomWeight(834, 850, 866)
	
	MusicTabX := RandomWeight(1032, 1045, 1061)
	MusicTabY := RandomWeight(834, 850, 866)
	
	PrayerOrbX := RandomWeight(848, 871, 895)
	PrayerOrbY := RandomWeight(115, 127, 140)
	
	RunOrbX := RandomWeight(858, 882, 907)
	RunOrbY := RandomWeight(148, 160, 172)
	
	ExitButtonX := RandomWeight(1017, 1023, 1040)
	ExitButtonY := RandomWeight(29, 35, 51)
	
	LogoutButtonX := RandomWeight(875, 910, 1011)
	LogoutButtonY := RandomWeight(774, 785, 805)
}
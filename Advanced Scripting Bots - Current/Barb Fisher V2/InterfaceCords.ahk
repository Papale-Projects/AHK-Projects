#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;Runescape window settings w: 1060	h: 840 mode: Resized

;Cordinate points for each interface tab
Random, CombatTabX, 630, 658 ;Area min max for X axis
Random, CombatTabY, 800, 835 ;Area min max for Y axis
CombatTabCenterX = 644
CombatTabCenterY = 817

Random, SkillTabX, 662, 692 ;Area min max for X axis
Random, SkillTabY, 800, 835 ;Area min max for Y axis
SkillTabCenterX = 676
SkillTabCenterY = 817

Random, QuestTabX, 695, 725 ;Area min max for X axis
Random, QuestTabY, 800, 835 ;Area min max for Y axis
QuestTabCenterX = 710
QuestTabCenterY = 817

Random, InventoryTabX, 728, 758 ;Area min max for X axis
Random, InventoryTabY, 800, 835 ;Area min max for Y axis
InventoryTabCenterX = 743
InventoryTabCenterY = 817

Random, EquipmentTabX, 761, 788 ;Area min max for X axis
Random, EquipmentTabY, 800, 835 ;Area min max for Y axis
EquipmentTabCenterX = 774
EquipmentTabCenterY = 817

Random, PrayerTabX, 792, 824 ;Area min max for X axis
Random, PrayerTabY, 800, 835 ;Area min max for Y axis
PrayerTabCenterX = 808
PrayerTabCenterY = 817

Random, SpellTabX, 825, 857 ;Area min max for X axis
Random, SpellTabY, 800, 835 ;Area min max for Y axis
SpellTabCenterX = 841
SpellTabCenterY = 817

Random, FriendTabX, 858, 890 ;Area min max for X axis
Random, FriendTabY, 800, 835 ;Area min max for Y axis
FriendTabCenterX = 874
FriendTabCenterY = 817

Random, AccountTabX, 892, 923 ;Area min max for X axis
Random, AccountTabY, 800, 835 ;Area min max for Y axis
AccountTabCenterX = 908
AccountTabCenterY = 817

Random, ClanTabX, 924, 955 ;Area min max for X axis
Random, ClanTabY, 800, 835 ;Area min max for Y axis
ClanTabCenterX = 940
ClanTabCenterY = 817

Random, OptionsTabX, 959, 987 ;Area min max for X axis
Random, OptionsTabY, 800, 835 ;Area min max for Y axis
OptionsTabCenterX = 975
OptionsTabCenterY = 817

Random, EmoteTabX, 992, 1021 ;Area min max for X axis
Random, EmoteTabY, 800, 835 ;Area min max for Y axis
EmoteTabCenterX = 1008
EmoteTabCenterY = 817

Random, MusicTabX, 1023, 1054 ;Area min max for X axis
Random, MusicTabY, 800, 835 ;Area min max for Y axis
MusicTabCenterX = 1039
MusicTabCenterY = 817

Random, PrayerOrbX, 848, 895 ;Area min max for X axis
Random, PrayerOrbY, 115, 140 ;Area min max for Y axis
PrayerOrbCenterX = 871
PrayerOrbCenterY = 127

Random, RunOrbX, 858, 907 ;Area min max for X axis
Random, RunOrbY, 148, 172 ;Area min max for Y axis
RunOrbCenterX = 882
RunOrbCenterY = 160

Random, ExitButtonX, 1028, 1053 ;Area min max for X axis
Random, ExitButtonY, 31, 53 ;Area min max for Y axis
ExitButtonCenterX = 1040
ExitButtonCenterY = 42

Random, LogoutButtonX, 884, 1025 ;Area min max for X axis
Random, LogoutButtonY, 742, 775 ;Area min max for Y axis
LogoutButtonCenterX = 954
LogoutButtonCenterY = 758
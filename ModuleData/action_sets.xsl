<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="action_set[@id='as_human_warrior' or @id='as_human_female_warrior']">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
      <action type="act_applaud_1" animation="anim_applaud_1" alternative_group="applaud_alt"/>
      <action type="act_argue_trio_middle" animation="anim_cutscene_npc_argue_opponent_1"/>
      <action type="act_talk_to_1" animation="anim_hangout_idle_1" alternative_group="talk_to_alt"/>
      <action type="act_sit_beggar_beg" animation="anim_beggar_sitting_hands"/>
      <action type="act_childhood_arms" animation="anim_childhood_arms"/>
      <action type="act_childhood_explorer" animation="anim_childhood_explorer"/>
      <action type="act_childhood_strenght" animation="anim_childhood_strenght"/>
      <action type="act_childhood_tactician" animation="anim_childhood_tactician"/>
      <action type="act_guard_report_leader" animation="anim_guard_report_leader"/>
      <action type="act_npc_farmer_bush_cutting" animation="anim_npc_farmer_bush_cutting"/>
      <action type="act_scared_reaction_1" animation="anim_reactions_scared_1" alternative_group="scared_reaction"/>
      <action type="act_stand_beggar_1" animation="anim_beggar_standing_2hbegging" alternative_group="beg_alt"/>
      <action type="act_childhood_appearances" animation="anim_childhood_appearances"/>
      <action type="act_childhood_grit" animation="anim_childhood_grit"/>
      <action type="act_childhood_genius" animation="anim_childhood_genius"/>
      <action type="act_childhood_leader" animation="anim_childhood_leader"/>
      <action type="act_childhood_spoiled" animation="anim_childhood_spoiled"/>
      <action type="act_childhood_toddler_endurance" animation="anim_childhood_toddler_endurance"/>
      <action type="act_guard_stand_1" animation="guard_idle_1" alternative_group="guard_idle_group"/>
      <action type="act_drunk_pair_1" animation="anim_drunk_pair_1"/>
      <action type="act_dungeon_prisoner_cleaning_floor" animation="anim_dungeon_prisoner_cleaning_floor"/>
      <action type="act_dungeon_prisoner_idle_exhausted" animation="anim_dungeon_prisoner_idle_exhausted"/>
      <action type="act_dungeon_prisoner_idle_holding_cage_begining" animation="anim_dungeon_prisoner_idle_holding_cage_begining"/>
      <action type="act_dungeon_prisoner_idle_leaning_wall_b_begining" animation="anim_dungeon_prisoner_idle_leaning_wall_b_begining"/>
      <action type="act_dungeon_prisoner_lay" animation="anim_dungeon_prisoner_lay"/>
      <action type="act_npc_farmer_digging" animation="anim_npc_farmer_only_digging"/>
      <action type="act_npc_farmer_scythe_using" animation="anim_npc_farmer_scythe_using"/>
      <action type="act_npc_horse_grooming" animation="anim_npc_horse_grooming"/>
      <action type="act_npc_villager_fishing" animation="anim_npc_villager_fishing"/>
      <action type="act_npc_villager_lumberjack" animation="anim_npc_villager_lumberjack"/>
      <action type="act_npc_villager_leather_cleaning" animation="anim_npc_villager_leather_cleaning"/>
      <action type="act_pick_up_from_ground" animation="anim_villager_pick_sitting_man_1"/>
      <action type="act_combat_training_char_a" animation="combat_training_char_a"/>
      <action type="act_dance_norse" animation="anim_tavern_dance_norse"/>
      <action type="act_dungeon_guardian_sit_and_nap_cycle" animation="anim_dungeon_guardian_sit_and_nap_cycle"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
package com.playata.application.ui.elements.guild
{
   import com.playata.application.data.guild.GuildBattleHistoryFight;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.guild.SymbolGuildBattleHistoryLineGeneric;
   
   public class UiGuildBattleHistoryLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolGuildBattleHistoryLineGeneric = null;
      
      private var _index:int = 0;
      
      private var _guildBattleHistoryFight:GuildBattleHistoryFight = null;
      
      private var _onClickFunction:Function = null;
      
      private var _onDoubleClickFunction:Function = null;
      
      private var _artifactTooltip:UiGuildArtifactTooltip = null;
      
      private var _artifactStolenTooltip:UiGuildArtifactTooltip = null;
      
      private var _emblem:UiGuildEmblem = null;
      
      public function UiGuildBattleHistoryLine(param1:SymbolGuildBattleHistoryLineGeneric, param2:int, param3:Function, param4:Function)
      {
         _content = param1;
         super(_content);
         _index = param2;
         _onClickFunction = param3;
         _onDoubleClickFunction = param4;
         _artifactTooltip = new UiGuildArtifactTooltip(new InteractiveDisplayObject(_content.iconArtifact));
         _artifactStolenTooltip = new UiGuildArtifactTooltip(new InteractiveDisplayObject(_content.iconArtifactStolen));
         _emblem = new UiGuildEmblem(_content.emblem,null,22,22,null,false,12);
         this.onClick.add(handleClick);
         this.onDoubleClick.add(handleDoubleClick);
         useHandCursor = false;
      }
      
      override public function dispose() : void
      {
         _emblem.dispose();
         _emblem = null;
         _artifactTooltip.dispose();
         _artifactTooltip = null;
         _artifactStolenTooltip.dispose();
         _artifactStolenTooltip = null;
         super.dispose();
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guildBattleHistoryFight() : GuildBattleHistoryFight
      {
         return _guildBattleHistoryFight;
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
      }
      
      private function handleDoubleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
      }
      
      public function highlight(param1:Boolean) : void
      {
         if(!_content.visible)
         {
            return;
         }
         _content.backgroundHighlight.visible = param1;
         _content.backgroundEven.visible = !param1 && _index % 2 == 0;
         _content.backgroundOdd.visible = !param1 && _index % 2 != 0;
      }
      
      public function refresh(param1:GuildBattleHistoryFight, param2:int) : void
      {
         var _loc3_:* = undefined;
         _index = param2;
         if(_guildBattleHistoryFight && param1 && _guildBattleHistoryFight.id == param1.id)
         {
            return;
         }
         _guildBattleHistoryFight = param1;
         if(_guildBattleHistoryFight == null)
         {
            _content.visible = false;
            return;
         }
         _content.visible = true;
         _content.iconAttack.visible = _guildBattleHistoryFight.isGuildBattleAttack;
         _content.iconDefense.visible = _guildBattleHistoryFight.isGuildBattleDefense;
         _content.txtDate.text = _guildBattleHistoryFight.dateTime;
         _content.txtEnemyName.text = _guildBattleHistoryFight.enemyName;
         _content.txtJoined.text = _guildBattleHistoryFight.joinedMemberCount.toString();
         _content.txtHonor.text = LocText.current.formatHugeNumber(_guildBattleHistoryFight.honorReward,true);
         _content.iconArtifact.visible = _guildBattleHistoryFight.hasArtifactReward;
         _content.iconArtifactStolen.visible = _content.iconArtifact.visible && !_guildBattleHistoryFight.isWon;
         _content.iconImprovement.visible = _guildBattleHistoryFight.hasImprovementReward;
         _content.iconGuildMissiles.visible = _guildBattleHistoryFight.hasGuildMissileReward;
         _content.txtStatusLost.visible = !_guildBattleHistoryFight.isWon;
         _content.txtStatusWon.visible = _guildBattleHistoryFight.isWon;
         _content.txtStatusLost.text = LocText.current.text("dialog/missed_duels/lost_text");
         _content.txtStatusWon.text = LocText.current.text("dialog/missed_duels/won_text");
         _emblem.refresh(_guildBattleHistoryFight.emblemSettings);
         if(_guildBattleHistoryFight.hasArtifactReward)
         {
            _loc3_ = new Vector.<int>();
            _loc3_.push(_guildBattleHistoryFight.artifactId);
            _artifactTooltip.artifactIds = _loc3_;
            _artifactStolenTooltip.artifactIds = _loc3_;
         }
         _content.backgroundEven.visible = param2 % 2 == 0;
         _content.backgroundOdd.visible = param2 % 2 != 0;
      }
   }
}

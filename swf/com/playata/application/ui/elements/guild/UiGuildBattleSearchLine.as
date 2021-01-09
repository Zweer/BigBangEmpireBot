package com.playata.application.ui.elements.guild
{
   import com.playata.application.AppConfig;
   import com.playata.application.assets.AppAssetUtil;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.guild.GuildBattleSearchResult;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.guild.SymbolGuildBattleSearchLineGeneric;
   
   public class UiGuildBattleSearchLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolGuildBattleSearchLineGeneric = null;
      
      private var _index:int = 0;
      
      private var _guild:GuildBattleSearchResult = null;
      
      private var _onClickFunction:Function = null;
      
      private var _onDoubleClickFunction:Function = null;
      
      private var _emblem:UiGuildEmblem = null;
      
      private var _tooltip:UiTextTooltip = null;
      
      public function UiGuildBattleSearchLine(param1:SymbolGuildBattleSearchLineGeneric, param2:int, param3:Function, param4:Function)
      {
         _content = param1;
         super(_content);
         _index = param2;
         _onClickFunction = param3;
         _onDoubleClickFunction = param4;
         _emblem = new UiGuildEmblem(_content.emblem,null,22,22,null,false,12);
         _tooltip = new UiTextTooltip(_content.topLayer,"",getResultTooltip);
         onClick.add(handleClick);
         onDoubleClick.add(handleDoubleClick);
         useHandCursor = false;
         if(AppConfig.teamLocaleEnabled)
         {
            _content.txtName.x = 56;
            _content.txtName.width = 226;
         }
         else
         {
            _content.iconLocale.visible = false;
         }
      }
      
      override public function dispose() : void
      {
         _emblem.dispose();
         _emblem = null;
         _tooltip.dispose();
         _tooltip = null;
         super.dispose();
      }
      
      public function getResultTooltip() : String
      {
         var _loc2_:int = GameUtil.guildBattleHonorWinReward(User.current.character.guild.honor,_guild.honor);
         var _loc3_:int = GameUtil.guildBattleHonorLostReward(_guild.honor,User.current.character.guild.honor);
         var _loc1_:String = "";
         if(_loc2_ == 0)
         {
            _loc1_ = LocText.current.text("dialog/guild_battle_search/tooltip_win_no_honor");
         }
         else
         {
            _loc1_ = LocText.current.text("dialog/guild_battle_search/tooltip_win_honor",GameUtil.getHonorString(_loc2_));
         }
         _loc1_ = _loc1_ + "\n\n";
         if(_loc3_ == 0)
         {
            _loc1_ = _loc1_ + LocText.current.text("dialog/guild_battle_search/tooltip_lose_no_honor");
         }
         else
         {
            _loc1_ = _loc1_ + LocText.current.text("dialog/guild_battle_search/tooltip_lose_honor",GameUtil.getHonorString(_loc3_));
         }
         return _loc1_;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guild() : GuildBattleSearchResult
      {
         return _guild;
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
      
      public function refresh(param1:GuildBattleSearchResult, param2:int) : void
      {
         _index = param2;
         if(_guild && param1 && _guild.id == param1.id)
         {
            return;
         }
         _guild = param1;
         if(_guild == null)
         {
            _content.visible = false;
            return;
         }
         _emblem.refresh(_guild.emblemSettings);
         _content.visible = true;
         _content.txtName.text = _guild.name;
         _content.txtMemberCount.text = _guild.memberCount.toString();
         _content.txtLevel.text = "~" + LocText.current.formatHugeNumber(_guild.averageLevel);
         _content.txtHonor.text = LocText.current.formatHugeNumber(_guild.honor);
         _content.backgroundEven.visible = _index % 2 == 0;
         _content.backgroundOdd.visible = _index % 2 != 0;
         if(AppConfig.teamLocaleEnabled)
         {
            _content.iconLocale.gotoAndStop(AppAssetUtil.getLocaleFlagIndex(_guild.locale));
         }
      }
   }
}

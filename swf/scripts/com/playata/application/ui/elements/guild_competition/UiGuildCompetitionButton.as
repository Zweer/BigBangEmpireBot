package com.playata.application.ui.elements.guild_competition
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.guild.GuildCompetition;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.guild_competition.SymbolButtonGuildCompetitionGeneric;
   
   public class UiGuildCompetitionButton extends UiButton
   {
       
      
      private var _element:SymbolButtonGuildCompetitionGeneric = null;
      
      private var _showHighlight:Boolean = true;
      
      public function UiGuildCompetitionButton(param1:SymbolButtonGuildCompetitionGeneric, param2:String, param3:Function)
      {
         _element = param1;
         super(param1,param2,param3);
      }
      
      public function refresh(param1:Guild) : void
      {
         var _loc2_:* = null;
         var _loc3_:GuildCompetition = param1.guildCompetition;
         _element.info.visible = false;
         _content.visible = param1.isOwnGuild && _loc3_ != null && _loc3_.isActive;
         if(_content.visible)
         {
            if(_loc3_.score >= CConstant.guild_competition_min_score)
            {
               _element.info.visible = true;
               _element.info.caption.text = LocText.current.formatHugeNumber(_loc3_.rank);
               if(_loc3_.rank > 99)
               {
                  _element.info.bg.x = -2.5;
                  _element.info.bg.width = 25;
               }
               else
               {
                  _element.info.bg.x = 0;
                  _element.info.bg.width = 20;
               }
               tooltip = LocText.current.text("screen/guild/button_guild_competition",LocText.current.formatHugeNumber(_loc3_.score),LocText.current.formatHugeNumber(_loc3_.rank));
            }
            else
            {
               tooltip = LocText.current.text("screen/guild/button_guild_competition_below_min",LocText.current.formatHugeNumber(_loc3_.score),CConstant.guild_competition_min_score);
            }
            if(_loc3_.hasConventionData)
            {
               _loc2_ = _loc3_.conventionStartTimes;
               if(_loc2_ != "")
               {
                  tooltip = tooltip + ("\n\n" + LocText.current.text("screen/guild/button_guild_competition_convention_tooltip",_loc2_,_loc3_.remainingConventionStartTimes));
               }
            }
            if(_showHighlight && _loc3_.remainingSeconds <= 86400)
            {
               _element.highlight.visible = true;
            }
         }
      }
      
      public function disableHighlight() : void
      {
         _showHighlight = false;
         _element.highlight.visible = false;
      }
   }
}

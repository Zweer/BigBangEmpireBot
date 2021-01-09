package com.playata.application.ui.elements.guild
{
   import com.playata.application.data.guild.GuildMember;
   import com.playata.application.ui.elements.generic.list.UiListLine;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.ui.IListItem;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.guild.SymbolGuildLeaderVoteLineGeneric;
   
   public class UiGuildLeaderVoteLine extends UiListLine
   {
       
      
      private var _realContent:SymbolGuildLeaderVoteLineGeneric = null;
      
      public function UiGuildLeaderVoteLine(param1:IListItem, param2:int, param3:SymbolGuildLeaderVoteLineGeneric = null)
      {
         if(!param3)
         {
            _realContent = new SymbolGuildLeaderVoteLineGeneric();
         }
         else
         {
            _realContent = param3;
         }
         super(_realContent,param2);
      }
      
      override public function refresh(param1:IListItem, param2:int) : void
      {
         super.refresh(param1,param2);
         if(param1 == null)
         {
            return;
         }
         var _loc3_:GuildMember = param1 as GuildMember;
         _realContent.txtName.text = _loc3_.name;
         _realContent.txtRank.text = _loc3_.guildRankName;
         _realContent.txtLevel.text = LocText.current.formatHugeNumber(_loc3_.level);
      }
      
      override public function get backgroundHighlight() : IDisplayObject
      {
         return _realContent.backgroundHighlight;
      }
      
      override public function get backgroundEven() : IDisplayObject
      {
         return _realContent.backgroundEven;
      }
      
      override public function get backgroundOdd() : IDisplayObject
      {
         return _realContent.backgroundOdd;
      }
   }
}

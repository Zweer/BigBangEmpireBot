package com.playata.application.ui.elements.guild_competition
{
   import com.playata.application.data.quest.Quest;
   import com.playata.application.ui.elements.citymap.ICitymapQuestButton;
   import com.playata.application.ui.elements.generic.button.UiButtonWrapper;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.movie.SymbolMovieItemGeneric;
   
   public class UiGuildCompetitionItemButton extends UiGuildCompetitionItemReward implements ICitymapQuestButton
   {
       
      
      private var _content:SymbolMovieItemGeneric;
      
      private var _buttonWrapper:UiButtonWrapper;
      
      private var _quest:Quest = null;
      
      private var _callback:Function = null;
      
      public function UiGuildCompetitionItemButton(param1:SymbolMovieItemGeneric, param2:Quest, param3:Function, param4:Function, param5:Function)
      {
         super(param1);
         _content = param1;
         _quest = param2;
         _callback = param3;
         _buttonWrapper = new UiButtonWrapper(_content,handleClick,param4,param5);
      }
      
      public function get quest() : Quest
      {
         return _quest;
      }
      
      override public function dispose() : void
      {
         _content = null;
         _buttonWrapper.dispose();
         _callback = null;
         _quest = null;
         super.dispose();
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         if(_callback != null)
         {
            _callback(this);
         }
      }
   }
}

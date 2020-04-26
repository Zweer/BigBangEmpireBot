package com.playata.application.ui.elements.herobook
{
   import com.playata.application.data.herobook.HerobookItem;
   import com.playata.application.data.quest.Quest;
   import com.playata.application.ui.elements.citymap.ICitymapQuestButton;
   import com.playata.application.ui.elements.generic.button.UiButtonWrapper;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.movie.SymbolMovieItemGeneric;
   
   public class UiHerobookItemButton extends UiHerobookItemReward implements ICitymapQuestButton
   {
       
      
      private var _content:SymbolMovieItemGeneric = null;
      
      private var _buttonWrapper:UiButtonWrapper = null;
      
      private var _quest:Quest = null;
      
      private var _callback:Function = null;
      
      public function UiHerobookItemButton(param1:SymbolMovieItemGeneric, param2:Quest, param3:Function, param4:Function, param5:Function)
      {
         super(param1);
         _content = param1;
         _quest = param2;
         _callback = param3;
         _buttonWrapper = new UiButtonWrapper(_content,handleClick,param4,param5);
      }
      
      override public function dispose() : void
      {
         _content = null;
         _buttonWrapper.dispose();
         _callback = null;
         _quest = null;
         super.dispose();
      }
      
      public function get quest() : Quest
      {
         return _quest;
      }
      
      override public function refresh(param1:String) : void
      {
         var _loc2_:HerobookItem = new HerobookItem(param1);
         _itemGraphic.container.setUriSprite(_loc2_.iconImageUrl,60,60,true,20,null,true);
         if(_tooltip == null)
         {
            _tooltip = new UiHerobookItemRewardTooltip(this,_loc2_);
         }
         (_tooltip as UiHerobookItemRewardTooltip).herobookItem = _loc2_;
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

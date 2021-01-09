package com.playata.application.ui.elements.dating
{
   import com.playata.application.data.dating.DatingItem;
   import com.playata.application.data.quest.Quest;
   import com.playata.application.ui.elements.citymap.ICitymapQuestButton;
   import com.playata.application.ui.elements.generic.button.UiButtonWrapper;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.ui.controls.Tooltip;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.movie.SymbolMovieItemGeneric;
   
   public class UiDatingItemButton extends UiDatingItemReward implements ICitymapQuestButton
   {
       
      
      private var _callback:Function = null;
      
      private var _quest:Quest = null;
      
      private var _buttonWrapper:UiButtonWrapper;
      
      private var _datingTooltip:UiDatingItemRewardTooltip;
      
      public function UiDatingItemButton(param1:SymbolMovieItemGeneric, param2:Quest, param3:Function, param4:Function, param5:Function)
      {
         super(param1);
         _buttonWrapper = new UiButtonWrapper(param1,handleClick,param4,param5);
         _quest = param2;
         _callback = param3;
      }
      
      override public function dispose() : void
      {
         destroy();
         _buttonWrapper.dispose();
         _buttonWrapper = null;
         super.dispose();
      }
      
      public function destroy() : void
      {
         _buttonWrapper.destroy();
         _quest = null;
         if(_datingTooltip != null)
         {
            _datingTooltip.dispose();
            _datingTooltip = null;
         }
      }
      
      override public function set datingItem(param1:String) : void
      {
         var _loc2_:DatingItem = new DatingItem(param1);
         _container.itemPos.setUriSprite(_loc2_.iconImageUrl,60,60,true,15,null,true);
         if(_datingTooltip == null)
         {
            _datingTooltip = new UiDatingItemRewardTooltip(new InteractiveDisplayObject(_container),_loc2_);
         }
         _datingTooltip.datingItem = _loc2_;
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         if(_callback != null)
         {
            _callback(this);
         }
      }
      
      public function get quest() : Quest
      {
         return _quest;
      }
      
      public function get tooltip() : Tooltip
      {
         return _datingTooltip;
      }
      
      public function get displayObject() : IDisplayObject
      {
         return _container;
      }
   }
}

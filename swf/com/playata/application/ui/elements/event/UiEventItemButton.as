package com.playata.application.ui.elements.event
{
   import com.playata.application.data.event.EventItem;
   import com.playata.application.data.quest.Quest;
   import com.playata.application.ui.elements.citymap.ICitymapQuestButton;
   import com.playata.application.ui.elements.generic.button.UiButtonWrapper;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.ui.controls.Tooltip;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.movie.SymbolMovieItemGeneric;
   
   public class UiEventItemButton extends UiEventItemReward implements ICitymapQuestButton
   {
       
      
      private var _buttonWrapper:UiButtonWrapper = null;
      
      private var _callback:Function = null;
      
      private var _quest:Quest = null;
      
      public function UiEventItemButton(param1:SymbolMovieItemGeneric, param2:Quest, param3:Function, param4:Function, param5:Function)
      {
         super(param1);
         _callback = param3;
         _quest = param2;
         _buttonWrapper = new UiButtonWrapper(param1,handleClick,param4,param5);
      }
      
      public function get quest() : Quest
      {
         return _quest;
      }
      
      public function get tooltip() : Tooltip
      {
         return _tooltip;
      }
      
      public function get displayObject() : IDisplayObject
      {
         return _container;
      }
      
      override protected function createTooltip() : void
      {
         _tooltip = new UiEventItemRewardTooltip(_container,null);
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
         _callback = null;
         _quest = null;
      }
      
      override public function set eventItem(param1:String) : void
      {
         var _loc2_:EventItem = new EventItem(param1);
         _container.itemPos.setUriSprite(_loc2_.iconImageUrl,60,60,true,-1,null,true);
         if(_tooltip is UiEventItemRewardTooltip)
         {
            (_tooltip as UiEventItemRewardTooltip).eventItem = _loc2_;
         }
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

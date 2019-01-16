package com.playata.application.ui.elements.event
{
   import com.playata.application.data.event.EventItem;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.display.ui.controls.Tooltip;
   import visuals.ui.elements.movie.SymbolMovieItemGeneric;
   
   public class UiEventItemReward
   {
       
      
      protected var _container:SymbolMovieItemGeneric = null;
      
      protected var _tooltip:Tooltip = null;
      
      public function UiEventItemReward(param1:SymbolMovieItemGeneric)
      {
         super();
         _container = param1;
         createTooltip();
         _container.itemPos.removeAllChildren();
      }
      
      protected function createTooltip() : void
      {
         _tooltip = new UiTextTooltip(_container.tooltipLayer,"");
      }
      
      public function dispose() : void
      {
         _container = null;
         _tooltip.dispose();
         _tooltip = null;
      }
      
      public function set eventItem(param1:String) : void
      {
         var _loc2_:EventItem = new EventItem(param1);
         _container.itemPos.setUriSprite(_loc2_.iconImageUrl,60,60,true,15,null,true);
         if(_tooltip is UiTextTooltip)
         {
            (_tooltip as UiTextTooltip).text = _loc2_.name + "\n\n" + _loc2_.description;
         }
      }
   }
}

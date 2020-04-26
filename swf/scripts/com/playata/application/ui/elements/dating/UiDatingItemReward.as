package com.playata.application.ui.elements.dating
{
   import com.playata.application.data.dating.DatingItem;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import visuals.ui.elements.movie.SymbolMovieItemGeneric;
   
   public class UiDatingItemReward
   {
       
      
      protected var _container:SymbolMovieItemGeneric = null;
      
      protected var _tooltip:UiTextTooltip = null;
      
      public function UiDatingItemReward(param1:SymbolMovieItemGeneric)
      {
         super();
         _container = param1;
         _container.itemPos.removeAllChildren();
      }
      
      public function dispose() : void
      {
         if(_tooltip)
         {
            _tooltip.dispose();
            _tooltip = null;
         }
      }
      
      public function set datingItem(param1:String) : void
      {
         var _loc2_:DatingItem = new DatingItem(param1);
         _container.itemPos.setUriSprite(_loc2_.iconImageUrl,60,60,true,15,null,true);
         if(!_tooltip)
         {
            _tooltip = new UiTextTooltip(_container.tooltipLayer,"");
         }
         _tooltip.text = _loc2_.name + "\n\n" + _loc2_.description;
      }
   }
}

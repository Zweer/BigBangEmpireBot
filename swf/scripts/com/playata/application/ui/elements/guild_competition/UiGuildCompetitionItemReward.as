package com.playata.application.ui.elements.guild_competition
{
   import com.playata.application.data.guild.GuildCompetitionItem;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.ui.controls.Tooltip;
   import visuals.ui.elements.item.SymbolItemGraphicGeneric;
   import visuals.ui.elements.movie.SymbolMovieItemGeneric;
   
   public class UiGuildCompetitionItemReward extends InteractiveDisplayObject
   {
       
      
      protected var _container:SymbolMovieItemGeneric = null;
      
      protected var _tooltip:Tooltip = null;
      
      protected var _itemGraphic:SymbolItemGraphicGeneric;
      
      public function UiGuildCompetitionItemReward(param1:SymbolMovieItemGeneric)
      {
         _container = param1;
         super(_container);
         _container.itemPos.removeAllChildren();
         _itemGraphic = new SymbolItemGraphicGeneric();
         _itemGraphic.txtAmount.visible = false;
         _itemGraphic.container.removeAllChildren();
         _container.itemPos.addChild(_itemGraphic);
      }
      
      override public function dispose() : void
      {
         if(_tooltip)
         {
            _tooltip.dispose();
            _tooltip = null;
         }
         _itemGraphic = null;
         super.dispose();
      }
      
      public function get tooltip() : Tooltip
      {
         return _tooltip;
      }
      
      public function set guildCompetitionItem(param1:String) : void
      {
         var _loc2_:GuildCompetitionItem = new GuildCompetitionItem(param1);
         _itemGraphic.container.setUriSprite(_loc2_.iconImageUrl,60,60,true,20,null,true);
         if(!_tooltip)
         {
            _tooltip = new UiTextTooltip(_container,"");
         }
         (_tooltip as UiTextTooltip).text = _loc2_.name + "\n\n" + _loc2_.description;
      }
   }
}

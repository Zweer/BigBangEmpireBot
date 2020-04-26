package com.playata.application.ui.elements.movie
{
   import com.playata.application.data.item.Item;
   import com.playata.application.data.item_pattern.ItemPattern;
   import com.playata.application.data.item_pattern.ItemPatterns;
   import com.playata.application.data.reward.Reward;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.effects.GlowFilterEffect;
   import com.playata.application.ui.elements.item.UiItemGraphic;
   import com.playata.framework.display.ui.TextFieldAutoAdjustWidthHeight;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.movie.SymbolMovieStarTooltipRewardGeneric;
   
   public class UiMovieStarTooltipReward
   {
       
      
      private var _content:SymbolMovieStarTooltipRewardGeneric;
      
      private var _stars:int;
      
      private var _height:Number;
      
      private var _glowFilterItem:GlowFilterEffect = null;
      
      public function UiMovieStarTooltipReward(param1:SymbolMovieStarTooltipRewardGeneric, param2:int)
      {
         super();
         _content = param1;
         _stars = param2;
         _content.txtSpecial.autoAdjustWidthHeight = TextFieldAutoAdjustWidthHeight.VERTICAL;
         _content.bg.visible = param2 != 2;
      }
      
      public function dispose() : void
      {
         _glowFilterItem.dispose();
         _glowFilterItem = null;
      }
      
      public function refresh(param1:Reward) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:String = "screen/movie_offers/offer_tooltip_stars_" + _stars;
         _content.txtTitle.text = LocText.current.text(_loc4_);
         _content.txtGameCurrency.text = param1.gameCurrencyString;
         _content.txtXP.text = param1.xpString;
         _content.txtSpecial.visible = true;
         _content.iconItemPattern.visible = false;
         if(param1.premiumCurrency > 0)
         {
            _content.txtSpecial.text = param1.premiumCurrencyString;
            _content.iconPremiumCurrency.visible = true;
            _content.iconItem.visible = false;
            _content.iconStatPoint.visible = false;
         }
         else if(param1.statPoints > 0)
         {
            _content.txtSpecial.text = param1.statPointsString;
            _content.iconPremiumCurrency.visible = false;
            _content.iconItem.visible = false;
            _content.iconStatPoint.visible = true;
         }
         else if(param1.itemId > 0)
         {
            _loc2_ = User.current.character.getItemById(param1.itemId);
            _content.txtSpecial.text = _loc2_.name;
            _content.iconPremiumCurrency.visible = false;
            _content.iconItem.visible = true;
            _content.iconStatPoint.visible = false;
            _content.iconItem.icon.setUriSprite(_loc2_.iconImageUrl,25,25,false,9,null,true);
            if(User.current.character.sewingMachineAvailable && User.current.showItemPattern && _loc2_.itemPattern)
            {
               _loc3_ = ItemPatterns.instance.itemPattern(_loc2_.itemPattern);
               if(_loc3_ && !_loc3_.isItemCollected(_loc2_.identifier))
               {
                  _content.iconItemPattern.visible = true;
               }
            }
            _glowFilterItem = UiItemGraphic.getItemGlowEffect(_loc2_.quality,_content.iconItem);
            _glowFilterItem.play();
         }
         else
         {
            _content.txtSpecial.visible = false;
            _content.iconPremiumCurrency.visible = false;
            _content.iconItem.visible = false;
            _content.iconStatPoint.visible = false;
         }
         _height = !!_content.txtSpecial.visible?Math.round(65 + _content.txtSpecial.textHeight):60;
         _content.bg.height = _height + 7;
      }
      
      public function get height() : Number
      {
         return _height;
      }
   }
}

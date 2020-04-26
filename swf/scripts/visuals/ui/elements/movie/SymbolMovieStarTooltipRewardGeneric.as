package visuals.ui.elements.movie
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.conventions.SymbolItemRewardIconGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   import visuals.ui.elements.sewing_machine.SymbolIconItemPatternGeneric;
   
   public class SymbolMovieStarTooltipRewardGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMovieStarTooltipReward = null;
      
      public var bg:SymbolBackgroundMovieRewardTooltipGeneric = null;
      
      public var txtTitle:ILabelArea = null;
      
      public var iconGameCurrency:SymbolIconGameCurrencyGeneric = null;
      
      public var txtGameCurrency:ILabelArea = null;
      
      public var iconXP:SymbolIconXpGeneric = null;
      
      public var txtXP:ILabelArea = null;
      
      public var iconItem:SymbolItemRewardIconGeneric = null;
      
      public var txtSpecial:ILabelArea = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconStatPoint:SymbolIconPlusGeneric = null;
      
      public var iconItemPattern:SymbolIconItemPatternGeneric = null;
      
      public function SymbolMovieStarTooltipRewardGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolMovieStarTooltipReward;
         }
         else
         {
            _nativeObject = new SymbolMovieStarTooltipReward();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolBackgroundMovieRewardTooltipGeneric(_nativeObject.bg);
         txtTitle = FlashLabelArea.fromNative(_nativeObject.txtTitle);
         iconGameCurrency = new SymbolIconGameCurrencyGeneric(_nativeObject.iconGameCurrency);
         txtGameCurrency = FlashLabelArea.fromNative(_nativeObject.txtGameCurrency);
         iconXP = new SymbolIconXpGeneric(_nativeObject.iconXP);
         txtXP = FlashLabelArea.fromNative(_nativeObject.txtXP);
         iconItem = new SymbolItemRewardIconGeneric(_nativeObject.iconItem);
         txtSpecial = FlashLabelArea.fromNative(_nativeObject.txtSpecial);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         iconStatPoint = new SymbolIconPlusGeneric(_nativeObject.iconStatPoint);
         iconItemPattern = new SymbolIconItemPatternGeneric(_nativeObject.iconItemPattern);
      }
      
      public function setNativeInstance(param1:SymbolMovieStarTooltipReward) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.bg)
         {
            bg.setNativeInstance(_nativeObject.bg);
         }
         FlashLabelArea.setNativeInstance(txtTitle,_nativeObject.txtTitle);
         if(_nativeObject.iconGameCurrency)
         {
            iconGameCurrency.setNativeInstance(_nativeObject.iconGameCurrency);
         }
         FlashLabelArea.setNativeInstance(txtGameCurrency,_nativeObject.txtGameCurrency);
         if(_nativeObject.iconXP)
         {
            iconXP.setNativeInstance(_nativeObject.iconXP);
         }
         FlashLabelArea.setNativeInstance(txtXP,_nativeObject.txtXP);
         if(_nativeObject.iconItem)
         {
            iconItem.setNativeInstance(_nativeObject.iconItem);
         }
         FlashLabelArea.setNativeInstance(txtSpecial,_nativeObject.txtSpecial);
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
         if(_nativeObject.iconStatPoint)
         {
            iconStatPoint.setNativeInstance(_nativeObject.iconStatPoint);
         }
         if(_nativeObject.iconItemPattern)
         {
            iconItemPattern.setNativeInstance(_nativeObject.iconItemPattern);
         }
      }
   }
}

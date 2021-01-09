package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   import visuals.ui.elements.movie.SymbolMovieRatingStarsGeneric;
   import visuals.ui.elements.quest.SymbolGlowSmallAnimationGeneric;
   import visuals.ui.elements.streaming.SymbolIconStreamingResourceGeneric;
   
   public class SymbolDialogClaimMovieStarGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogClaimMovieStar = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtStatPointsPremiumCurrency:ILabel = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconStatPoints:SymbolIconPlusGeneric = null;
      
      public var txtStreamingResource:ILabel = null;
      
      public var iconStreamingResource:SymbolIconStreamingResourceGeneric = null;
      
      public var txtCoins:ILabel = null;
      
      public var iconCoins:SymbolIconGameCurrencyGeneric = null;
      
      public var txtXp:ILabel = null;
      
      public var iconXp:SymbolIconXpGeneric = null;
      
      public var itemReward:SymbolItemSlotGeneric = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var glowAnimation:SymbolGlowSmallAnimationGeneric = null;
      
      public var rating:SymbolMovieRatingStarsGeneric = null;
      
      public function SymbolDialogClaimMovieStarGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogClaimMovieStar;
         }
         else
         {
            _nativeObject = new SymbolDialogClaimMovieStar();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtStatPointsPremiumCurrency = FlashLabel.fromNative(_nativeObject.txtStatPointsPremiumCurrency);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         iconStatPoints = new SymbolIconPlusGeneric(_nativeObject.iconStatPoints);
         txtStreamingResource = FlashLabel.fromNative(_nativeObject.txtStreamingResource);
         iconStreamingResource = new SymbolIconStreamingResourceGeneric(_nativeObject.iconStreamingResource);
         txtCoins = FlashLabel.fromNative(_nativeObject.txtCoins);
         iconCoins = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins);
         txtXp = FlashLabel.fromNative(_nativeObject.txtXp);
         iconXp = new SymbolIconXpGeneric(_nativeObject.iconXp);
         itemReward = new SymbolItemSlotGeneric(_nativeObject.itemReward);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         glowAnimation = new SymbolGlowSmallAnimationGeneric(_nativeObject.glowAnimation);
         rating = new SymbolMovieRatingStarsGeneric(_nativeObject.rating);
      }
      
      public function setNativeInstance(param1:SymbolDialogClaimMovieStar) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.dialogBackground)
         {
            dialogBackground.setNativeInstance(_nativeObject.dialogBackground);
         }
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabel.setNativeInstance(txtStatPointsPremiumCurrency,_nativeObject.txtStatPointsPremiumCurrency);
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
         if(_nativeObject.iconStatPoints)
         {
            iconStatPoints.setNativeInstance(_nativeObject.iconStatPoints);
         }
         FlashLabel.setNativeInstance(txtStreamingResource,_nativeObject.txtStreamingResource);
         if(_nativeObject.iconStreamingResource)
         {
            iconStreamingResource.setNativeInstance(_nativeObject.iconStreamingResource);
         }
         FlashLabel.setNativeInstance(txtCoins,_nativeObject.txtCoins);
         if(_nativeObject.iconCoins)
         {
            iconCoins.setNativeInstance(_nativeObject.iconCoins);
         }
         FlashLabel.setNativeInstance(txtXp,_nativeObject.txtXp);
         if(_nativeObject.iconXp)
         {
            iconXp.setNativeInstance(_nativeObject.iconXp);
         }
         if(_nativeObject.itemReward)
         {
            itemReward.setNativeInstance(_nativeObject.itemReward);
         }
         FlashLabel.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         if(_nativeObject.glowAnimation)
         {
            glowAnimation.setNativeInstance(_nativeObject.glowAnimation);
         }
         if(_nativeObject.rating)
         {
            rating.setNativeInstance(_nativeObject.rating);
         }
      }
   }
}

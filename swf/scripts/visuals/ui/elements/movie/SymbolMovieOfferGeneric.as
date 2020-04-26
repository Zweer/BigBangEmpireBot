package visuals.ui.elements.movie
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.base.SymbolUiButtonWideGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.icons.SymbolIconCriticalHitRatingBigGeneric;
   import visuals.ui.elements.icons.SymbolIconDodgeRatingBigGeneric;
   import visuals.ui.elements.icons.SymbolIconStaminaBigGeneric;
   import visuals.ui.elements.icons.SymbolIconStrengthBigGeneric;
   
   public class SymbolMovieOfferGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMovieOffer = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var image:SymbolPlaceholderGeneric = null;
      
      public var symbolBackgroundScalable2:SymbolBackgroundScalableGeneric = null;
      
      public var txtSetting:ILabelArea = null;
      
      public var txtDuration:ILabelArea = null;
      
      public var iconStatStamina:SymbolIconStaminaBigGeneric = null;
      
      public var iconStatStrength:SymbolIconStrengthBigGeneric = null;
      
      public var iconStatCriticalHit:SymbolIconCriticalHitRatingBigGeneric = null;
      
      public var iconStatDodgeRating:SymbolIconDodgeRatingBigGeneric = null;
      
      public var tooltipStat:SymbolDummyGeneric = null;
      
      public var rewards:SymbolMovieRewardsCombinedIconGeneric = null;
      
      public var btnStartMovie:SymbolUiButtonWideGeneric = null;
      
      public var tooltipDuration:SymbolDummyGeneric = null;
      
      public var tooltipSetting:SymbolDummyGeneric = null;
      
      public function SymbolMovieOfferGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolMovieOffer;
         }
         else
         {
            _nativeObject = new SymbolMovieOffer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         image = new SymbolPlaceholderGeneric(_nativeObject.image);
         symbolBackgroundScalable2 = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable2);
         txtSetting = FlashLabelArea.fromNative(_nativeObject.txtSetting);
         txtDuration = FlashLabelArea.fromNative(_nativeObject.txtDuration);
         iconStatStamina = new SymbolIconStaminaBigGeneric(_nativeObject.iconStatStamina);
         iconStatStrength = new SymbolIconStrengthBigGeneric(_nativeObject.iconStatStrength);
         iconStatCriticalHit = new SymbolIconCriticalHitRatingBigGeneric(_nativeObject.iconStatCriticalHit);
         iconStatDodgeRating = new SymbolIconDodgeRatingBigGeneric(_nativeObject.iconStatDodgeRating);
         tooltipStat = new SymbolDummyGeneric(_nativeObject.tooltipStat);
         rewards = new SymbolMovieRewardsCombinedIconGeneric(_nativeObject.rewards);
         btnStartMovie = new SymbolUiButtonWideGeneric(_nativeObject.btnStartMovie);
         tooltipDuration = new SymbolDummyGeneric(_nativeObject.tooltipDuration);
         tooltipSetting = new SymbolDummyGeneric(_nativeObject.tooltipSetting);
      }
      
      public function setNativeInstance(param1:SymbolMovieOffer) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         if(_nativeObject.image)
         {
            image.setNativeInstance(_nativeObject.image);
         }
         if(_nativeObject.symbolBackgroundScalable2)
         {
            symbolBackgroundScalable2.setNativeInstance(_nativeObject.symbolBackgroundScalable2);
         }
         FlashLabelArea.setNativeInstance(txtSetting,_nativeObject.txtSetting);
         FlashLabelArea.setNativeInstance(txtDuration,_nativeObject.txtDuration);
         if(_nativeObject.iconStatStamina)
         {
            iconStatStamina.setNativeInstance(_nativeObject.iconStatStamina);
         }
         if(_nativeObject.iconStatStrength)
         {
            iconStatStrength.setNativeInstance(_nativeObject.iconStatStrength);
         }
         if(_nativeObject.iconStatCriticalHit)
         {
            iconStatCriticalHit.setNativeInstance(_nativeObject.iconStatCriticalHit);
         }
         if(_nativeObject.iconStatDodgeRating)
         {
            iconStatDodgeRating.setNativeInstance(_nativeObject.iconStatDodgeRating);
         }
         if(_nativeObject.tooltipStat)
         {
            tooltipStat.setNativeInstance(_nativeObject.tooltipStat);
         }
         if(_nativeObject.rewards)
         {
            rewards.setNativeInstance(_nativeObject.rewards);
         }
         if(_nativeObject.btnStartMovie)
         {
            btnStartMovie.setNativeInstance(_nativeObject.btnStartMovie);
         }
         if(_nativeObject.tooltipDuration)
         {
            tooltipDuration.setNativeInstance(_nativeObject.tooltipDuration);
         }
         if(_nativeObject.tooltipSetting)
         {
            tooltipSetting.setNativeInstance(_nativeObject.tooltipSetting);
         }
      }
   }
}

package visuals.ui.elements.streaming
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundTooltipGeneric;
   import visuals.ui.elements.goal.SymbolStoryGoalLocationBackgroundGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconGiftGeneric;
   
   public class SymbolStreamingAnimationTooltipGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStreamingAnimationTooltip = null;
      
      public var background:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var backgroundUnlock:SymbolStoryGoalLocationBackgroundGeneric = null;
      
      public var txtRewardMultiplier:ILabel = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var txtTitle:ILabel = null;
      
      public var txtUnlock:ILabelArea = null;
      
      public var txtMultiplierCaption:ILabel = null;
      
      public var iconItem:SymbolIconGiftGeneric = null;
      
      public var iconGameCurrency:SymbolIconGameCurrencyGeneric = null;
      
      public var iconStreamingResource:SymbolIconStreamingResourceGeneric = null;
      
      public function SymbolStreamingAnimationTooltipGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStreamingAnimationTooltip;
         }
         else
         {
            _nativeObject = new SymbolStreamingAnimationTooltip();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.background);
         backgroundUnlock = new SymbolStoryGoalLocationBackgroundGeneric(_nativeObject.backgroundUnlock);
         txtRewardMultiplier = FlashLabel.fromNative(_nativeObject.txtRewardMultiplier);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         txtTitle = FlashLabel.fromNative(_nativeObject.txtTitle);
         txtUnlock = FlashLabelArea.fromNative(_nativeObject.txtUnlock);
         txtMultiplierCaption = FlashLabel.fromNative(_nativeObject.txtMultiplierCaption);
         iconItem = new SymbolIconGiftGeneric(_nativeObject.iconItem);
         iconGameCurrency = new SymbolIconGameCurrencyGeneric(_nativeObject.iconGameCurrency);
         iconStreamingResource = new SymbolIconStreamingResourceGeneric(_nativeObject.iconStreamingResource);
      }
      
      public function setNativeInstance(param1:SymbolStreamingAnimationTooltip) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         if(_nativeObject.backgroundUnlock)
         {
            backgroundUnlock.setNativeInstance(_nativeObject.backgroundUnlock);
         }
         FlashLabel.setNativeInstance(txtRewardMultiplier,_nativeObject.txtRewardMultiplier);
         FlashLabel.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         FlashLabel.setNativeInstance(txtTitle,_nativeObject.txtTitle);
         FlashLabelArea.setNativeInstance(txtUnlock,_nativeObject.txtUnlock);
         FlashLabel.setNativeInstance(txtMultiplierCaption,_nativeObject.txtMultiplierCaption);
         if(_nativeObject.iconItem)
         {
            iconItem.setNativeInstance(_nativeObject.iconItem);
         }
         if(_nativeObject.iconGameCurrency)
         {
            iconGameCurrency.setNativeInstance(_nativeObject.iconGameCurrency);
         }
         if(_nativeObject.iconStreamingResource)
         {
            iconStreamingResource.setNativeInstance(_nativeObject.iconStreamingResource);
         }
      }
   }
}

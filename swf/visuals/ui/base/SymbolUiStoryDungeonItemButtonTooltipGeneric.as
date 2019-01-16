package visuals.ui.base
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
   import visuals.ui.elements.conventions.SymbolItemRewardIconGeneric;
   import visuals.ui.elements.generic.SymbolProgressBarBigGeneric;
   
   public class SymbolUiStoryDungeonItemButtonTooltipGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUiStoryDungeonItemButtonTooltip = null;
      
      public var background:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var progressBar:SymbolProgressBarBigGeneric = null;
      
      public var txtName:ILabelArea = null;
      
      public var captionProgress:ILabelArea = null;
      
      public var txtProgress:ILabelArea = null;
      
      public var captionReward:ILabelArea = null;
      
      public var iconItem:SymbolItemRewardIconGeneric = null;
      
      public var txtReward:ILabel = null;
      
      public function SymbolUiStoryDungeonItemButtonTooltipGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUiStoryDungeonItemButtonTooltip;
         }
         else
         {
            _nativeObject = new SymbolUiStoryDungeonItemButtonTooltip();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.background);
         progressBar = new SymbolProgressBarBigGeneric(_nativeObject.progressBar);
         txtName = FlashLabelArea.fromNative(_nativeObject.txtName);
         captionProgress = FlashLabelArea.fromNative(_nativeObject.captionProgress);
         txtProgress = FlashLabelArea.fromNative(_nativeObject.txtProgress);
         captionReward = FlashLabelArea.fromNative(_nativeObject.captionReward);
         iconItem = new SymbolItemRewardIconGeneric(_nativeObject.iconItem);
         txtReward = FlashLabel.fromNative(_nativeObject.txtReward);
      }
      
      public function setNativeInstance(param1:SymbolUiStoryDungeonItemButtonTooltip) : void
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
         if(_nativeObject.progressBar)
         {
            progressBar.setNativeInstance(_nativeObject.progressBar);
         }
         FlashLabelArea.setNativeInstance(txtName,_nativeObject.txtName);
         FlashLabelArea.setNativeInstance(captionProgress,_nativeObject.captionProgress);
         FlashLabelArea.setNativeInstance(txtProgress,_nativeObject.txtProgress);
         FlashLabelArea.setNativeInstance(captionReward,_nativeObject.captionReward);
         if(_nativeObject.iconItem)
         {
            iconItem.setNativeInstance(_nativeObject.iconItem);
         }
         FlashLabel.setNativeInstance(txtReward,_nativeObject.txtReward);
      }
   }
}

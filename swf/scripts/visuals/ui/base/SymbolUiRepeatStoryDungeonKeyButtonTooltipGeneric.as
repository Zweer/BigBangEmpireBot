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
   
   public class SymbolUiRepeatStoryDungeonKeyButtonTooltipGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUiRepeatStoryDungeonKeyButtonTooltip = null;
      
      public var background:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var txtDescription:ILabelArea = null;
      
      public var captionName:ILabelArea = null;
      
      public var captionReward:ILabelArea = null;
      
      public var iconItem:SymbolItemRewardIconGeneric = null;
      
      public var txtReward:ILabel = null;
      
      public function SymbolUiRepeatStoryDungeonKeyButtonTooltipGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUiRepeatStoryDungeonKeyButtonTooltip;
         }
         else
         {
            _nativeObject = new SymbolUiRepeatStoryDungeonKeyButtonTooltip();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.background);
         txtDescription = FlashLabelArea.fromNative(_nativeObject.txtDescription);
         captionName = FlashLabelArea.fromNative(_nativeObject.captionName);
         captionReward = FlashLabelArea.fromNative(_nativeObject.captionReward);
         iconItem = new SymbolItemRewardIconGeneric(_nativeObject.iconItem);
         txtReward = FlashLabel.fromNative(_nativeObject.txtReward);
      }
      
      public function setNativeInstance(param1:SymbolUiRepeatStoryDungeonKeyButtonTooltip) : void
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
         FlashLabelArea.setNativeInstance(txtDescription,_nativeObject.txtDescription);
         FlashLabelArea.setNativeInstance(captionName,_nativeObject.captionName);
         FlashLabelArea.setNativeInstance(captionReward,_nativeObject.captionReward);
         if(_nativeObject.iconItem)
         {
            iconItem.setNativeInstance(_nativeObject.iconItem);
         }
         FlashLabel.setNativeInstance(txtReward,_nativeObject.txtReward);
      }
   }
}

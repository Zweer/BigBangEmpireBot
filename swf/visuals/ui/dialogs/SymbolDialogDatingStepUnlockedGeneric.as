package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.dating.SymbolDatingDialogMessageBubbleGeneric;
   import visuals.ui.elements.dating.SymbolDatingHearthGeneric;
   import visuals.ui.elements.dating.SymbolDatingStepRewardGeneric;
   
   public class SymbolDialogDatingStepUnlockedGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogDatingStepUnlocked = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var txtDialogTitle:ILabelArea = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var reward:SymbolDatingStepRewardGeneric = null;
      
      public var bg:SymbolBackgroundScalableGeneric = null;
      
      public var hearth1:SymbolDatingHearthGeneric = null;
      
      public var hearth2:SymbolDatingHearthGeneric = null;
      
      public var hearth3:SymbolDatingHearthGeneric = null;
      
      public var hearth4:SymbolDatingHearthGeneric = null;
      
      public var hearth5:SymbolDatingHearthGeneric = null;
      
      public var girl:SymbolPlaceholderGeneric = null;
      
      public var balloon:SymbolDatingDialogMessageBubbleGeneric = null;
      
      public function SymbolDialogDatingStepUnlockedGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogDatingStepUnlocked;
         }
         else
         {
            _nativeObject = new SymbolDialogDatingStepUnlocked();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         txtDialogTitle = FlashLabelArea.fromNative(_nativeObject.txtDialogTitle);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         reward = new SymbolDatingStepRewardGeneric(_nativeObject.reward);
         bg = new SymbolBackgroundScalableGeneric(_nativeObject.bg);
         hearth1 = new SymbolDatingHearthGeneric(_nativeObject.hearth1);
         hearth2 = new SymbolDatingHearthGeneric(_nativeObject.hearth2);
         hearth3 = new SymbolDatingHearthGeneric(_nativeObject.hearth3);
         hearth4 = new SymbolDatingHearthGeneric(_nativeObject.hearth4);
         hearth5 = new SymbolDatingHearthGeneric(_nativeObject.hearth5);
         girl = new SymbolPlaceholderGeneric(_nativeObject.girl);
         balloon = new SymbolDatingDialogMessageBubbleGeneric(_nativeObject.balloon);
      }
      
      public function setNativeInstance(param1:SymbolDialogDatingStepUnlocked) : void
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
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabelArea.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         if(_nativeObject.reward)
         {
            reward.setNativeInstance(_nativeObject.reward);
         }
         if(_nativeObject.bg)
         {
            bg.setNativeInstance(_nativeObject.bg);
         }
         if(_nativeObject.hearth1)
         {
            hearth1.setNativeInstance(_nativeObject.hearth1);
         }
         if(_nativeObject.hearth2)
         {
            hearth2.setNativeInstance(_nativeObject.hearth2);
         }
         if(_nativeObject.hearth3)
         {
            hearth3.setNativeInstance(_nativeObject.hearth3);
         }
         if(_nativeObject.hearth4)
         {
            hearth4.setNativeInstance(_nativeObject.hearth4);
         }
         if(_nativeObject.hearth5)
         {
            hearth5.setNativeInstance(_nativeObject.hearth5);
         }
         if(_nativeObject.girl)
         {
            girl.setNativeInstance(_nativeObject.girl);
         }
         if(_nativeObject.balloon)
         {
            balloon.setNativeInstance(_nativeObject.balloon);
         }
      }
   }
}

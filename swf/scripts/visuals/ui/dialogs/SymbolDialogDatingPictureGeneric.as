package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundTooltipGeneric;
   import visuals.ui.elements.buttons.SymbolButtonDatingMaximizeGeneric;
   import visuals.ui.elements.buttons.SymbolButtonDatingMinimizeGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.dating.SymbolButtonDatingArrowGeneric;
   import visuals.ui.elements.dating.SymbolButtonDatingCloseGeneric;
   import visuals.ui.elements.dating.SymbolDatingPictureDialogMessageGeneric;
   
   public class SymbolDialogDatingPictureGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogDatingPicture = null;
      
      public var background:SymbolBackgroundScalableGeneric = null;
      
      public var girl:SymbolPlaceholderGeneric = null;
      
      public var upgradeBackground:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var btnUpgrade:SymbolButtonPremiumGeneric = null;
      
      public var txtUpgrade:ILabelArea = null;
      
      public var message:SymbolDatingPictureDialogMessageGeneric = null;
      
      public var btnClose:SymbolButtonDatingCloseGeneric = null;
      
      public var btnHideMessage:SymbolButtonDatingMinimizeGeneric = null;
      
      public var btnShowMessage:SymbolButtonDatingMaximizeGeneric = null;
      
      public var btnLeft:SymbolButtonDatingArrowGeneric = null;
      
      public var btnRight:SymbolButtonDatingArrowGeneric = null;
      
      public function SymbolDialogDatingPictureGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogDatingPicture;
         }
         else
         {
            _nativeObject = new SymbolDialogDatingPicture();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolBackgroundScalableGeneric(_nativeObject.background);
         girl = new SymbolPlaceholderGeneric(_nativeObject.girl);
         upgradeBackground = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.upgradeBackground);
         btnUpgrade = new SymbolButtonPremiumGeneric(_nativeObject.btnUpgrade);
         txtUpgrade = FlashLabelArea.fromNative(_nativeObject.txtUpgrade);
         message = new SymbolDatingPictureDialogMessageGeneric(_nativeObject.message);
         btnClose = new SymbolButtonDatingCloseGeneric(_nativeObject.btnClose);
         btnHideMessage = new SymbolButtonDatingMinimizeGeneric(_nativeObject.btnHideMessage);
         btnShowMessage = new SymbolButtonDatingMaximizeGeneric(_nativeObject.btnShowMessage);
         btnLeft = new SymbolButtonDatingArrowGeneric(_nativeObject.btnLeft);
         btnRight = new SymbolButtonDatingArrowGeneric(_nativeObject.btnRight);
      }
      
      public function setNativeInstance(param1:SymbolDialogDatingPicture) : void
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
         if(_nativeObject.girl)
         {
            girl.setNativeInstance(_nativeObject.girl);
         }
         if(_nativeObject.upgradeBackground)
         {
            upgradeBackground.setNativeInstance(_nativeObject.upgradeBackground);
         }
         if(_nativeObject.btnUpgrade)
         {
            btnUpgrade.setNativeInstance(_nativeObject.btnUpgrade);
         }
         FlashLabelArea.setNativeInstance(txtUpgrade,_nativeObject.txtUpgrade);
         if(_nativeObject.message)
         {
            message.setNativeInstance(_nativeObject.message);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnHideMessage)
         {
            btnHideMessage.setNativeInstance(_nativeObject.btnHideMessage);
         }
         if(_nativeObject.btnShowMessage)
         {
            btnShowMessage.setNativeInstance(_nativeObject.btnShowMessage);
         }
         if(_nativeObject.btnLeft)
         {
            btnLeft.setNativeInstance(_nativeObject.btnLeft);
         }
         if(_nativeObject.btnRight)
         {
            btnRight.setNativeInstance(_nativeObject.btnRight);
         }
      }
   }
}

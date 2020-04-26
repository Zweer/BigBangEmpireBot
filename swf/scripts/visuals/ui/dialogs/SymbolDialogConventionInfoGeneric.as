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
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonHelpGeneric;
   import visuals.ui.elements.conventions.SymbolConventionInfoRewardsGeneric;
   import visuals.ui.elements.conventions.SymbolConventionPhoneGeneric;
   
   public class SymbolDialogConventionInfoGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogConventionInfo = null;
      
      public var conventionBannerRight:SymbolPlaceholderGeneric = null;
      
      public var conventionBannerLeft:SymbolPlaceholderGeneric = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var phone:SymbolConventionPhoneGeneric = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var txtDialogTitle:ILabelArea = null;
      
      public var txtCallerName:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtRewards:ILabelArea = null;
      
      public var rewards:SymbolConventionInfoRewardsGeneric = null;
      
      public var btnHelp:SymbolButtonHelpGeneric = null;
      
      public function SymbolDialogConventionInfoGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogConventionInfo;
         }
         else
         {
            _nativeObject = new SymbolDialogConventionInfo();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         conventionBannerRight = new SymbolPlaceholderGeneric(_nativeObject.conventionBannerRight);
         conventionBannerLeft = new SymbolPlaceholderGeneric(_nativeObject.conventionBannerLeft);
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         phone = new SymbolConventionPhoneGeneric(_nativeObject.phone);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         txtDialogTitle = FlashLabelArea.fromNative(_nativeObject.txtDialogTitle);
         txtCallerName = FlashLabel.fromNative(_nativeObject.txtCallerName);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtRewards = FlashLabelArea.fromNative(_nativeObject.txtRewards);
         rewards = new SymbolConventionInfoRewardsGeneric(_nativeObject.rewards);
         btnHelp = new SymbolButtonHelpGeneric(_nativeObject.btnHelp);
      }
      
      public function setNativeInstance(param1:SymbolDialogConventionInfo) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.conventionBannerRight)
         {
            conventionBannerRight.setNativeInstance(_nativeObject.conventionBannerRight);
         }
         if(_nativeObject.conventionBannerLeft)
         {
            conventionBannerLeft.setNativeInstance(_nativeObject.conventionBannerLeft);
         }
         if(_nativeObject.dialogBackground)
         {
            dialogBackground.setNativeInstance(_nativeObject.dialogBackground);
         }
         if(_nativeObject.phone)
         {
            phone.setNativeInstance(_nativeObject.phone);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabelArea.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabel.setNativeInstance(txtCallerName,_nativeObject.txtCallerName);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabelArea.setNativeInstance(txtRewards,_nativeObject.txtRewards);
         if(_nativeObject.rewards)
         {
            rewards.setNativeInstance(_nativeObject.rewards);
         }
         if(_nativeObject.btnHelp)
         {
            btnHelp.setNativeInstance(_nativeObject.btnHelp);
         }
      }
   }
}

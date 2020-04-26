package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.fan_foto.SymbolFanFotoOfferGeneric;
   import visuals.ui.elements.fan_foto.SymbolFanFotoProgressBarGeneric;
   import visuals.ui.elements.fan_foto.SymbolIconFanFotoTagGeneric;
   
   public class SymbolDialogFanFotoUnlockFotoGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogFanFotoUnlockFoto = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var offerNotRandom:SymbolFanFotoOfferGeneric = null;
      
      public var offerRandom25:SymbolFanFotoOfferGeneric = null;
      
      public var offerRandom:SymbolFanFotoOfferGeneric = null;
      
      public var backgroundQuest:SymbolBackgroundScalableGeneric = null;
      
      public var symbolIconFanFotoTag:SymbolIconFanFotoTagGeneric = null;
      
      public var txtTagCaption:ILabel = null;
      
      public var txtTags:ILabel = null;
      
      public var iconTag1:SymbolIconFanFotoTagGeneric = null;
      
      public var txtTag1:ILabel = null;
      
      public var iconTag2:SymbolIconFanFotoTagGeneric = null;
      
      public var txtTag2:ILabel = null;
      
      public var iconTag3:SymbolIconFanFotoTagGeneric = null;
      
      public var txtTag3:ILabel = null;
      
      public var iconTag4:SymbolIconFanFotoTagGeneric = null;
      
      public var txtTag4:ILabel = null;
      
      public var btnEditTags:SymbolUiButtonDefaultGeneric = null;
      
      public var fanFotoResourceBar:SymbolFanFotoProgressBarGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public function SymbolDialogFanFotoUnlockFotoGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogFanFotoUnlockFoto;
         }
         else
         {
            _nativeObject = new SymbolDialogFanFotoUnlockFoto();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         offerNotRandom = new SymbolFanFotoOfferGeneric(_nativeObject.offerNotRandom);
         offerRandom25 = new SymbolFanFotoOfferGeneric(_nativeObject.offerRandom25);
         offerRandom = new SymbolFanFotoOfferGeneric(_nativeObject.offerRandom);
         backgroundQuest = new SymbolBackgroundScalableGeneric(_nativeObject.backgroundQuest);
         symbolIconFanFotoTag = new SymbolIconFanFotoTagGeneric(_nativeObject.symbolIconFanFotoTag);
         txtTagCaption = FlashLabel.fromNative(_nativeObject.txtTagCaption);
         txtTags = FlashLabel.fromNative(_nativeObject.txtTags);
         iconTag1 = new SymbolIconFanFotoTagGeneric(_nativeObject.iconTag1);
         txtTag1 = FlashLabel.fromNative(_nativeObject.txtTag1);
         iconTag2 = new SymbolIconFanFotoTagGeneric(_nativeObject.iconTag2);
         txtTag2 = FlashLabel.fromNative(_nativeObject.txtTag2);
         iconTag3 = new SymbolIconFanFotoTagGeneric(_nativeObject.iconTag3);
         txtTag3 = FlashLabel.fromNative(_nativeObject.txtTag3);
         iconTag4 = new SymbolIconFanFotoTagGeneric(_nativeObject.iconTag4);
         txtTag4 = FlashLabel.fromNative(_nativeObject.txtTag4);
         btnEditTags = new SymbolUiButtonDefaultGeneric(_nativeObject.btnEditTags);
         fanFotoResourceBar = new SymbolFanFotoProgressBarGeneric(_nativeObject.fanFotoResourceBar);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
      }
      
      public function setNativeInstance(param1:SymbolDialogFanFotoUnlockFoto) : void
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
         if(_nativeObject.offerNotRandom)
         {
            offerNotRandom.setNativeInstance(_nativeObject.offerNotRandom);
         }
         if(_nativeObject.offerRandom25)
         {
            offerRandom25.setNativeInstance(_nativeObject.offerRandom25);
         }
         if(_nativeObject.offerRandom)
         {
            offerRandom.setNativeInstance(_nativeObject.offerRandom);
         }
         if(_nativeObject.backgroundQuest)
         {
            backgroundQuest.setNativeInstance(_nativeObject.backgroundQuest);
         }
         if(_nativeObject.symbolIconFanFotoTag)
         {
            symbolIconFanFotoTag.setNativeInstance(_nativeObject.symbolIconFanFotoTag);
         }
         FlashLabel.setNativeInstance(txtTagCaption,_nativeObject.txtTagCaption);
         FlashLabel.setNativeInstance(txtTags,_nativeObject.txtTags);
         if(_nativeObject.iconTag1)
         {
            iconTag1.setNativeInstance(_nativeObject.iconTag1);
         }
         FlashLabel.setNativeInstance(txtTag1,_nativeObject.txtTag1);
         if(_nativeObject.iconTag2)
         {
            iconTag2.setNativeInstance(_nativeObject.iconTag2);
         }
         FlashLabel.setNativeInstance(txtTag2,_nativeObject.txtTag2);
         if(_nativeObject.iconTag3)
         {
            iconTag3.setNativeInstance(_nativeObject.iconTag3);
         }
         FlashLabel.setNativeInstance(txtTag3,_nativeObject.txtTag3);
         if(_nativeObject.iconTag4)
         {
            iconTag4.setNativeInstance(_nativeObject.iconTag4);
         }
         FlashLabel.setNativeInstance(txtTag4,_nativeObject.txtTag4);
         if(_nativeObject.btnEditTags)
         {
            btnEditTags.setNativeInstance(_nativeObject.btnEditTags);
         }
         if(_nativeObject.fanFotoResourceBar)
         {
            fanFotoResourceBar.setNativeInstance(_nativeObject.fanFotoResourceBar);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
      }
   }
}

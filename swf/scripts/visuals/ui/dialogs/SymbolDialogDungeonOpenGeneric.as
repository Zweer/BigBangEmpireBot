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
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.dungeon.SymbolDungeonPhotoBigGeneric;
   import visuals.ui.elements.icons.SymbolIconDungeonTicketGeneric;
   import visuals.ui.elements.icons.SymbolIconDurationGeneric;
   import visuals.ui.elements.icons.SymbolIconFansGeneric;
   import visuals.ui.elements.icons.SymbolIconLevelStarGeneric;
   
   public class SymbolDialogDungeonOpenGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogDungeonOpen = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnOpen:SymbolButtonPremiumGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var txtDungeonName:ILabelArea = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtDungeonGeneric:ILabel = null;
      
      public var symbolIconDungeonTicket:SymbolIconDungeonTicketGeneric = null;
      
      public var txtDungeonKey:ILabel = null;
      
      public var symbolIconDuration:SymbolIconDurationGeneric = null;
      
      public var txtDuration:ILabel = null;
      
      public var symbolIconLevelStar:SymbolIconLevelStarGeneric = null;
      
      public var txtMissions:ILabel = null;
      
      public var txtInfoCaption:ILabel = null;
      
      public var txtRequirementsCaption:ILabel = null;
      
      public var symbolIconFans:SymbolIconFansGeneric = null;
      
      public var txtFans:ILabel = null;
      
      public var photo:SymbolDungeonPhotoBigGeneric = null;
      
      public function SymbolDialogDungeonOpenGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogDungeonOpen;
         }
         else
         {
            _nativeObject = new SymbolDialogDungeonOpen();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnOpen = new SymbolButtonPremiumGeneric(_nativeObject.btnOpen);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         txtDungeonName = FlashLabelArea.fromNative(_nativeObject.txtDungeonName);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtDungeonGeneric = FlashLabel.fromNative(_nativeObject.txtDungeonGeneric);
         symbolIconDungeonTicket = new SymbolIconDungeonTicketGeneric(_nativeObject.symbolIconDungeonTicket);
         txtDungeonKey = FlashLabel.fromNative(_nativeObject.txtDungeonKey);
         symbolIconDuration = new SymbolIconDurationGeneric(_nativeObject.symbolIconDuration);
         txtDuration = FlashLabel.fromNative(_nativeObject.txtDuration);
         symbolIconLevelStar = new SymbolIconLevelStarGeneric(_nativeObject.symbolIconLevelStar);
         txtMissions = FlashLabel.fromNative(_nativeObject.txtMissions);
         txtInfoCaption = FlashLabel.fromNative(_nativeObject.txtInfoCaption);
         txtRequirementsCaption = FlashLabel.fromNative(_nativeObject.txtRequirementsCaption);
         symbolIconFans = new SymbolIconFansGeneric(_nativeObject.symbolIconFans);
         txtFans = FlashLabel.fromNative(_nativeObject.txtFans);
         photo = new SymbolDungeonPhotoBigGeneric(_nativeObject.photo);
      }
      
      public function setNativeInstance(param1:SymbolDialogDungeonOpen) : void
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
         if(_nativeObject.btnOpen)
         {
            btnOpen.setNativeInstance(_nativeObject.btnOpen);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabelArea.setNativeInstance(txtDungeonName,_nativeObject.txtDungeonName);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabel.setNativeInstance(txtDungeonGeneric,_nativeObject.txtDungeonGeneric);
         if(_nativeObject.symbolIconDungeonTicket)
         {
            symbolIconDungeonTicket.setNativeInstance(_nativeObject.symbolIconDungeonTicket);
         }
         FlashLabel.setNativeInstance(txtDungeonKey,_nativeObject.txtDungeonKey);
         if(_nativeObject.symbolIconDuration)
         {
            symbolIconDuration.setNativeInstance(_nativeObject.symbolIconDuration);
         }
         FlashLabel.setNativeInstance(txtDuration,_nativeObject.txtDuration);
         if(_nativeObject.symbolIconLevelStar)
         {
            symbolIconLevelStar.setNativeInstance(_nativeObject.symbolIconLevelStar);
         }
         FlashLabel.setNativeInstance(txtMissions,_nativeObject.txtMissions);
         FlashLabel.setNativeInstance(txtInfoCaption,_nativeObject.txtInfoCaption);
         FlashLabel.setNativeInstance(txtRequirementsCaption,_nativeObject.txtRequirementsCaption);
         if(_nativeObject.symbolIconFans)
         {
            symbolIconFans.setNativeInstance(_nativeObject.symbolIconFans);
         }
         FlashLabel.setNativeInstance(txtFans,_nativeObject.txtFans);
         if(_nativeObject.photo)
         {
            photo.setNativeInstance(_nativeObject.photo);
         }
      }
   }
}

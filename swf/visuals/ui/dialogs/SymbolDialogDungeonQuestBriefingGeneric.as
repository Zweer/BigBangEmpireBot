package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.buttons.SymbolButtonUseResourceGeneric;
   import visuals.ui.elements.buttons.SymbolButtonVideoAdvertismentGeneric;
   import visuals.ui.elements.dungeon.SymbolDungeonQuestBriefingContentGeneric;
   
   public class SymbolDialogDungeonQuestBriefingGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogDungeonQuestBriefing = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnStartDungeonQuest:SymbolButtonPremiumGeneric = null;
      
      public var txtCooldown:ILabel = null;
      
      public var dungeonQuestContent:SymbolDungeonQuestBriefingContentGeneric = null;
      
      public var btnShowVideoAdvertisment:SymbolButtonVideoAdvertismentGeneric = null;
      
      public var btnUseResource:SymbolButtonUseResourceGeneric = null;
      
      public function SymbolDialogDungeonQuestBriefingGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogDungeonQuestBriefing;
         }
         else
         {
            _nativeObject = new SymbolDialogDungeonQuestBriefing();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnStartDungeonQuest = new SymbolButtonPremiumGeneric(_nativeObject.btnStartDungeonQuest);
         txtCooldown = FlashLabel.fromNative(_nativeObject.txtCooldown);
         dungeonQuestContent = new SymbolDungeonQuestBriefingContentGeneric(_nativeObject.dungeonQuestContent);
         btnShowVideoAdvertisment = new SymbolButtonVideoAdvertismentGeneric(_nativeObject.btnShowVideoAdvertisment);
         btnUseResource = new SymbolButtonUseResourceGeneric(_nativeObject.btnUseResource);
      }
      
      public function setNativeInstance(param1:SymbolDialogDungeonQuestBriefing) : void
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
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnStartDungeonQuest)
         {
            btnStartDungeonQuest.setNativeInstance(_nativeObject.btnStartDungeonQuest);
         }
         FlashLabel.setNativeInstance(txtCooldown,_nativeObject.txtCooldown);
         if(_nativeObject.dungeonQuestContent)
         {
            dungeonQuestContent.setNativeInstance(_nativeObject.dungeonQuestContent);
         }
         if(_nativeObject.btnShowVideoAdvertisment)
         {
            btnShowVideoAdvertisment.setNativeInstance(_nativeObject.btnShowVideoAdvertisment);
         }
         if(_nativeObject.btnUseResource)
         {
            btnUseResource.setNativeInstance(_nativeObject.btnUseResource);
         }
      }
   }
}

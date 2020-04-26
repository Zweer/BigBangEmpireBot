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
   import visuals.ui.elements.quest.SymbolQuestRefreshOptionGeneric;
   
   public class SymbolDialogRefreshQuestsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogRefreshQuests = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var option1:SymbolQuestRefreshOptionGeneric = null;
      
      public var option2:SymbolQuestRefreshOptionGeneric = null;
      
      public function SymbolDialogRefreshQuestsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogRefreshQuests;
         }
         else
         {
            _nativeObject = new SymbolDialogRefreshQuests();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         option1 = new SymbolQuestRefreshOptionGeneric(_nativeObject.option1);
         option2 = new SymbolQuestRefreshOptionGeneric(_nativeObject.option2);
      }
      
      public function setNativeInstance(param1:SymbolDialogRefreshQuests) : void
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
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         if(_nativeObject.option1)
         {
            option1.setNativeInstance(_nativeObject.option1);
         }
         if(_nativeObject.option2)
         {
            option2.setNativeInstance(_nativeObject.option2);
         }
      }
   }
}

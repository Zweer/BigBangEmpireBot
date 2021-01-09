package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.story_dungeon.SymbolStoryDungeonRewardGeneric;
   import visuals.ui.elements.story_dungeon.SymbolStoryDungeonUnlockBossGeneric;
   
   public class SymbolDialogStoryDungeonUnlockedGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogStoryDungeonUnlocked = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var txtDialogTitle:ILabelArea = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var reward:SymbolStoryDungeonRewardGeneric = null;
      
      public var boss:SymbolStoryDungeonUnlockBossGeneric = null;
      
      public function SymbolDialogStoryDungeonUnlockedGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogStoryDungeonUnlocked;
         }
         else
         {
            _nativeObject = new SymbolDialogStoryDungeonUnlocked();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         txtDialogTitle = FlashLabelArea.fromNative(_nativeObject.txtDialogTitle);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         reward = new SymbolStoryDungeonRewardGeneric(_nativeObject.reward);
         boss = new SymbolStoryDungeonUnlockBossGeneric(_nativeObject.boss);
      }
      
      public function setNativeInstance(param1:SymbolDialogStoryDungeonUnlocked) : void
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
         if(_nativeObject.boss)
         {
            boss.setNativeInstance(_nativeObject.boss);
         }
      }
   }
}

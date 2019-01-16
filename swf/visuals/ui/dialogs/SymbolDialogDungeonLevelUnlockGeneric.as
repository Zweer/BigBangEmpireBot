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
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.dungeon.SymbolButtonToWorldmapGeneric;
   import visuals.ui.elements.dungeon.SymbolDungeonPhotoSmallGeneric;
   import visuals.ui.elements.icons.SymbolIconCheckmarkGeneric;
   import visuals.ui.elements.icons.SymbolIconFansGeneric;
   import visuals.ui.elements.icons.SymbolIconLockBigGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   
   public class SymbolDialogDungeonLevelUnlockGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogDungeonLevelUnlock = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var photo:SymbolDungeonPhotoSmallGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtRequirementsCaption:ILabel = null;
      
      public var itemReward:SymbolItemSlotGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var btnStartLevel:SymbolButtonPremiumGeneric = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var symbolIconFans:SymbolIconFansGeneric = null;
      
      public var txtFans:ILabelArea = null;
      
      public var lock:SymbolIconLockBigGeneric = null;
      
      public var iconCheckmark:SymbolIconCheckmarkGeneric = null;
      
      public var btnLeaveDungeon:SymbolButtonToWorldmapGeneric = null;
      
      public var npc:SymbolPlaceholderGeneric = null;
      
      public function SymbolDialogDungeonLevelUnlockGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogDungeonLevelUnlock;
         }
         else
         {
            _nativeObject = new SymbolDialogDungeonLevelUnlock();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         photo = new SymbolDungeonPhotoSmallGeneric(_nativeObject.photo);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtRequirementsCaption = FlashLabel.fromNative(_nativeObject.txtRequirementsCaption);
         itemReward = new SymbolItemSlotGeneric(_nativeObject.itemReward);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         btnStartLevel = new SymbolButtonPremiumGeneric(_nativeObject.btnStartLevel);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         symbolIconFans = new SymbolIconFansGeneric(_nativeObject.symbolIconFans);
         txtFans = FlashLabelArea.fromNative(_nativeObject.txtFans);
         lock = new SymbolIconLockBigGeneric(_nativeObject.lock);
         iconCheckmark = new SymbolIconCheckmarkGeneric(_nativeObject.iconCheckmark);
         btnLeaveDungeon = new SymbolButtonToWorldmapGeneric(_nativeObject.btnLeaveDungeon);
         npc = new SymbolPlaceholderGeneric(_nativeObject.npc);
      }
      
      public function setNativeInstance(param1:SymbolDialogDungeonLevelUnlock) : void
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
         if(_nativeObject.photo)
         {
            photo.setNativeInstance(_nativeObject.photo);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabel.setNativeInstance(txtRequirementsCaption,_nativeObject.txtRequirementsCaption);
         if(_nativeObject.itemReward)
         {
            itemReward.setNativeInstance(_nativeObject.itemReward);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         if(_nativeObject.btnStartLevel)
         {
            btnStartLevel.setNativeInstance(_nativeObject.btnStartLevel);
         }
         FlashLabel.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         if(_nativeObject.symbolIconFans)
         {
            symbolIconFans.setNativeInstance(_nativeObject.symbolIconFans);
         }
         FlashLabelArea.setNativeInstance(txtFans,_nativeObject.txtFans);
         if(_nativeObject.lock)
         {
            lock.setNativeInstance(_nativeObject.lock);
         }
         if(_nativeObject.iconCheckmark)
         {
            iconCheckmark.setNativeInstance(_nativeObject.iconCheckmark);
         }
         if(_nativeObject.btnLeaveDungeon)
         {
            btnLeaveDungeon.setNativeInstance(_nativeObject.btnLeaveDungeon);
         }
         if(_nativeObject.npc)
         {
            npc.setNativeInstance(_nativeObject.npc);
         }
      }
   }
}

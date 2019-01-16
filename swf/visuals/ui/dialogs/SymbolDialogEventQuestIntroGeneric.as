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
   import visuals.ui.elements.event.SymbolEventQuestItemRewardGeneric;
   import visuals.ui.elements.event.SymbolEventQuestRewardGeneric;
   
   public class SymbolDialogEventQuestIntroGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogEventQuestIntro = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtCallerName:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtRewardInfo:ILabelArea = null;
      
      public var reward1:SymbolEventQuestRewardGeneric = null;
      
      public var reward2:SymbolEventQuestRewardGeneric = null;
      
      public var itemReward1:SymbolEventQuestItemRewardGeneric = null;
      
      public var itemReward2:SymbolEventQuestItemRewardGeneric = null;
      
      public var itemReward3:SymbolEventQuestItemRewardGeneric = null;
      
      public var reward3:SymbolEventQuestRewardGeneric = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var logo:SymbolPlaceholderGeneric = null;
      
      public function SymbolDialogEventQuestIntroGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogEventQuestIntro;
         }
         else
         {
            _nativeObject = new SymbolDialogEventQuestIntro();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtCallerName = FlashLabel.fromNative(_nativeObject.txtCallerName);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtRewardInfo = FlashLabelArea.fromNative(_nativeObject.txtRewardInfo);
         reward1 = new SymbolEventQuestRewardGeneric(_nativeObject.reward1);
         reward2 = new SymbolEventQuestRewardGeneric(_nativeObject.reward2);
         itemReward1 = new SymbolEventQuestItemRewardGeneric(_nativeObject.itemReward1);
         itemReward2 = new SymbolEventQuestItemRewardGeneric(_nativeObject.itemReward2);
         itemReward3 = new SymbolEventQuestItemRewardGeneric(_nativeObject.itemReward3);
         reward3 = new SymbolEventQuestRewardGeneric(_nativeObject.reward3);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         logo = new SymbolPlaceholderGeneric(_nativeObject.logo);
      }
      
      public function setNativeInstance(param1:SymbolDialogEventQuestIntro) : void
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
         FlashLabel.setNativeInstance(txtCallerName,_nativeObject.txtCallerName);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabelArea.setNativeInstance(txtRewardInfo,_nativeObject.txtRewardInfo);
         if(_nativeObject.reward1)
         {
            reward1.setNativeInstance(_nativeObject.reward1);
         }
         if(_nativeObject.reward2)
         {
            reward2.setNativeInstance(_nativeObject.reward2);
         }
         if(_nativeObject.itemReward1)
         {
            itemReward1.setNativeInstance(_nativeObject.itemReward1);
         }
         if(_nativeObject.itemReward2)
         {
            itemReward2.setNativeInstance(_nativeObject.itemReward2);
         }
         if(_nativeObject.itemReward3)
         {
            itemReward3.setNativeInstance(_nativeObject.itemReward3);
         }
         if(_nativeObject.reward3)
         {
            reward3.setNativeInstance(_nativeObject.reward3);
         }
         FlashLabel.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         if(_nativeObject.logo)
         {
            logo.setNativeInstance(_nativeObject.logo);
         }
      }
   }
}

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
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.battle_skills.SymbolBattleSkillGenerationResultGeneric;
   import visuals.ui.elements.battle_skills.SymbolRerollCustomizeItemResultGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   
   public class SymbolDialogCustomizeItemResultGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogCustomizeItemResult = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var skill1:SymbolBattleSkillGenerationResultGeneric = null;
      
      public var skill3:SymbolBattleSkillGenerationResultGeneric = null;
      
      public var skill2:SymbolBattleSkillGenerationResultGeneric = null;
      
      public var effectLayerContainer:SymbolDummyGeneric = null;
      
      public var itemSlot:SymbolItemSlotGeneric = null;
      
      public var reroll:SymbolRerollCustomizeItemResultGeneric = null;
      
      public function SymbolDialogCustomizeItemResultGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogCustomizeItemResult;
         }
         else
         {
            _nativeObject = new SymbolDialogCustomizeItemResult();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         skill1 = new SymbolBattleSkillGenerationResultGeneric(_nativeObject.skill1);
         skill3 = new SymbolBattleSkillGenerationResultGeneric(_nativeObject.skill3);
         skill2 = new SymbolBattleSkillGenerationResultGeneric(_nativeObject.skill2);
         effectLayerContainer = new SymbolDummyGeneric(_nativeObject.effectLayerContainer);
         itemSlot = new SymbolItemSlotGeneric(_nativeObject.itemSlot);
         reroll = new SymbolRerollCustomizeItemResultGeneric(_nativeObject.reroll);
      }
      
      public function setNativeInstance(param1:SymbolDialogCustomizeItemResult) : void
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
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         if(_nativeObject.skill1)
         {
            skill1.setNativeInstance(_nativeObject.skill1);
         }
         if(_nativeObject.skill3)
         {
            skill3.setNativeInstance(_nativeObject.skill3);
         }
         if(_nativeObject.skill2)
         {
            skill2.setNativeInstance(_nativeObject.skill2);
         }
         if(_nativeObject.effectLayerContainer)
         {
            effectLayerContainer.setNativeInstance(_nativeObject.effectLayerContainer);
         }
         if(_nativeObject.itemSlot)
         {
            itemSlot.setNativeInstance(_nativeObject.itemSlot);
         }
         if(_nativeObject.reroll)
         {
            reroll.setNativeInstance(_nativeObject.reroll);
         }
      }
   }
}

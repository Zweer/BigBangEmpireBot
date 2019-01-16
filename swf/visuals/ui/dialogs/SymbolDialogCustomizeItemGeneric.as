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
   import visuals.ui.elements.battle_skills.SymbolBattleSkillGeneric;
   import visuals.ui.elements.battle_skills.SymbolSkillHoverGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   
   public class SymbolDialogCustomizeItemGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogCustomizeItem = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnCustomize:SymbolButtonPremiumGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var itemSlot:SymbolItemSlotGeneric = null;
      
      public var iconSpecial1Hover:SymbolSkillHoverGeneric = null;
      
      public var iconSpecial2Hover:SymbolSkillHoverGeneric = null;
      
      public var iconBonus1Hover:SymbolSkillHoverGeneric = null;
      
      public var iconBonus2Hover:SymbolSkillHoverGeneric = null;
      
      public var iconBonus3Hover:SymbolSkillHoverGeneric = null;
      
      public var iconBonus4Hover:SymbolSkillHoverGeneric = null;
      
      public var txtTitleBonus:ILabel = null;
      
      public var iconBonus1:SymbolBattleSkillGeneric = null;
      
      public var iconBonus2:SymbolBattleSkillGeneric = null;
      
      public var iconBonus3:SymbolBattleSkillGeneric = null;
      
      public var iconBonus4:SymbolBattleSkillGeneric = null;
      
      public var txtTitleSpecials:ILabel = null;
      
      public var iconSpecial1:SymbolBattleSkillGeneric = null;
      
      public var iconSpecial2:SymbolBattleSkillGeneric = null;
      
      public function SymbolDialogCustomizeItemGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogCustomizeItem;
         }
         else
         {
            _nativeObject = new SymbolDialogCustomizeItem();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnCustomize = new SymbolButtonPremiumGeneric(_nativeObject.btnCustomize);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         itemSlot = new SymbolItemSlotGeneric(_nativeObject.itemSlot);
         iconSpecial1Hover = new SymbolSkillHoverGeneric(_nativeObject.iconSpecial1Hover);
         iconSpecial2Hover = new SymbolSkillHoverGeneric(_nativeObject.iconSpecial2Hover);
         iconBonus1Hover = new SymbolSkillHoverGeneric(_nativeObject.iconBonus1Hover);
         iconBonus2Hover = new SymbolSkillHoverGeneric(_nativeObject.iconBonus2Hover);
         iconBonus3Hover = new SymbolSkillHoverGeneric(_nativeObject.iconBonus3Hover);
         iconBonus4Hover = new SymbolSkillHoverGeneric(_nativeObject.iconBonus4Hover);
         txtTitleBonus = FlashLabel.fromNative(_nativeObject.txtTitleBonus);
         iconBonus1 = new SymbolBattleSkillGeneric(_nativeObject.iconBonus1);
         iconBonus2 = new SymbolBattleSkillGeneric(_nativeObject.iconBonus2);
         iconBonus3 = new SymbolBattleSkillGeneric(_nativeObject.iconBonus3);
         iconBonus4 = new SymbolBattleSkillGeneric(_nativeObject.iconBonus4);
         txtTitleSpecials = FlashLabel.fromNative(_nativeObject.txtTitleSpecials);
         iconSpecial1 = new SymbolBattleSkillGeneric(_nativeObject.iconSpecial1);
         iconSpecial2 = new SymbolBattleSkillGeneric(_nativeObject.iconSpecial2);
      }
      
      public function setNativeInstance(param1:SymbolDialogCustomizeItem) : void
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
         if(_nativeObject.btnCustomize)
         {
            btnCustomize.setNativeInstance(_nativeObject.btnCustomize);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         if(_nativeObject.itemSlot)
         {
            itemSlot.setNativeInstance(_nativeObject.itemSlot);
         }
         if(_nativeObject.iconSpecial1Hover)
         {
            iconSpecial1Hover.setNativeInstance(_nativeObject.iconSpecial1Hover);
         }
         if(_nativeObject.iconSpecial2Hover)
         {
            iconSpecial2Hover.setNativeInstance(_nativeObject.iconSpecial2Hover);
         }
         if(_nativeObject.iconBonus1Hover)
         {
            iconBonus1Hover.setNativeInstance(_nativeObject.iconBonus1Hover);
         }
         if(_nativeObject.iconBonus2Hover)
         {
            iconBonus2Hover.setNativeInstance(_nativeObject.iconBonus2Hover);
         }
         if(_nativeObject.iconBonus3Hover)
         {
            iconBonus3Hover.setNativeInstance(_nativeObject.iconBonus3Hover);
         }
         if(_nativeObject.iconBonus4Hover)
         {
            iconBonus4Hover.setNativeInstance(_nativeObject.iconBonus4Hover);
         }
         FlashLabel.setNativeInstance(txtTitleBonus,_nativeObject.txtTitleBonus);
         if(_nativeObject.iconBonus1)
         {
            iconBonus1.setNativeInstance(_nativeObject.iconBonus1);
         }
         if(_nativeObject.iconBonus2)
         {
            iconBonus2.setNativeInstance(_nativeObject.iconBonus2);
         }
         if(_nativeObject.iconBonus3)
         {
            iconBonus3.setNativeInstance(_nativeObject.iconBonus3);
         }
         if(_nativeObject.iconBonus4)
         {
            iconBonus4.setNativeInstance(_nativeObject.iconBonus4);
         }
         FlashLabel.setNativeInstance(txtTitleSpecials,_nativeObject.txtTitleSpecials);
         if(_nativeObject.iconSpecial1)
         {
            iconSpecial1.setNativeInstance(_nativeObject.iconSpecial1);
         }
         if(_nativeObject.iconSpecial2)
         {
            iconSpecial2.setNativeInstance(_nativeObject.iconSpecial2);
         }
      }
   }
}

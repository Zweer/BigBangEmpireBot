package visuals.ui.elements.outfit
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonMediumGeneric;
   import visuals.ui.elements.avatar.SymbolAvatarGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.battle_skills.SymbolBattleSkillBattleIconGeneric;
   import visuals.ui.elements.battle_skills.SymbolStatsBattleSkillBackgroundsGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowBottomGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowTopGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   import visuals.ui.elements.goal.SymbolGoalExclamationMarkGeneric;
   import visuals.ui.elements.icons.SymbolIconCriticalHitRatingGeneric;
   import visuals.ui.elements.icons.SymbolIconDodgeRatingGeneric;
   import visuals.ui.elements.icons.SymbolIconStaminaGeneric;
   import visuals.ui.elements.icons.SymbolIconStrengthGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   
   public class SymbolOutfitContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolOutfitContent = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var txtDefaultEquipInfo:ILabelArea = null;
      
      public var btnEquip:SymbolUiButtonMediumGeneric = null;
      
      public var btnSettings:SymbolIconButtonOutfitSettingsGeneric = null;
      
      public var btnRename:SymbolIconButtonRenameOutfitGeneric = null;
      
      public var btnSave:SymbolIconButtonSaveOutfitGeneric = null;
      
      public var avatar:SymbolAvatarGeneric = null;
      
      public var btnTop:SymbolButtonArrowTopGeneric = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public var btnBottom:SymbolButtonArrowBottomGeneric = null;
      
      public var itemHead:SymbolItemSlotGeneric = null;
      
      public var itemChest:SymbolItemSlotGeneric = null;
      
      public var itemBelt:SymbolItemSlotGeneric = null;
      
      public var itemLegs:SymbolItemSlotGeneric = null;
      
      public var itemBoots:SymbolItemSlotGeneric = null;
      
      public var itemNecklace:SymbolItemSlotGeneric = null;
      
      public var itemRing:SymbolItemSlotGeneric = null;
      
      public var itemPiercing:SymbolItemSlotGeneric = null;
      
      public var itemGadget:SymbolItemSlotGeneric = null;
      
      public var iconExclamationMarkHead:SymbolGoalExclamationMarkGeneric = null;
      
      public var iconExclamationMarkChest:SymbolGoalExclamationMarkGeneric = null;
      
      public var iconExclamationMarkBelt:SymbolGoalExclamationMarkGeneric = null;
      
      public var iconExclamationMarkLegs:SymbolGoalExclamationMarkGeneric = null;
      
      public var iconExclamationMarkBoots:SymbolGoalExclamationMarkGeneric = null;
      
      public var iconExclamationMarkNecklace:SymbolGoalExclamationMarkGeneric = null;
      
      public var iconExclamationMarkRing:SymbolGoalExclamationMarkGeneric = null;
      
      public var iconExclamationMarkPiercing:SymbolGoalExclamationMarkGeneric = null;
      
      public var iconExclamationMarkGadget:SymbolGoalExclamationMarkGeneric = null;
      
      public var txtName:ILabel = null;
      
      public var iconStrength:SymbolIconStrengthGeneric = null;
      
      public var txtStatStrength:ILabel = null;
      
      public var iconCriticalRating:SymbolIconDodgeRatingGeneric = null;
      
      public var txtStatCriticalRating:ILabel = null;
      
      public var iconStamina:SymbolIconStaminaGeneric = null;
      
      public var txtStatStamina:ILabel = null;
      
      public var iconDodgeRating:SymbolIconCriticalHitRatingGeneric = null;
      
      public var txtStatDodgeRating:ILabel = null;
      
      public var txtCompareStrength:ILabel = null;
      
      public var txtCompareCriticalRating:ILabel = null;
      
      public var txtCompareStamina:ILabel = null;
      
      public var txtCompareDodgeRating:ILabel = null;
      
      public var skillBackgrounds:SymbolStatsBattleSkillBackgroundsGeneric = null;
      
      public var skill2:SymbolBattleSkillBattleIconGeneric = null;
      
      public var skill3:SymbolBattleSkillBattleIconGeneric = null;
      
      public var skill4:SymbolBattleSkillBattleIconGeneric = null;
      
      public var skill5:SymbolBattleSkillBattleIconGeneric = null;
      
      public var skill6:SymbolBattleSkillBattleIconGeneric = null;
      
      public var skill7:SymbolBattleSkillBattleIconGeneric = null;
      
      public var skill8:SymbolBattleSkillBattleIconGeneric = null;
      
      public var skill9:SymbolBattleSkillBattleIconGeneric = null;
      
      public var skill1:SymbolBattleSkillBattleIconGeneric = null;
      
      public var txtStats:ILabel = null;
      
      public var txtCompare:ILabel = null;
      
      public function SymbolOutfitContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolOutfitContent;
         }
         else
         {
            _nativeObject = new SymbolOutfitContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         txtDefaultEquipInfo = FlashLabelArea.fromNative(_nativeObject.txtDefaultEquipInfo);
         btnEquip = new SymbolUiButtonMediumGeneric(_nativeObject.btnEquip);
         btnSettings = new SymbolIconButtonOutfitSettingsGeneric(_nativeObject.btnSettings);
         btnRename = new SymbolIconButtonRenameOutfitGeneric(_nativeObject.btnRename);
         btnSave = new SymbolIconButtonSaveOutfitGeneric(_nativeObject.btnSave);
         avatar = new SymbolAvatarGeneric(_nativeObject.avatar);
         btnTop = new SymbolButtonArrowTopGeneric(_nativeObject.btnTop);
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
         btnBottom = new SymbolButtonArrowBottomGeneric(_nativeObject.btnBottom);
         itemHead = new SymbolItemSlotGeneric(_nativeObject.itemHead);
         itemChest = new SymbolItemSlotGeneric(_nativeObject.itemChest);
         itemBelt = new SymbolItemSlotGeneric(_nativeObject.itemBelt);
         itemLegs = new SymbolItemSlotGeneric(_nativeObject.itemLegs);
         itemBoots = new SymbolItemSlotGeneric(_nativeObject.itemBoots);
         itemNecklace = new SymbolItemSlotGeneric(_nativeObject.itemNecklace);
         itemRing = new SymbolItemSlotGeneric(_nativeObject.itemRing);
         itemPiercing = new SymbolItemSlotGeneric(_nativeObject.itemPiercing);
         itemGadget = new SymbolItemSlotGeneric(_nativeObject.itemGadget);
         iconExclamationMarkHead = new SymbolGoalExclamationMarkGeneric(_nativeObject.iconExclamationMarkHead);
         iconExclamationMarkChest = new SymbolGoalExclamationMarkGeneric(_nativeObject.iconExclamationMarkChest);
         iconExclamationMarkBelt = new SymbolGoalExclamationMarkGeneric(_nativeObject.iconExclamationMarkBelt);
         iconExclamationMarkLegs = new SymbolGoalExclamationMarkGeneric(_nativeObject.iconExclamationMarkLegs);
         iconExclamationMarkBoots = new SymbolGoalExclamationMarkGeneric(_nativeObject.iconExclamationMarkBoots);
         iconExclamationMarkNecklace = new SymbolGoalExclamationMarkGeneric(_nativeObject.iconExclamationMarkNecklace);
         iconExclamationMarkRing = new SymbolGoalExclamationMarkGeneric(_nativeObject.iconExclamationMarkRing);
         iconExclamationMarkPiercing = new SymbolGoalExclamationMarkGeneric(_nativeObject.iconExclamationMarkPiercing);
         iconExclamationMarkGadget = new SymbolGoalExclamationMarkGeneric(_nativeObject.iconExclamationMarkGadget);
         txtName = FlashLabel.fromNative(_nativeObject.txtName);
         iconStrength = new SymbolIconStrengthGeneric(_nativeObject.iconStrength);
         txtStatStrength = FlashLabel.fromNative(_nativeObject.txtStatStrength);
         iconCriticalRating = new SymbolIconDodgeRatingGeneric(_nativeObject.iconCriticalRating);
         txtStatCriticalRating = FlashLabel.fromNative(_nativeObject.txtStatCriticalRating);
         iconStamina = new SymbolIconStaminaGeneric(_nativeObject.iconStamina);
         txtStatStamina = FlashLabel.fromNative(_nativeObject.txtStatStamina);
         iconDodgeRating = new SymbolIconCriticalHitRatingGeneric(_nativeObject.iconDodgeRating);
         txtStatDodgeRating = FlashLabel.fromNative(_nativeObject.txtStatDodgeRating);
         txtCompareStrength = FlashLabel.fromNative(_nativeObject.txtCompareStrength);
         txtCompareCriticalRating = FlashLabel.fromNative(_nativeObject.txtCompareCriticalRating);
         txtCompareStamina = FlashLabel.fromNative(_nativeObject.txtCompareStamina);
         txtCompareDodgeRating = FlashLabel.fromNative(_nativeObject.txtCompareDodgeRating);
         skillBackgrounds = new SymbolStatsBattleSkillBackgroundsGeneric(_nativeObject.skillBackgrounds);
         skill2 = new SymbolBattleSkillBattleIconGeneric(_nativeObject.skill2);
         skill3 = new SymbolBattleSkillBattleIconGeneric(_nativeObject.skill3);
         skill4 = new SymbolBattleSkillBattleIconGeneric(_nativeObject.skill4);
         skill5 = new SymbolBattleSkillBattleIconGeneric(_nativeObject.skill5);
         skill6 = new SymbolBattleSkillBattleIconGeneric(_nativeObject.skill6);
         skill7 = new SymbolBattleSkillBattleIconGeneric(_nativeObject.skill7);
         skill8 = new SymbolBattleSkillBattleIconGeneric(_nativeObject.skill8);
         skill9 = new SymbolBattleSkillBattleIconGeneric(_nativeObject.skill9);
         skill1 = new SymbolBattleSkillBattleIconGeneric(_nativeObject.skill1);
         txtStats = FlashLabel.fromNative(_nativeObject.txtStats);
         txtCompare = FlashLabel.fromNative(_nativeObject.txtCompare);
      }
      
      public function setNativeInstance(param1:SymbolOutfitContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         FlashLabelArea.setNativeInstance(txtDefaultEquipInfo,_nativeObject.txtDefaultEquipInfo);
         if(_nativeObject.btnEquip)
         {
            btnEquip.setNativeInstance(_nativeObject.btnEquip);
         }
         if(_nativeObject.btnSettings)
         {
            btnSettings.setNativeInstance(_nativeObject.btnSettings);
         }
         if(_nativeObject.btnRename)
         {
            btnRename.setNativeInstance(_nativeObject.btnRename);
         }
         if(_nativeObject.btnSave)
         {
            btnSave.setNativeInstance(_nativeObject.btnSave);
         }
         if(_nativeObject.avatar)
         {
            avatar.setNativeInstance(_nativeObject.avatar);
         }
         if(_nativeObject.btnTop)
         {
            btnTop.setNativeInstance(_nativeObject.btnTop);
         }
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
         }
         if(_nativeObject.btnBottom)
         {
            btnBottom.setNativeInstance(_nativeObject.btnBottom);
         }
         if(_nativeObject.itemHead)
         {
            itemHead.setNativeInstance(_nativeObject.itemHead);
         }
         if(_nativeObject.itemChest)
         {
            itemChest.setNativeInstance(_nativeObject.itemChest);
         }
         if(_nativeObject.itemBelt)
         {
            itemBelt.setNativeInstance(_nativeObject.itemBelt);
         }
         if(_nativeObject.itemLegs)
         {
            itemLegs.setNativeInstance(_nativeObject.itemLegs);
         }
         if(_nativeObject.itemBoots)
         {
            itemBoots.setNativeInstance(_nativeObject.itemBoots);
         }
         if(_nativeObject.itemNecklace)
         {
            itemNecklace.setNativeInstance(_nativeObject.itemNecklace);
         }
         if(_nativeObject.itemRing)
         {
            itemRing.setNativeInstance(_nativeObject.itemRing);
         }
         if(_nativeObject.itemPiercing)
         {
            itemPiercing.setNativeInstance(_nativeObject.itemPiercing);
         }
         if(_nativeObject.itemGadget)
         {
            itemGadget.setNativeInstance(_nativeObject.itemGadget);
         }
         if(_nativeObject.iconExclamationMarkHead)
         {
            iconExclamationMarkHead.setNativeInstance(_nativeObject.iconExclamationMarkHead);
         }
         if(_nativeObject.iconExclamationMarkChest)
         {
            iconExclamationMarkChest.setNativeInstance(_nativeObject.iconExclamationMarkChest);
         }
         if(_nativeObject.iconExclamationMarkBelt)
         {
            iconExclamationMarkBelt.setNativeInstance(_nativeObject.iconExclamationMarkBelt);
         }
         if(_nativeObject.iconExclamationMarkLegs)
         {
            iconExclamationMarkLegs.setNativeInstance(_nativeObject.iconExclamationMarkLegs);
         }
         if(_nativeObject.iconExclamationMarkBoots)
         {
            iconExclamationMarkBoots.setNativeInstance(_nativeObject.iconExclamationMarkBoots);
         }
         if(_nativeObject.iconExclamationMarkNecklace)
         {
            iconExclamationMarkNecklace.setNativeInstance(_nativeObject.iconExclamationMarkNecklace);
         }
         if(_nativeObject.iconExclamationMarkRing)
         {
            iconExclamationMarkRing.setNativeInstance(_nativeObject.iconExclamationMarkRing);
         }
         if(_nativeObject.iconExclamationMarkPiercing)
         {
            iconExclamationMarkPiercing.setNativeInstance(_nativeObject.iconExclamationMarkPiercing);
         }
         if(_nativeObject.iconExclamationMarkGadget)
         {
            iconExclamationMarkGadget.setNativeInstance(_nativeObject.iconExclamationMarkGadget);
         }
         FlashLabel.setNativeInstance(txtName,_nativeObject.txtName);
         if(_nativeObject.iconStrength)
         {
            iconStrength.setNativeInstance(_nativeObject.iconStrength);
         }
         FlashLabel.setNativeInstance(txtStatStrength,_nativeObject.txtStatStrength);
         if(_nativeObject.iconCriticalRating)
         {
            iconCriticalRating.setNativeInstance(_nativeObject.iconCriticalRating);
         }
         FlashLabel.setNativeInstance(txtStatCriticalRating,_nativeObject.txtStatCriticalRating);
         if(_nativeObject.iconStamina)
         {
            iconStamina.setNativeInstance(_nativeObject.iconStamina);
         }
         FlashLabel.setNativeInstance(txtStatStamina,_nativeObject.txtStatStamina);
         if(_nativeObject.iconDodgeRating)
         {
            iconDodgeRating.setNativeInstance(_nativeObject.iconDodgeRating);
         }
         FlashLabel.setNativeInstance(txtStatDodgeRating,_nativeObject.txtStatDodgeRating);
         FlashLabel.setNativeInstance(txtCompareStrength,_nativeObject.txtCompareStrength);
         FlashLabel.setNativeInstance(txtCompareCriticalRating,_nativeObject.txtCompareCriticalRating);
         FlashLabel.setNativeInstance(txtCompareStamina,_nativeObject.txtCompareStamina);
         FlashLabel.setNativeInstance(txtCompareDodgeRating,_nativeObject.txtCompareDodgeRating);
         if(_nativeObject.skillBackgrounds)
         {
            skillBackgrounds.setNativeInstance(_nativeObject.skillBackgrounds);
         }
         if(_nativeObject.skill2)
         {
            skill2.setNativeInstance(_nativeObject.skill2);
         }
         if(_nativeObject.skill3)
         {
            skill3.setNativeInstance(_nativeObject.skill3);
         }
         if(_nativeObject.skill4)
         {
            skill4.setNativeInstance(_nativeObject.skill4);
         }
         if(_nativeObject.skill5)
         {
            skill5.setNativeInstance(_nativeObject.skill5);
         }
         if(_nativeObject.skill6)
         {
            skill6.setNativeInstance(_nativeObject.skill6);
         }
         if(_nativeObject.skill7)
         {
            skill7.setNativeInstance(_nativeObject.skill7);
         }
         if(_nativeObject.skill8)
         {
            skill8.setNativeInstance(_nativeObject.skill8);
         }
         if(_nativeObject.skill9)
         {
            skill9.setNativeInstance(_nativeObject.skill9);
         }
         if(_nativeObject.skill1)
         {
            skill1.setNativeInstance(_nativeObject.skill1);
         }
         FlashLabel.setNativeInstance(txtStats,_nativeObject.txtStats);
         FlashLabel.setNativeInstance(txtCompare,_nativeObject.txtCompare);
      }
   }
}

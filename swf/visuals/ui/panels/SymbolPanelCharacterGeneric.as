package visuals.ui.panels
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolCharacterNameGeneric;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.application.SymbolCharacterInfoBoxGeneric;
   import visuals.ui.elements.avatar.SymbolAvatarGeneric;
   import visuals.ui.elements.buttons.SymbolButtonHelpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonNarrowTabGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.buttons.SymbolButtonToggleUiGeneric;
   import visuals.ui.elements.icons.SymbolIconBoxGeneric;
   import visuals.ui.elements.icons.SymbolIconHideItemGeneric;
   import visuals.ui.elements.icons.SymbolIconOutfitInfoGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   import visuals.ui.elements.optical_changes.SymbolOpticalChangeCurrencyGeneric;
   import visuals.ui.elements.outfit.SymbolIconButtonOutfitsGeneric;
   import visuals.ui.elements.stats.SymbolStatsGeneric;
   
   public class SymbolPanelCharacterGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPanelCharacter = null;
      
      public var background:SymbolDummyGeneric = null;
      
      public var avatar:SymbolAvatarGeneric = null;
      
      public var itemSlotChest:SymbolItemSlotGeneric = null;
      
      public var itemSlotBelt:SymbolItemSlotGeneric = null;
      
      public var itemSlotLegs:SymbolItemSlotGeneric = null;
      
      public var iconOutfitInfo:SymbolIconOutfitInfoGeneric = null;
      
      public var itemSlotBoots:SymbolItemSlotGeneric = null;
      
      public var itemSlotRing:SymbolItemSlotGeneric = null;
      
      public var itemSlotNecklace:SymbolItemSlotGeneric = null;
      
      public var itemSlotHead:SymbolItemSlotGeneric = null;
      
      public var iconHeadItemHidden:SymbolIconHideItemGeneric = null;
      
      public var iconChestItemHidden:SymbolIconHideItemGeneric = null;
      
      public var iconBeltItemHidden:SymbolIconHideItemGeneric = null;
      
      public var iconLegsItemHidden:SymbolIconHideItemGeneric = null;
      
      public var iconBootsItemHidden:SymbolIconHideItemGeneric = null;
      
      public var itemSlotGadget:SymbolItemSlotGeneric = null;
      
      public var itemSlotPiercing:SymbolItemSlotGeneric = null;
      
      public var itemSlotMissiles:SymbolItemSlotGeneric = null;
      
      public var btnTabBag1:SymbolButtonNarrowTabGeneric = null;
      
      public var btnTabBag2:SymbolButtonNarrowTabGeneric = null;
      
      public var btnTabBag3:SymbolButtonNarrowTabGeneric = null;
      
      public var iconBox:SymbolIconBoxGeneric = null;
      
      public var inventorySlot1:SymbolItemSlotGeneric = null;
      
      public var inventorySlot2:SymbolItemSlotGeneric = null;
      
      public var inventorySlot3:SymbolItemSlotGeneric = null;
      
      public var inventorySlot4:SymbolItemSlotGeneric = null;
      
      public var inventorySlot5:SymbolItemSlotGeneric = null;
      
      public var inventorySlot6:SymbolItemSlotGeneric = null;
      
      public var inventorySlot7:SymbolItemSlotGeneric = null;
      
      public var inventorySlot8:SymbolItemSlotGeneric = null;
      
      public var inventorySlot9:SymbolItemSlotGeneric = null;
      
      public var inventorySlot10:SymbolItemSlotGeneric = null;
      
      public var inventorySlot11:SymbolItemSlotGeneric = null;
      
      public var inventorySlot12:SymbolItemSlotGeneric = null;
      
      public var inventorySlot13:SymbolItemSlotGeneric = null;
      
      public var inventorySlot14:SymbolItemSlotGeneric = null;
      
      public var inventorySlot15:SymbolItemSlotGeneric = null;
      
      public var inventorySlot16:SymbolItemSlotGeneric = null;
      
      public var inventorySlot17:SymbolItemSlotGeneric = null;
      
      public var inventorySlot18:SymbolItemSlotGeneric = null;
      
      public var stats:SymbolStatsGeneric = null;
      
      public var statsComparison:SymbolStatsGeneric = null;
      
      public var txtOwnStats:ILabelArea = null;
      
      public var characterName:SymbolCharacterNameGeneric = null;
      
      public var btnOutfits:SymbolIconButtonOutfitsGeneric = null;
      
      public var characterLayer:SymbolDummyGeneric = null;
      
      public var txtTimeToNextAttack:ILabel = null;
      
      public var btnAttack:SymbolButtonPremiumGeneric = null;
      
      public var infoBox:SymbolCharacterInfoBoxGeneric = null;
      
      public var opticalChangePanel:SymbolOpticalChangeCurrencyGeneric = null;
      
      public var btnToggleUi:SymbolButtonToggleUiGeneric = null;
      
      public var btnHelp:SymbolButtonHelpGeneric = null;
      
      public var dragLayer:SymbolDummyGeneric = null;
      
      public function SymbolPanelCharacterGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPanelCharacter;
         }
         else
         {
            _nativeObject = new SymbolPanelCharacter();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolDummyGeneric(_nativeObject.background);
         avatar = new SymbolAvatarGeneric(_nativeObject.avatar);
         itemSlotChest = new SymbolItemSlotGeneric(_nativeObject.itemSlotChest);
         itemSlotBelt = new SymbolItemSlotGeneric(_nativeObject.itemSlotBelt);
         itemSlotLegs = new SymbolItemSlotGeneric(_nativeObject.itemSlotLegs);
         iconOutfitInfo = new SymbolIconOutfitInfoGeneric(_nativeObject.iconOutfitInfo);
         itemSlotBoots = new SymbolItemSlotGeneric(_nativeObject.itemSlotBoots);
         itemSlotRing = new SymbolItemSlotGeneric(_nativeObject.itemSlotRing);
         itemSlotNecklace = new SymbolItemSlotGeneric(_nativeObject.itemSlotNecklace);
         itemSlotHead = new SymbolItemSlotGeneric(_nativeObject.itemSlotHead);
         iconHeadItemHidden = new SymbolIconHideItemGeneric(_nativeObject.iconHeadItemHidden);
         iconChestItemHidden = new SymbolIconHideItemGeneric(_nativeObject.iconChestItemHidden);
         iconBeltItemHidden = new SymbolIconHideItemGeneric(_nativeObject.iconBeltItemHidden);
         iconLegsItemHidden = new SymbolIconHideItemGeneric(_nativeObject.iconLegsItemHidden);
         iconBootsItemHidden = new SymbolIconHideItemGeneric(_nativeObject.iconBootsItemHidden);
         itemSlotGadget = new SymbolItemSlotGeneric(_nativeObject.itemSlotGadget);
         itemSlotPiercing = new SymbolItemSlotGeneric(_nativeObject.itemSlotPiercing);
         itemSlotMissiles = new SymbolItemSlotGeneric(_nativeObject.itemSlotMissiles);
         btnTabBag1 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBag1);
         btnTabBag2 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBag2);
         btnTabBag3 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBag3);
         iconBox = new SymbolIconBoxGeneric(_nativeObject.iconBox);
         inventorySlot1 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot1);
         inventorySlot2 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot2);
         inventorySlot3 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot3);
         inventorySlot4 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot4);
         inventorySlot5 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot5);
         inventorySlot6 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot6);
         inventorySlot7 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot7);
         inventorySlot8 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot8);
         inventorySlot9 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot9);
         inventorySlot10 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot10);
         inventorySlot11 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot11);
         inventorySlot12 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot12);
         inventorySlot13 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot13);
         inventorySlot14 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot14);
         inventorySlot15 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot15);
         inventorySlot16 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot16);
         inventorySlot17 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot17);
         inventorySlot18 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot18);
         stats = new SymbolStatsGeneric(_nativeObject.stats);
         statsComparison = new SymbolStatsGeneric(_nativeObject.statsComparison);
         txtOwnStats = FlashLabelArea.fromNative(_nativeObject.txtOwnStats);
         characterName = new SymbolCharacterNameGeneric(_nativeObject.characterName);
         btnOutfits = new SymbolIconButtonOutfitsGeneric(_nativeObject.btnOutfits);
         characterLayer = new SymbolDummyGeneric(_nativeObject.characterLayer);
         txtTimeToNextAttack = FlashLabel.fromNative(_nativeObject.txtTimeToNextAttack);
         btnAttack = new SymbolButtonPremiumGeneric(_nativeObject.btnAttack);
         infoBox = new SymbolCharacterInfoBoxGeneric(_nativeObject.infoBox);
         opticalChangePanel = new SymbolOpticalChangeCurrencyGeneric(_nativeObject.opticalChangePanel);
         btnToggleUi = new SymbolButtonToggleUiGeneric(_nativeObject.btnToggleUi);
         btnHelp = new SymbolButtonHelpGeneric(_nativeObject.btnHelp);
         dragLayer = new SymbolDummyGeneric(_nativeObject.dragLayer);
      }
      
      public function setNativeInstance(param1:SymbolPanelCharacter) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         if(_nativeObject.avatar)
         {
            avatar.setNativeInstance(_nativeObject.avatar);
         }
         if(_nativeObject.itemSlotChest)
         {
            itemSlotChest.setNativeInstance(_nativeObject.itemSlotChest);
         }
         if(_nativeObject.itemSlotBelt)
         {
            itemSlotBelt.setNativeInstance(_nativeObject.itemSlotBelt);
         }
         if(_nativeObject.itemSlotLegs)
         {
            itemSlotLegs.setNativeInstance(_nativeObject.itemSlotLegs);
         }
         if(_nativeObject.iconOutfitInfo)
         {
            iconOutfitInfo.setNativeInstance(_nativeObject.iconOutfitInfo);
         }
         if(_nativeObject.itemSlotBoots)
         {
            itemSlotBoots.setNativeInstance(_nativeObject.itemSlotBoots);
         }
         if(_nativeObject.itemSlotRing)
         {
            itemSlotRing.setNativeInstance(_nativeObject.itemSlotRing);
         }
         if(_nativeObject.itemSlotNecklace)
         {
            itemSlotNecklace.setNativeInstance(_nativeObject.itemSlotNecklace);
         }
         if(_nativeObject.itemSlotHead)
         {
            itemSlotHead.setNativeInstance(_nativeObject.itemSlotHead);
         }
         if(_nativeObject.iconHeadItemHidden)
         {
            iconHeadItemHidden.setNativeInstance(_nativeObject.iconHeadItemHidden);
         }
         if(_nativeObject.iconChestItemHidden)
         {
            iconChestItemHidden.setNativeInstance(_nativeObject.iconChestItemHidden);
         }
         if(_nativeObject.iconBeltItemHidden)
         {
            iconBeltItemHidden.setNativeInstance(_nativeObject.iconBeltItemHidden);
         }
         if(_nativeObject.iconLegsItemHidden)
         {
            iconLegsItemHidden.setNativeInstance(_nativeObject.iconLegsItemHidden);
         }
         if(_nativeObject.iconBootsItemHidden)
         {
            iconBootsItemHidden.setNativeInstance(_nativeObject.iconBootsItemHidden);
         }
         if(_nativeObject.itemSlotGadget)
         {
            itemSlotGadget.setNativeInstance(_nativeObject.itemSlotGadget);
         }
         if(_nativeObject.itemSlotPiercing)
         {
            itemSlotPiercing.setNativeInstance(_nativeObject.itemSlotPiercing);
         }
         if(_nativeObject.itemSlotMissiles)
         {
            itemSlotMissiles.setNativeInstance(_nativeObject.itemSlotMissiles);
         }
         if(_nativeObject.btnTabBag1)
         {
            btnTabBag1.setNativeInstance(_nativeObject.btnTabBag1);
         }
         if(_nativeObject.btnTabBag2)
         {
            btnTabBag2.setNativeInstance(_nativeObject.btnTabBag2);
         }
         if(_nativeObject.btnTabBag3)
         {
            btnTabBag3.setNativeInstance(_nativeObject.btnTabBag3);
         }
         if(_nativeObject.iconBox)
         {
            iconBox.setNativeInstance(_nativeObject.iconBox);
         }
         if(_nativeObject.inventorySlot1)
         {
            inventorySlot1.setNativeInstance(_nativeObject.inventorySlot1);
         }
         if(_nativeObject.inventorySlot2)
         {
            inventorySlot2.setNativeInstance(_nativeObject.inventorySlot2);
         }
         if(_nativeObject.inventorySlot3)
         {
            inventorySlot3.setNativeInstance(_nativeObject.inventorySlot3);
         }
         if(_nativeObject.inventorySlot4)
         {
            inventorySlot4.setNativeInstance(_nativeObject.inventorySlot4);
         }
         if(_nativeObject.inventorySlot5)
         {
            inventorySlot5.setNativeInstance(_nativeObject.inventorySlot5);
         }
         if(_nativeObject.inventorySlot6)
         {
            inventorySlot6.setNativeInstance(_nativeObject.inventorySlot6);
         }
         if(_nativeObject.inventorySlot7)
         {
            inventorySlot7.setNativeInstance(_nativeObject.inventorySlot7);
         }
         if(_nativeObject.inventorySlot8)
         {
            inventorySlot8.setNativeInstance(_nativeObject.inventorySlot8);
         }
         if(_nativeObject.inventorySlot9)
         {
            inventorySlot9.setNativeInstance(_nativeObject.inventorySlot9);
         }
         if(_nativeObject.inventorySlot10)
         {
            inventorySlot10.setNativeInstance(_nativeObject.inventorySlot10);
         }
         if(_nativeObject.inventorySlot11)
         {
            inventorySlot11.setNativeInstance(_nativeObject.inventorySlot11);
         }
         if(_nativeObject.inventorySlot12)
         {
            inventorySlot12.setNativeInstance(_nativeObject.inventorySlot12);
         }
         if(_nativeObject.inventorySlot13)
         {
            inventorySlot13.setNativeInstance(_nativeObject.inventorySlot13);
         }
         if(_nativeObject.inventorySlot14)
         {
            inventorySlot14.setNativeInstance(_nativeObject.inventorySlot14);
         }
         if(_nativeObject.inventorySlot15)
         {
            inventorySlot15.setNativeInstance(_nativeObject.inventorySlot15);
         }
         if(_nativeObject.inventorySlot16)
         {
            inventorySlot16.setNativeInstance(_nativeObject.inventorySlot16);
         }
         if(_nativeObject.inventorySlot17)
         {
            inventorySlot17.setNativeInstance(_nativeObject.inventorySlot17);
         }
         if(_nativeObject.inventorySlot18)
         {
            inventorySlot18.setNativeInstance(_nativeObject.inventorySlot18);
         }
         if(_nativeObject.stats)
         {
            stats.setNativeInstance(_nativeObject.stats);
         }
         if(_nativeObject.statsComparison)
         {
            statsComparison.setNativeInstance(_nativeObject.statsComparison);
         }
         FlashLabelArea.setNativeInstance(txtOwnStats,_nativeObject.txtOwnStats);
         if(_nativeObject.characterName)
         {
            characterName.setNativeInstance(_nativeObject.characterName);
         }
         if(_nativeObject.btnOutfits)
         {
            btnOutfits.setNativeInstance(_nativeObject.btnOutfits);
         }
         if(_nativeObject.characterLayer)
         {
            characterLayer.setNativeInstance(_nativeObject.characterLayer);
         }
         FlashLabel.setNativeInstance(txtTimeToNextAttack,_nativeObject.txtTimeToNextAttack);
         if(_nativeObject.btnAttack)
         {
            btnAttack.setNativeInstance(_nativeObject.btnAttack);
         }
         if(_nativeObject.infoBox)
         {
            infoBox.setNativeInstance(_nativeObject.infoBox);
         }
         if(_nativeObject.opticalChangePanel)
         {
            opticalChangePanel.setNativeInstance(_nativeObject.opticalChangePanel);
         }
         if(_nativeObject.btnToggleUi)
         {
            btnToggleUi.setNativeInstance(_nativeObject.btnToggleUi);
         }
         if(_nativeObject.btnHelp)
         {
            btnHelp.setNativeInstance(_nativeObject.btnHelp);
         }
         if(_nativeObject.dragLayer)
         {
            dragLayer.setNativeInstance(_nativeObject.dragLayer);
         }
      }
   }
}

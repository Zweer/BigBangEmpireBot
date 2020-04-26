package visuals.ui.panels
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.avatar.SymbolAvatarGeneric;
   import visuals.ui.elements.buttons.SymbolButtonHelpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonNarrowTabGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.generic.SymbolCounterGeneric;
   import visuals.ui.elements.icons.SymbolIconBoxGeneric;
   import visuals.ui.elements.icons.SymbolIconHideItemGeneric;
   import visuals.ui.elements.icons.SymbolIconLockGeneric;
   import visuals.ui.elements.icons.SymbolIconOutfitInfoGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   import visuals.ui.elements.outfit.SymbolIconButtonOutfitsGeneric;
   import visuals.ui.elements.payment.SymbolAvatarPreviewGeneric;
   import visuals.ui.elements.shop.SymbolIconButtonShopOffersGeneric;
   import visuals.ui.elements.shop.SymbolShopCustomizeItemAreaGeneric;
   import visuals.ui.elements.shop.SymbolShopFrameOfferGeneric;
   import visuals.ui.elements.shop.SymbolShopSellAreaGeneric;
   import visuals.ui.elements.shop.SymbolShopSewAreaGeneric;
   import visuals.ui.elements.shop.SymbolShopWashAreaGeneric;
   import visuals.ui.elements.stats.SymbolStatsGeneric;
   
   public class SymbolPanelShopGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPanelShop = null;
      
      public var avatar:SymbolAvatarGeneric = null;
      
      public var itemSlotChest:SymbolItemSlotGeneric = null;
      
      public var itemSlotBelt:SymbolItemSlotGeneric = null;
      
      public var itemSlotLegs:SymbolItemSlotGeneric = null;
      
      public var iconOutfitInfo:SymbolIconOutfitInfoGeneric = null;
      
      public var itemSlotBoots:SymbolItemSlotGeneric = null;
      
      public var itemSlotRing:SymbolItemSlotGeneric = null;
      
      public var itemSlotHead:SymbolItemSlotGeneric = null;
      
      public var itemSlotNecklace:SymbolItemSlotGeneric = null;
      
      public var itemSlotGadget:SymbolItemSlotGeneric = null;
      
      public var itemSlotPiercing:SymbolItemSlotGeneric = null;
      
      public var itemSlotMissiles:SymbolItemSlotGeneric = null;
      
      public var iconHeadItemHidden:SymbolIconHideItemGeneric = null;
      
      public var iconChestItemHidden:SymbolIconHideItemGeneric = null;
      
      public var iconBeltItemHidden:SymbolIconHideItemGeneric = null;
      
      public var iconLegsItemHidden:SymbolIconHideItemGeneric = null;
      
      public var iconBootsItemHidden:SymbolIconHideItemGeneric = null;
      
      public var iconBox:SymbolIconBoxGeneric = null;
      
      public var btnTabBag1:SymbolButtonNarrowTabGeneric = null;
      
      public var btnTabBag2:SymbolButtonNarrowTabGeneric = null;
      
      public var btnTabBag3:SymbolButtonNarrowTabGeneric = null;
      
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
      
      public var btnHelp:SymbolButtonHelpGeneric = null;
      
      public var frameOffer:SymbolShopFrameOfferGeneric = null;
      
      public var txtOffersCaption:ILabel = null;
      
      public var btnSpecialOffers:SymbolIconButtonShopOffersGeneric = null;
      
      public var btnRestockGoods:SymbolButtonPremiumGeneric = null;
      
      public var sellArea:SymbolShopSellAreaGeneric = null;
      
      public var sewArea:SymbolShopSewAreaGeneric = null;
      
      public var iconSewLock:SymbolIconLockGeneric = null;
      
      public var itemPatternCounter:SymbolCounterGeneric = null;
      
      public var btnOutfits:SymbolIconButtonOutfitsGeneric = null;
      
      public var washArea:SymbolShopWashAreaGeneric = null;
      
      public var iconWashLock:SymbolIconLockGeneric = null;
      
      public var customizeItemArea:SymbolShopCustomizeItemAreaGeneric = null;
      
      public var iconCustomizeItemLock:SymbolIconLockGeneric = null;
      
      public var shopSlot1:SymbolItemSlotGeneric = null;
      
      public var shopSlot2:SymbolItemSlotGeneric = null;
      
      public var shopSlot3:SymbolItemSlotGeneric = null;
      
      public var shopSlot4:SymbolItemSlotGeneric = null;
      
      public var shopSlot5:SymbolItemSlotGeneric = null;
      
      public var shopSlot6:SymbolItemSlotGeneric = null;
      
      public var shopSlot7:SymbolItemSlotGeneric = null;
      
      public var shopSlot8:SymbolItemSlotGeneric = null;
      
      public var shopSlot9:SymbolItemSlotGeneric = null;
      
      public var shopLayer:SymbolDummyGeneric = null;
      
      public var avatarPreview:SymbolAvatarPreviewGeneric = null;
      
      public var characterLayer:SymbolDummyGeneric = null;
      
      public var dragLayer:SymbolPlaceholderGeneric = null;
      
      public function SymbolPanelShopGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPanelShop;
         }
         else
         {
            _nativeObject = new SymbolPanelShop();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         avatar = new SymbolAvatarGeneric(_nativeObject.avatar);
         itemSlotChest = new SymbolItemSlotGeneric(_nativeObject.itemSlotChest);
         itemSlotBelt = new SymbolItemSlotGeneric(_nativeObject.itemSlotBelt);
         itemSlotLegs = new SymbolItemSlotGeneric(_nativeObject.itemSlotLegs);
         iconOutfitInfo = new SymbolIconOutfitInfoGeneric(_nativeObject.iconOutfitInfo);
         itemSlotBoots = new SymbolItemSlotGeneric(_nativeObject.itemSlotBoots);
         itemSlotRing = new SymbolItemSlotGeneric(_nativeObject.itemSlotRing);
         itemSlotHead = new SymbolItemSlotGeneric(_nativeObject.itemSlotHead);
         itemSlotNecklace = new SymbolItemSlotGeneric(_nativeObject.itemSlotNecklace);
         itemSlotGadget = new SymbolItemSlotGeneric(_nativeObject.itemSlotGadget);
         itemSlotPiercing = new SymbolItemSlotGeneric(_nativeObject.itemSlotPiercing);
         itemSlotMissiles = new SymbolItemSlotGeneric(_nativeObject.itemSlotMissiles);
         iconHeadItemHidden = new SymbolIconHideItemGeneric(_nativeObject.iconHeadItemHidden);
         iconChestItemHidden = new SymbolIconHideItemGeneric(_nativeObject.iconChestItemHidden);
         iconBeltItemHidden = new SymbolIconHideItemGeneric(_nativeObject.iconBeltItemHidden);
         iconLegsItemHidden = new SymbolIconHideItemGeneric(_nativeObject.iconLegsItemHidden);
         iconBootsItemHidden = new SymbolIconHideItemGeneric(_nativeObject.iconBootsItemHidden);
         iconBox = new SymbolIconBoxGeneric(_nativeObject.iconBox);
         btnTabBag1 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBag1);
         btnTabBag2 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBag2);
         btnTabBag3 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBag3);
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
         btnHelp = new SymbolButtonHelpGeneric(_nativeObject.btnHelp);
         frameOffer = new SymbolShopFrameOfferGeneric(_nativeObject.frameOffer);
         txtOffersCaption = FlashLabel.fromNative(_nativeObject.txtOffersCaption);
         btnSpecialOffers = new SymbolIconButtonShopOffersGeneric(_nativeObject.btnSpecialOffers);
         btnRestockGoods = new SymbolButtonPremiumGeneric(_nativeObject.btnRestockGoods);
         sellArea = new SymbolShopSellAreaGeneric(_nativeObject.sellArea);
         sewArea = new SymbolShopSewAreaGeneric(_nativeObject.sewArea);
         iconSewLock = new SymbolIconLockGeneric(_nativeObject.iconSewLock);
         itemPatternCounter = new SymbolCounterGeneric(_nativeObject.itemPatternCounter);
         btnOutfits = new SymbolIconButtonOutfitsGeneric(_nativeObject.btnOutfits);
         washArea = new SymbolShopWashAreaGeneric(_nativeObject.washArea);
         iconWashLock = new SymbolIconLockGeneric(_nativeObject.iconWashLock);
         customizeItemArea = new SymbolShopCustomizeItemAreaGeneric(_nativeObject.customizeItemArea);
         iconCustomizeItemLock = new SymbolIconLockGeneric(_nativeObject.iconCustomizeItemLock);
         shopSlot1 = new SymbolItemSlotGeneric(_nativeObject.shopSlot1);
         shopSlot2 = new SymbolItemSlotGeneric(_nativeObject.shopSlot2);
         shopSlot3 = new SymbolItemSlotGeneric(_nativeObject.shopSlot3);
         shopSlot4 = new SymbolItemSlotGeneric(_nativeObject.shopSlot4);
         shopSlot5 = new SymbolItemSlotGeneric(_nativeObject.shopSlot5);
         shopSlot6 = new SymbolItemSlotGeneric(_nativeObject.shopSlot6);
         shopSlot7 = new SymbolItemSlotGeneric(_nativeObject.shopSlot7);
         shopSlot8 = new SymbolItemSlotGeneric(_nativeObject.shopSlot8);
         shopSlot9 = new SymbolItemSlotGeneric(_nativeObject.shopSlot9);
         shopLayer = new SymbolDummyGeneric(_nativeObject.shopLayer);
         avatarPreview = new SymbolAvatarPreviewGeneric(_nativeObject.avatarPreview);
         characterLayer = new SymbolDummyGeneric(_nativeObject.characterLayer);
         dragLayer = new SymbolPlaceholderGeneric(_nativeObject.dragLayer);
      }
      
      public function setNativeInstance(param1:SymbolPanelShop) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
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
         if(_nativeObject.itemSlotHead)
         {
            itemSlotHead.setNativeInstance(_nativeObject.itemSlotHead);
         }
         if(_nativeObject.itemSlotNecklace)
         {
            itemSlotNecklace.setNativeInstance(_nativeObject.itemSlotNecklace);
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
         if(_nativeObject.iconBox)
         {
            iconBox.setNativeInstance(_nativeObject.iconBox);
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
         if(_nativeObject.btnHelp)
         {
            btnHelp.setNativeInstance(_nativeObject.btnHelp);
         }
         if(_nativeObject.frameOffer)
         {
            frameOffer.setNativeInstance(_nativeObject.frameOffer);
         }
         FlashLabel.setNativeInstance(txtOffersCaption,_nativeObject.txtOffersCaption);
         if(_nativeObject.btnSpecialOffers)
         {
            btnSpecialOffers.setNativeInstance(_nativeObject.btnSpecialOffers);
         }
         if(_nativeObject.btnRestockGoods)
         {
            btnRestockGoods.setNativeInstance(_nativeObject.btnRestockGoods);
         }
         if(_nativeObject.sellArea)
         {
            sellArea.setNativeInstance(_nativeObject.sellArea);
         }
         if(_nativeObject.sewArea)
         {
            sewArea.setNativeInstance(_nativeObject.sewArea);
         }
         if(_nativeObject.iconSewLock)
         {
            iconSewLock.setNativeInstance(_nativeObject.iconSewLock);
         }
         if(_nativeObject.itemPatternCounter)
         {
            itemPatternCounter.setNativeInstance(_nativeObject.itemPatternCounter);
         }
         if(_nativeObject.btnOutfits)
         {
            btnOutfits.setNativeInstance(_nativeObject.btnOutfits);
         }
         if(_nativeObject.washArea)
         {
            washArea.setNativeInstance(_nativeObject.washArea);
         }
         if(_nativeObject.iconWashLock)
         {
            iconWashLock.setNativeInstance(_nativeObject.iconWashLock);
         }
         if(_nativeObject.customizeItemArea)
         {
            customizeItemArea.setNativeInstance(_nativeObject.customizeItemArea);
         }
         if(_nativeObject.iconCustomizeItemLock)
         {
            iconCustomizeItemLock.setNativeInstance(_nativeObject.iconCustomizeItemLock);
         }
         if(_nativeObject.shopSlot1)
         {
            shopSlot1.setNativeInstance(_nativeObject.shopSlot1);
         }
         if(_nativeObject.shopSlot2)
         {
            shopSlot2.setNativeInstance(_nativeObject.shopSlot2);
         }
         if(_nativeObject.shopSlot3)
         {
            shopSlot3.setNativeInstance(_nativeObject.shopSlot3);
         }
         if(_nativeObject.shopSlot4)
         {
            shopSlot4.setNativeInstance(_nativeObject.shopSlot4);
         }
         if(_nativeObject.shopSlot5)
         {
            shopSlot5.setNativeInstance(_nativeObject.shopSlot5);
         }
         if(_nativeObject.shopSlot6)
         {
            shopSlot6.setNativeInstance(_nativeObject.shopSlot6);
         }
         if(_nativeObject.shopSlot7)
         {
            shopSlot7.setNativeInstance(_nativeObject.shopSlot7);
         }
         if(_nativeObject.shopSlot8)
         {
            shopSlot8.setNativeInstance(_nativeObject.shopSlot8);
         }
         if(_nativeObject.shopSlot9)
         {
            shopSlot9.setNativeInstance(_nativeObject.shopSlot9);
         }
         if(_nativeObject.shopLayer)
         {
            shopLayer.setNativeInstance(_nativeObject.shopLayer);
         }
         if(_nativeObject.avatarPreview)
         {
            avatarPreview.setNativeInstance(_nativeObject.avatarPreview);
         }
         if(_nativeObject.characterLayer)
         {
            characterLayer.setNativeInstance(_nativeObject.characterLayer);
         }
         if(_nativeObject.dragLayer)
         {
            dragLayer.setNativeInstance(_nativeObject.dragLayer);
         }
      }
   }
}

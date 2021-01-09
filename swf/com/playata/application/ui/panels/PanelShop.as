package com.playata.application.ui.panels
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.AppearanceSettings;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.item_pattern.ItemPatterns;
   import com.playata.application.data.payment.ItemOfferCategories;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogBankInventory;
   import com.playata.application.ui.dialogs.DialogBuyItemOffers;
   import com.playata.application.ui.dialogs.DialogOutfits;
   import com.playata.application.ui.dialogs.DialogSewingMachine;
   import com.playata.application.ui.dialogs.DialogTutorialPopup;
   import com.playata.application.ui.elements.avatar.UiAvatar;
   import com.playata.application.ui.elements.avatar.UiAvatarPreview;
   import com.playata.application.ui.elements.avatar.UiCharacterEquipLayer;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.tab.UiInventoryTabButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.item.UiItemGraphic;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.application.ui.elements.shop.UiCustomizeItemArea;
   import com.playata.application.ui.elements.shop.UiSellArea;
   import com.playata.application.ui.elements.shop.UiSewArea;
   import com.playata.application.ui.elements.shop.UiShopSellLayer;
   import com.playata.application.ui.elements.shop.UiWashArea;
   import com.playata.application.ui.elements.stats.UiStats;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.AnchorPoint;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.display.ui.TooltipLayer;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.panels.SymbolPanelShopGeneric;
   
   public class PanelShop extends DefaultPanel
   {
       
      
      private var _avatar:UiAvatar = null;
      
      private var _btnHelp:UiButton = null;
      
      private var _btnRefreshShop:UiPremiumButton = null;
      
      private var _btnSpecialOffers:UiButton = null;
      
      private var _btnTabBag1:UiInventoryTabButton = null;
      
      private var _btnTabBag2:UiInventoryTabButton = null;
      
      private var _btnTabBag3:UiInventoryTabButton = null;
      
      private var _btnBankInventory:UiButton = null;
      
      private var _btnOutfits:UiButton = null;
      
      private var _inventorySlot1:UiItemSlot = null;
      
      private var _inventorySlot2:UiItemSlot = null;
      
      private var _inventorySlot3:UiItemSlot = null;
      
      private var _inventorySlot4:UiItemSlot = null;
      
      private var _inventorySlot5:UiItemSlot = null;
      
      private var _inventorySlot6:UiItemSlot = null;
      
      private var _inventorySlot7:UiItemSlot = null;
      
      private var _inventorySlot8:UiItemSlot = null;
      
      private var _inventorySlot9:UiItemSlot = null;
      
      private var _inventorySlot10:UiItemSlot = null;
      
      private var _inventorySlot11:UiItemSlot = null;
      
      private var _inventorySlot12:UiItemSlot = null;
      
      private var _inventorySlot13:UiItemSlot = null;
      
      private var _inventorySlot14:UiItemSlot = null;
      
      private var _inventorySlot15:UiItemSlot = null;
      
      private var _inventorySlot16:UiItemSlot = null;
      
      private var _inventorySlot17:UiItemSlot = null;
      
      private var _inventorySlot18:UiItemSlot = null;
      
      private var _itemSlotHead:UiItemSlot = null;
      
      private var _itemSlotChest:UiItemSlot = null;
      
      private var _itemSlotBelt:UiItemSlot = null;
      
      private var _itemSlotLegs:UiItemSlot = null;
      
      private var _itemSlotBoots:UiItemSlot = null;
      
      private var _itemSlotNecklace:UiItemSlot = null;
      
      private var _itemSlotRing:UiItemSlot = null;
      
      private var _itemSlotPiercing:UiItemSlot = null;
      
      private var _itemSlotGadget:UiItemSlot = null;
      
      private var _itemSlotMissiles:UiItemSlot = null;
      
      private var _shopSlot1:UiItemSlot = null;
      
      private var _shopSlot2:UiItemSlot = null;
      
      private var _shopSlot3:UiItemSlot = null;
      
      private var _shopSlot4:UiItemSlot = null;
      
      private var _shopSlot5:UiItemSlot = null;
      
      private var _shopSlot6:UiItemSlot = null;
      
      private var _shopSlot7:UiItemSlot = null;
      
      private var _shopSlot8:UiItemSlot = null;
      
      private var _shopSlot9:UiItemSlot = null;
      
      private var _tooltipOutfit:UiTextTooltip = null;
      
      private var _headItemHiddenTooltip:UiTextTooltip = null;
      
      private var _chestItemHiddenTooltip:UiTextTooltip = null;
      
      private var _beltItemHiddenTooltip:UiTextTooltip = null;
      
      private var _legsItemHiddenTooltip:UiTextTooltip = null;
      
      private var _bootsItemHiddenTooltip:UiTextTooltip = null;
      
      private var _stats:UiStats = null;
      
      private var _previewAvatar:UiAvatarPreview;
      
      private var _sellArea:UiSellArea = null;
      
      private var _sewArea:UiSewArea = null;
      
      private var _washArea:UiWashArea = null;
      
      private var _characterEquipLayer:UiCharacterEquipLayer = null;
      
      private var _shopSellLayer:UiShopSellLayer = null;
      
      private var _customizeItemArea:UiCustomizeItemArea = null;
      
      private var _peviewAvatarX:Number = 0;
      
      public function PanelShop(param1:SymbolPanelShopGeneric)
      {
         super(param1);
         _btnHelp = new UiButton(param1.btnHelp,LocText.current.text("general/button_help"),onClickHelp);
         _btnRefreshShop = new UiPremiumButton(param1.btnRestockGoods,CConstant.shop_refresh_waiting_time_premium_amount,LocText.current.text("screen/item_shop/button_restock_goods"),LocText.current.text("screen/item_shop/button_restock_goods"),"","",onClickRefreshShop);
         _btnRefreshShop.textTooltip.requestTextFunction = getRefreshShopTooltip;
         _btnSpecialOffers = new UiButton(param1.btnSpecialOffers,LocText.current.text("dialog/buy_items/title"),onClickSpecialOffers);
         _btnTabBag1 = new UiInventoryTabButton(param1.btnTabBag1,0,"1","",onClickTabBag1);
         _btnTabBag2 = new UiInventoryTabButton(param1.btnTabBag2,1,"2","",onClickTabBag2);
         _btnTabBag3 = new UiInventoryTabButton(param1.btnTabBag3,2,"3","",onClickTabBag3);
         _btnBankInventory = new UiButton(param1.iconBox,LocText.current.text("dialog/bank_inventory/title"),onClickBankInventory);
         _btnOutfits = new UiButton(param1.btnOutfits,LocText.current.text("screen/character_overview/button_outfits_tooltip"),onClickOutfits);
         _btnSpecialOffers.visible = false;
         _btnTabBag1.textTooltip.requestTextFunction = requestBag1Tooltip;
         _btnTabBag2.textTooltip.requestTextFunction = requestBag2Tooltip;
         _btnTabBag3.textTooltip.requestTextFunction = requestBag3Tooltip;
         param1.txtOffersCaption.text = LocText.current.text("screen/item_shop/shop_caption");
         param1.txtOffersCaption.autoFontSize = true;
         _inventorySlot1 = new UiItemSlot(param1.inventorySlot1,20);
         _inventorySlot2 = new UiItemSlot(param1.inventorySlot2,21);
         _inventorySlot3 = new UiItemSlot(param1.inventorySlot3,22);
         _inventorySlot4 = new UiItemSlot(param1.inventorySlot4,23);
         _inventorySlot5 = new UiItemSlot(param1.inventorySlot5,24);
         _inventorySlot6 = new UiItemSlot(param1.inventorySlot6,25);
         _inventorySlot7 = new UiItemSlot(param1.inventorySlot7,26);
         _inventorySlot8 = new UiItemSlot(param1.inventorySlot8,27);
         _inventorySlot9 = new UiItemSlot(param1.inventorySlot9,28);
         _inventorySlot10 = new UiItemSlot(param1.inventorySlot10,29);
         _inventorySlot11 = new UiItemSlot(param1.inventorySlot11,30);
         _inventorySlot12 = new UiItemSlot(param1.inventorySlot12,31);
         _inventorySlot13 = new UiItemSlot(param1.inventorySlot13,32);
         _inventorySlot14 = new UiItemSlot(param1.inventorySlot14,33);
         _inventorySlot15 = new UiItemSlot(param1.inventorySlot15,34);
         _inventorySlot16 = new UiItemSlot(param1.inventorySlot16,35);
         _inventorySlot17 = new UiItemSlot(param1.inventorySlot17,36);
         _inventorySlot18 = new UiItemSlot(param1.inventorySlot18,37);
         _itemSlotHead = new UiItemSlot(param1.itemSlotHead,1);
         _itemSlotChest = new UiItemSlot(param1.itemSlotChest,2);
         _itemSlotBelt = new UiItemSlot(param1.itemSlotBelt,3);
         _itemSlotLegs = new UiItemSlot(param1.itemSlotLegs,4);
         _itemSlotBoots = new UiItemSlot(param1.itemSlotBoots,5);
         _itemSlotNecklace = new UiItemSlot(param1.itemSlotNecklace,6);
         _itemSlotRing = new UiItemSlot(param1.itemSlotRing,7);
         _itemSlotPiercing = new UiItemSlot(param1.itemSlotPiercing,10);
         _itemSlotGadget = new UiItemSlot(param1.itemSlotGadget,8);
         _itemSlotMissiles = new UiItemSlot(param1.itemSlotMissiles,9);
         _shopSlot1 = new UiItemSlot(param1.shopSlot1,99);
         _shopSlot2 = new UiItemSlot(param1.shopSlot2,99);
         _shopSlot3 = new UiItemSlot(param1.shopSlot3,99);
         _shopSlot4 = new UiItemSlot(param1.shopSlot4,99);
         _shopSlot5 = new UiItemSlot(param1.shopSlot5,99);
         _shopSlot6 = new UiItemSlot(param1.shopSlot6,99);
         _shopSlot7 = new UiItemSlot(param1.shopSlot7,99);
         _shopSlot8 = new UiItemSlot(param1.shopSlot8,99);
         _shopSlot9 = new UiItemSlot(param1.shopSlot9,99);
         _tooltipOutfit = new UiTextTooltip(param1.iconOutfitInfo,LocText.current.text("general/outfit_tooltip"));
         param1.itemPatternCounter.caption.text = "!";
         _headItemHiddenTooltip = new UiTextTooltip(param1.iconHeadItemHidden,LocText.current.text("screen/character/show_head_item_hidden_tooltip"));
         _chestItemHiddenTooltip = new UiTextTooltip(param1.iconChestItemHidden,LocText.current.text("screen/character/show_chest_item_hidden_tooltip"));
         _beltItemHiddenTooltip = new UiTextTooltip(param1.iconBeltItemHidden,LocText.current.text("screen/character/show_belt_item_hidden_tooltip"));
         _legsItemHiddenTooltip = new UiTextTooltip(param1.iconLegsItemHidden,LocText.current.text("screen/character/show_legs_item_hidden_tooltip"));
         _bootsItemHiddenTooltip = new UiTextTooltip(param1.iconBootsItemHidden,LocText.current.text("screen/character/show_boots_item_hidden_tooltip"));
         _stats = new UiStats(param1.stats);
         _stats.enableIncrease(false);
         _avatar = new UiAvatar(param1.avatar,true,false,true);
         _sellArea = new UiSellArea(param1.sellArea);
         _sewArea = new UiSewArea(param1.sewArea,param1.iconSewLock);
         _washArea = new UiWashArea(param1.washArea,param1.iconWashLock);
         _characterEquipLayer = new UiCharacterEquipLayer(param1.characterLayer);
         _shopSellLayer = new UiShopSellLayer(param1.shopLayer);
         _customizeItemArea = new UiCustomizeItemArea(param1.customizeItemArea,param1.iconCustomizeItemLock);
         MessageRouter.addListener("InventoryMessage.notifyBagChange",handleMessages);
         switchBag(0);
         _peviewAvatarX = param1.avatarPreview.x;
         _previewAvatar = new UiAvatarPreview(param1.avatarPreview);
         param1.dragLayer.removeAllChildren();
         _anchorContainer.add(param1.avatar,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.avatarPreview,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.characterLayer,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.shopLayer,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.btnSpecialOffers,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.txtOffersCaption,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.frameOffer,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.shopSlot1,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.shopSlot2,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.shopSlot3,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.shopSlot4,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.shopSlot5,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.shopSlot6,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.shopSlot7,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.shopSlot8,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.shopSlot9,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.btnRestockGoods,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.sellArea,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.washArea,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.sewArea,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.customizeItemArea,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.iconSewLock,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.iconWashLock,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.itemPatternCounter,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.frameOffer,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.itemSlotNecklace,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.itemSlotRing,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.itemSlotPiercing,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.itemSlotGadget,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.itemSlotMissiles,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.btnTabBag1,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.btnTabBag2,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.btnTabBag3,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.iconBox,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.btnOutfits,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.inventorySlot1,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.inventorySlot2,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.inventorySlot3,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.inventorySlot4,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.inventorySlot5,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.inventorySlot6,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.inventorySlot7,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.inventorySlot8,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.inventorySlot9,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.inventorySlot10,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.inventorySlot11,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.inventorySlot12,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.inventorySlot13,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.inventorySlot14,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.inventorySlot15,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.inventorySlot16,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.inventorySlot17,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.inventorySlot18,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.stats,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.avatar,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.avatarPreview,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.characterLayer,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.itemSlotHead,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.itemSlotChest,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.itemSlotBelt,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.itemSlotLegs,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.itemSlotBoots,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.itemSlotNecklace,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.itemSlotRing,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.itemSlotPiercing,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.itemSlotGadget,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.itemSlotMissiles,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.iconHeadItemHidden,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.iconChestItemHidden,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.iconBeltItemHidden,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.iconLegsItemHidden,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.iconBootsItemHidden,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.shopLayer,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.btnSpecialOffers,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.txtOffersCaption,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.frameOffer,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.shopSlot1,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.shopSlot2,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.shopSlot3,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.shopSlot4,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.shopSlot5,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.shopSlot6,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.shopSlot7,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.shopSlot8,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.shopSlot9,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.btnRestockGoods,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.sellArea,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.washArea,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.sewArea,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.customizeItemArea,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.iconSewLock,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.iconWashLock,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.itemPatternCounter,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.frameOffer,AnchorPoint.BOTTOM_FIXED,0.5);
      }
      
      override public function refreshPanelLocalization() : void
      {
         var _loc1_:SymbolPanelShopGeneric = _vo as SymbolPanelShopGeneric;
         _btnHelp.tooltip = LocText.current.text("general/button_help");
         _btnRefreshShop.premiumCaption = LocText.current.text("screen/item_shop/button_restock_goods");
         _btnRefreshShop.nonPremiumCaption = LocText.current.text("screen/item_shop/button_restock_goods");
         _loc1_.txtOffersCaption.text = LocText.current.text("screen/item_shop/shop_caption");
         _loc1_.txtOffersCaption.autoFontSize = true;
         _tooltipOutfit.text = LocText.current.text("general/outfit_tooltip");
         _headItemHiddenTooltip.text = LocText.current.text("screen/character/show_head_item_hidden_tooltip");
         _chestItemHiddenTooltip.text = LocText.current.text("screen/character/show_chest_item_hidden_tooltip");
         _beltItemHiddenTooltip.text = LocText.current.text("screen/character/show_belt_item_hidden_tooltip");
         _legsItemHiddenTooltip.text = LocText.current.text("screen/character/show_legs_item_hidden_tooltip");
         _bootsItemHiddenTooltip.text = LocText.current.text("screen/character/show_boots_item_hidden_tooltip");
         _btnOutfits.tooltip = LocText.current.text("screen/character_overview/button_outfits_tooltip");
         _sellArea.refreshLocalization();
         _customizeItemArea.refreshLocalization();
         if(_shown)
         {
            refresh();
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _btnHelp.dispose();
         _btnHelp = null;
         _btnRefreshShop.dispose();
         _btnRefreshShop = null;
         _btnSpecialOffers.dispose();
         _btnSpecialOffers = null;
         _btnTabBag1.dispose();
         _btnTabBag1 = null;
         _btnTabBag2.dispose();
         _btnTabBag2 = null;
         _btnTabBag3.dispose();
         _btnTabBag3 = null;
         _btnBankInventory.dispose();
         _btnBankInventory = null;
         _btnOutfits.dispose();
         _btnOutfits = null;
         _inventorySlot1.dispose();
         _inventorySlot2.dispose();
         _inventorySlot3.dispose();
         _inventorySlot4.dispose();
         _inventorySlot5.dispose();
         _inventorySlot6.dispose();
         _inventorySlot7.dispose();
         _inventorySlot8.dispose();
         _inventorySlot9.dispose();
         _inventorySlot10.dispose();
         _inventorySlot11.dispose();
         _inventorySlot12.dispose();
         _inventorySlot13.dispose();
         _inventorySlot14.dispose();
         _inventorySlot15.dispose();
         _inventorySlot16.dispose();
         _inventorySlot17.dispose();
         _inventorySlot18.dispose();
         _itemSlotHead.dispose();
         _itemSlotChest.dispose();
         _itemSlotBelt.dispose();
         _itemSlotLegs.dispose();
         _itemSlotBoots.dispose();
         _itemSlotNecklace.dispose();
         _itemSlotRing.dispose();
         _itemSlotPiercing.dispose();
         _itemSlotGadget.dispose();
         _itemSlotMissiles.dispose();
         _shopSlot1.dispose();
         _shopSlot2.dispose();
         _shopSlot3.dispose();
         _shopSlot4.dispose();
         _shopSlot5.dispose();
         _shopSlot6.dispose();
         _shopSlot7.dispose();
         _shopSlot8.dispose();
         _shopSlot9.dispose();
         _tooltipOutfit.dispose();
         _stats.dispose();
         _avatar.dispose();
         _inventorySlot1 = null;
         _inventorySlot2 = null;
         _inventorySlot3 = null;
         _inventorySlot4 = null;
         _inventorySlot5 = null;
         _inventorySlot6 = null;
         _inventorySlot7 = null;
         _inventorySlot8 = null;
         _inventorySlot9 = null;
         _inventorySlot10 = null;
         _inventorySlot11 = null;
         _inventorySlot12 = null;
         _inventorySlot13 = null;
         _inventorySlot14 = null;
         _inventorySlot15 = null;
         _inventorySlot16 = null;
         _inventorySlot17 = null;
         _inventorySlot18 = null;
         _itemSlotHead = null;
         _itemSlotChest = null;
         _itemSlotBelt = null;
         _itemSlotLegs = null;
         _itemSlotBoots = null;
         _itemSlotNecklace = null;
         _itemSlotRing = null;
         _itemSlotPiercing = null;
         _itemSlotGadget = null;
         _itemSlotMissiles = null;
         _shopSlot1 = null;
         _shopSlot2 = null;
         _shopSlot3 = null;
         _shopSlot4 = null;
         _shopSlot5 = null;
         _shopSlot6 = null;
         _shopSlot7 = null;
         _shopSlot8 = null;
         _shopSlot9 = null;
         _tooltipOutfit = null;
         _stats = null;
         _avatar = null;
         _sellArea.dispose();
         _sewArea.dispose();
         _washArea.dispose();
         _characterEquipLayer.dispose();
         _shopSellLayer.dispose();
         _customizeItemArea.dispose();
         MessageRouter.removeAllListeners(handleMessages);
      }
      
      private function onClickTabBag1(param1:InteractionEvent) : void
      {
         switchBag(0);
      }
      
      private function onClickTabBag2(param1:InteractionEvent) : void
      {
         switchBag(1);
      }
      
      private function onClickTabBag3(param1:InteractionEvent) : void
      {
         switchBag(2);
      }
      
      private function onClickOutfits(param1:InteractionEvent) : void
      {
         panelManager.showDialog(new DialogOutfits());
      }
      
      private function switchBag(param1:int) : void
      {
         _btnTabBag1.tabbed = param1 == 0;
         _btnTabBag2.tabbed = param1 == 1;
         _btnTabBag3.tabbed = param1 == 2;
         _inventorySlot1.container.visible = param1 == 0;
         _inventorySlot2.container.visible = param1 == 0;
         _inventorySlot3.container.visible = param1 == 0;
         _inventorySlot4.container.visible = param1 == 0;
         _inventorySlot5.container.visible = param1 == 0;
         _inventorySlot6.container.visible = param1 == 0;
         _inventorySlot7.container.visible = param1 == 1;
         _inventorySlot8.container.visible = param1 == 1;
         _inventorySlot9.container.visible = param1 == 1;
         _inventorySlot10.container.visible = param1 == 1;
         _inventorySlot11.container.visible = param1 == 1;
         _inventorySlot12.container.visible = param1 == 1;
         _inventorySlot13.container.visible = param1 == 2;
         _inventorySlot14.container.visible = param1 == 2;
         _inventorySlot15.container.visible = param1 == 2;
         _inventorySlot16.container.visible = param1 == 2;
         _inventorySlot17.container.visible = param1 == 2;
         _inventorySlot18.container.visible = param1 == 2;
         if(User.current != null && User.current.character != null)
         {
            User.current.character.currentBag = param1;
         }
         refreshBag();
      }
      
      private function refreshBag() : void
      {
         if(User.current == null || User.current.character == null)
         {
            return;
         }
         var _loc1_:* = User.current.character.level >= CConstant.inventory_bag2_unlock_level;
         var _loc2_:* = User.current.character.level >= CConstant.inventory_bag3_unlock_level;
         _btnTabBag1.visible = _loc1_;
         _btnTabBag2.visible = _loc1_;
         _btnTabBag3.visible = _loc2_;
         _btnBankInventory.visible = User.current.character.hasTutorialFlag("tutorial_finished") && _loc2_;
         _btnTabBag1.content.scaleX = 1;
         _btnTabBag1.content.scaleY = 1;
         _btnTabBag2.content.scaleX = 1;
         _btnTabBag2.content.scaleY = 1;
         _btnTabBag3.content.scaleX = 1;
         _btnTabBag3.content.scaleY = 1;
         if(_loc2_)
         {
            _btnTabBag1.content.scaleX = 0.8;
            _btnTabBag1.content.scaleY = 0.8;
            _btnTabBag2.content.scaleX = 0.8;
            _btnTabBag2.content.scaleY = 0.8;
            _btnTabBag3.content.scaleX = 0.8;
            _btnTabBag3.content.scaleY = 0.8;
            _btnTabBag1.content.x = 34;
            _btnTabBag2.content.x = 72;
            _btnTabBag3.content.x = 110;
         }
         else
         {
            _btnTabBag1.content.x = 69;
            _btnTabBag2.content.x = 118;
         }
      }
      
      private function requestBag1Tooltip() : String
      {
         return LocText.current.text("inventory/info",1,GameUtil.getItemCountString(User.current.character.inventory.bag1ItemCount));
      }
      
      private function requestBag2Tooltip() : String
      {
         if(_btnTabBag2.buttonEnabled)
         {
            return LocText.current.text("inventory/info",2,GameUtil.getItemCountString(User.current.character.inventory.bag2ItemCount));
         }
         return LocText.current.text("inventory/locked",2,CConstant.inventory_bag2_unlock_level);
      }
      
      private function requestBag3Tooltip() : String
      {
         return LocText.current.text("inventory/info",3,GameUtil.getItemCountString(User.current.character.inventory.bag3ItemCount));
      }
      
      private function refreshShopSelection(param1:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc2_:Boolean = User.current.character.shopRefreshUsed;
         _btnRefreshShop.premium = _loc2_;
         var _loc4_:int = 1;
         _btnRefreshShop.content.scaleX = _loc4_;
         _btnRefreshShop.content.scaleY = _loc4_;
         if(_btnRefreshShop.content.width > 230)
         {
            _btnRefreshShop.content.width = 230;
            _btnRefreshShop.content.scaleY = _btnRefreshShop.content.scaleX;
         }
         _btnRefreshShop.visible = User.current.character.hasTutorialFlag("tutorial_finished");
         if(param1)
         {
            _loc3_ = User.current.character;
            _shopSlot1.item = _loc3_.getShopItem(1);
            _shopSlot2.item = _loc3_.getShopItem(2);
            _shopSlot3.item = _loc3_.getShopItem(3);
            _shopSlot4.item = _loc3_.getShopItem(4);
            _shopSlot5.item = _loc3_.getShopItem(5);
            _shopSlot6.item = _loc3_.getShopItem(6);
            _shopSlot7.item = _loc3_.getShopItem(7);
            _shopSlot8.item = _loc3_.getShopItem(8);
            _shopSlot9.item = _loc3_.getShopItem(9);
         }
      }
      
      private function onClickBankInventory(param1:InteractionEvent) : void
      {
         panelManager.showDialog(new DialogBankInventory());
      }
      
      private function getRefreshShopTooltip() : String
      {
         if(_btnRefreshShop.premium)
         {
            return LocText.current.text("screen/item_shop/button_restock_goods_wait_tooltip",GameUtil.getPremiumCurrencyString(CConstant.shop_refresh_waiting_time_premium_amount),TimeUtil.secondsToString(TimeUtil.serverDateTime.secondsUntilTomorrow));
         }
         return LocText.current.text("screen/item_shop/button_restock_goods_default_tooltip");
      }
      
      override public function hide() : void
      {
         if(_avatar)
         {
            _avatar.stopAnimation();
            MessageRouter.removeListener("ItemMessage.notifyItemDragged",handleMessages);
            MessageRouter.removeListener("ItemMessage.notifyItemInteractionOver",handleMessages);
            MessageRouter.removeListener("ItemMessage.notifyItemInteractionOut",handleMessages);
         }
         super.hide();
      }
      
      override public function show(param1:* = null) : void
      {
         var _loc2_:SymbolPanelShopGeneric = _vo as SymbolPanelShopGeneric;
         super.show(param1);
         _avatar.startAnimation();
         switchBag(User.current.character.currentBag);
         ViewManager.instance.setBackground(3);
         ViewManager.instance.fadeInPanel(_vo);
         panelManager.dragDropManager.dragLayer = _loc2_.dragLayer;
         panelManager.dragDropManager.clearDropTargets();
         panelManager.dragDropManager.addDropTarget(_inventorySlot1);
         panelManager.dragDropManager.addDropTarget(_inventorySlot2);
         panelManager.dragDropManager.addDropTarget(_inventorySlot3);
         panelManager.dragDropManager.addDropTarget(_inventorySlot4);
         panelManager.dragDropManager.addDropTarget(_inventorySlot5);
         panelManager.dragDropManager.addDropTarget(_inventorySlot6);
         panelManager.dragDropManager.addDropTarget(_inventorySlot7);
         panelManager.dragDropManager.addDropTarget(_inventorySlot8);
         panelManager.dragDropManager.addDropTarget(_inventorySlot9);
         panelManager.dragDropManager.addDropTarget(_inventorySlot10);
         panelManager.dragDropManager.addDropTarget(_inventorySlot11);
         panelManager.dragDropManager.addDropTarget(_inventorySlot12);
         panelManager.dragDropManager.addDropTarget(_inventorySlot13);
         panelManager.dragDropManager.addDropTarget(_inventorySlot14);
         panelManager.dragDropManager.addDropTarget(_inventorySlot15);
         panelManager.dragDropManager.addDropTarget(_inventorySlot16);
         panelManager.dragDropManager.addDropTarget(_inventorySlot17);
         panelManager.dragDropManager.addDropTarget(_inventorySlot18);
         panelManager.dragDropManager.addDropTarget(_itemSlotHead);
         panelManager.dragDropManager.addDropTarget(_itemSlotChest);
         panelManager.dragDropManager.addDropTarget(_itemSlotBelt);
         panelManager.dragDropManager.addDropTarget(_itemSlotLegs);
         panelManager.dragDropManager.addDropTarget(_itemSlotBoots);
         panelManager.dragDropManager.addDropTarget(_itemSlotNecklace);
         panelManager.dragDropManager.addDropTarget(_itemSlotRing);
         panelManager.dragDropManager.addDropTarget(_itemSlotPiercing);
         panelManager.dragDropManager.addDropTarget(_itemSlotGadget);
         panelManager.dragDropManager.addDropTarget(_itemSlotMissiles);
         panelManager.dragDropManager.addDropTarget(_btnTabBag1);
         panelManager.dragDropManager.addDropTarget(_btnTabBag2);
         panelManager.dragDropManager.addDropTarget(_btnTabBag3);
         panelManager.dragDropManager.addDropTarget(_sellArea);
         panelManager.dragDropManager.addDropTarget(_sewArea);
         panelManager.dragDropManager.addDropTarget(_washArea);
         panelManager.dragDropManager.addDropTarget(_characterEquipLayer);
         panelManager.dragDropManager.addDropTarget(_shopSellLayer);
         panelManager.dragDropManager.addDropTarget(_customizeItemArea);
         _sewArea.refreshUI();
         _washArea.refreshUI();
         _customizeItemArea.refreshUI();
         if(!User.current.character.hasTutorialFlag("shop_shown"))
         {
            User.current.character.setTutorialFlag("shop_shown");
         }
         if(!User.current.character.hasTutorialFlag("first_item"))
         {
            ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/shop_items_arrow_text"),"left_side","right",870 + LayoutUtil.deviceAdjustedWidthCorrection,225 + LayoutUtil.deviceAdjustedHeightCorrection / 2,1.5,-60);
         }
         else if(!User.current.character.hasTutorialFlag("first_duel"))
         {
            ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/duel_arrow_text"),"left_back","down",368 + LayoutUtil.deviceAdjustedWidthCorrection / 2,535 + LayoutUtil.deviceAdjustedHeightCorrection,5,-50);
         }
         else if(!_loc2_.iconSewLock.visible && User.current.character.level == CConstant.sewing_machine_req_level && !User.current.character.hasTutorialFlag("sewing_machine_unlocked"))
         {
            ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/sewing_machine_arrow_text"),"left_side","right",960 + LayoutUtil.deviceAdjustedWidthCorrection,425 + LayoutUtil.deviceAdjustedHeightCorrection / 2,0.5,60);
         }
         _loc2_.avatarPreview.bringToTop();
         MessageRouter.addListener("ItemMessage.notifyItemDragged",handleMessages);
         MessageRouter.addListener("ItemMessage.notifyItemInteractionOver",handleMessages);
         MessageRouter.addListener("ItemMessage.notifyItemInteractionOut",handleMessages);
      }
      
      override public function refresh() : void
      {
         super.refresh();
         var _loc2_:SymbolPanelShopGeneric = _vo as SymbolPanelShopGeneric;
         var _loc1_:Character = User.current.character;
         _inventorySlot1.item = _loc1_.getItem("bag_item1_id");
         _inventorySlot2.item = _loc1_.getItem("bag_item2_id");
         _inventorySlot3.item = _loc1_.getItem("bag_item3_id");
         _inventorySlot4.item = _loc1_.getItem("bag_item4_id");
         _inventorySlot5.item = _loc1_.getItem("bag_item5_id");
         _inventorySlot6.item = _loc1_.getItem("bag_item6_id");
         _inventorySlot7.item = _loc1_.getItem("bag_item7_id");
         _inventorySlot8.item = _loc1_.getItem("bag_item8_id");
         _inventorySlot9.item = _loc1_.getItem("bag_item9_id");
         _inventorySlot10.item = _loc1_.getItem("bag_item10_id");
         _inventorySlot11.item = _loc1_.getItem("bag_item11_id");
         _inventorySlot12.item = _loc1_.getItem("bag_item12_id");
         _inventorySlot13.item = _loc1_.getItem("bag_item13_id");
         _inventorySlot14.item = _loc1_.getItem("bag_item14_id");
         _inventorySlot15.item = _loc1_.getItem("bag_item15_id");
         _inventorySlot16.item = _loc1_.getItem("bag_item16_id");
         _inventorySlot17.item = _loc1_.getItem("bag_item17_id");
         _inventorySlot18.item = _loc1_.getItem("bag_item18_id");
         _itemSlotHead.item = _loc1_.getItem("head_item_id");
         _itemSlotChest.item = _loc1_.getItem("chest_item_id");
         _itemSlotBelt.item = _loc1_.getItem("belt_item_id");
         _itemSlotLegs.item = _loc1_.getItem("legs_item_id");
         _itemSlotBoots.item = _loc1_.getItem("boots_item_id");
         _itemSlotNecklace.item = _loc1_.getItem("necklace_item_id");
         _itemSlotRing.item = _loc1_.getItem("ring_item_id");
         _itemSlotPiercing.item = _loc1_.getItem("piercing_item_id");
         _itemSlotGadget.item = _loc1_.getItem("gadget_item_id");
         _itemSlotMissiles.item = _loc1_.getItem("missiles_item_id");
         if(!DialogSewingMachine.isOpen && !DialogBankInventory.isOpen)
         {
            _shopSlot1.item = _loc1_.getItem("shop_item1_id");
            _shopSlot2.item = _loc1_.getItem("shop_item2_id");
            _shopSlot3.item = _loc1_.getItem("shop_item3_id");
            _shopSlot4.item = _loc1_.getItem("shop_item4_id");
            _shopSlot5.item = _loc1_.getItem("shop_item5_id");
            _shopSlot6.item = _loc1_.getItem("shop_item6_id");
            _shopSlot7.item = _loc1_.getItem("shop_item7_id");
            _shopSlot8.item = _loc1_.getItem("shop_item8_id");
            _shopSlot9.item = _loc1_.getItem("shop_item9_id");
         }
         _loc2_.iconHeadItemHidden.visible = !_loc1_.isHeadItemShown && _loc1_.getItemByType(1) != null;
         _loc2_.iconChestItemHidden.visible = !_loc1_.isChestItemShown && _loc1_.getItemByType(2) != null;
         _loc2_.iconBeltItemHidden.visible = !_loc1_.isBeltItemShown && _loc1_.getItemByType(3) != null;
         _loc2_.iconLegsItemHidden.visible = !_loc1_.isLegsItemShown && _loc1_.getItemByType(4) != null;
         _loc2_.iconBootsItemHidden.visible = !_loc1_.isBootsItemShown && _loc1_.getItemByType(5) != null;
         _stats.refresh(_loc1_);
         var _loc3_:Item = _loc1_.getItem("chest_item_id");
         if(_loc3_ && _loc1_.isChestItemShown && _loc3_.isOutfitItem)
         {
            _loc2_.iconOutfitInfo.visible = true;
         }
         else
         {
            _loc2_.iconOutfitInfo.visible = false;
         }
         _sewArea.visible = User.current.character.hasTutorialFlag("tutorial_finished");
         _washArea.visible = User.current.character.hasTutorialFlag("tutorial_finished");
         _sellArea.visible = User.current.character.hasTutorialFlag("tutorial_finished");
         _customizeItemArea.visible = User.current.character.hasTutorialFlag("tutorial_finished") && AppConfig.battleSkillsEnabled;
         _sewArea.refreshUI();
         _washArea.refreshUI();
         _customizeItemArea.refreshUI();
         _btnSpecialOffers.visible = ItemOfferCategories.instance.hasOffers && platform.isPremiumItemShopAllowed && AppConfig.specialOfferShopEnabled && User.current.character.hasTutorialFlag("tutorial_finished");
         if(_btnSpecialOffers.visible)
         {
            _btnSpecialOffers.buttonEnabled = User.current.character.level >= CConstant.item_shop_min_level;
            _btnSpecialOffers.tooltip = !!_btnSpecialOffers.buttonEnabled?LocText.current.text("screen/item_shop/buy_items_tooltip_active"):LocText.current.text("screen/item_shop/buy_items_tooltip_inactive",CConstant.item_shop_min_level);
         }
         _avatar.update(_loc1_.getCurrentSettings(),true);
         _loc2_.itemPatternCounter.visible = _loc2_.sewArea.visible && !_loc2_.iconSewLock.visible && (ItemPatterns.instance.hasNewItemPattern || ItemPatterns.instance.hasCollectableItemPatternValues);
         _btnOutfits.visible = User.current.character.level >= CConstant.outfit_min_level;
         _loc2_.btnOutfits.iconExclamationMark.visible = _btnOutfits.visible && User.current.character.outfits.hasMissingItems();
         refreshBag();
         refreshShopSelection(false);
      }
      
      private function onClickHelp(param1:InteractionEvent) : void
      {
         showTutorialDialog();
      }
      
      private function onClickSpecialOffers(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogBuyItemOffers());
      }
      
      public function updateCharacter() : void
      {
         var _loc1_:Character = User.current.character;
         _avatar.update(_loc1_.getCurrentSettings(),true);
      }
      
      private function onClickRefreshShop(param1:InteractionEvent) : void
      {
         MessageRouter.dispatch(new Message("InventoryMessage.notifyRefresh",{"usePremium":_btnRefreshShop.premium},this));
      }
      
      private function showTutorialDialog() : void
      {
         Environment.panelManager.showDialog(new DialogTutorialPopup(LocText.current.text("dialog/tutorial/item_shop/title"),LocText.current.text("dialog/tutorial/item_shop/text"),onTutorialDialogClosed));
      }
      
      private function onTutorialDialogClosed() : void
      {
         User.current.character.setTutorialFlag("shop");
      }
      
      private function handleMessages(param1:Message) : void
      {
         var _loc2_:* = param1.type;
         switch(_loc2_)
         {
            case "InventoryMessage.notifyBagChange":
               switchBag(param1.dataAsInt);
               break;
            case "ItemMessage.notifyItemDragged":
               if(!User.current.character.hasTutorialFlag("first_item"))
               {
                  ViewManager.instance.tutorialArrow.hide();
               }
               hidePreview();
               break;
            case "ItemMessage.notifyItemInteractionOver":
               showPreview(param1.data as UiItemGraphic);
               break;
            case "ItemMessage.notifyItemInteractionOut":
               hidePreview();
               break;
            default:
               throw new Error("Encountered unknown message type! type=" + param1.type);
         }
      }
      
      private function showPreview(param1:UiItemGraphic) : void
      {
         if(User.current.showShopPreview === false)
         {
            return;
         }
         var _loc2_:Item = param1.item;
         var _loc3_:UiItemSlot = param1.itemSlot;
         if(_loc3_.itemSlotType == 99 && (_loc2_.type == 1 || _loc2_.type == 3 || _loc2_.type == 2 || _loc2_.type == 4 || _loc2_.type == 5))
         {
            _previewAvatar.show(getCharacterSettings(_loc2_));
         }
         if(Environment.info.isTouchScreen && LayoutUtil.isPhoneLayout)
         {
            Runtime.delayFunction(positionPreview,0.001);
         }
      }
      
      private function positionPreview() : void
      {
         var _loc1_:* = null;
         if(TooltipLayer.instance.tooltip)
         {
            _loc1_ = _vo as SymbolPanelShopGeneric;
            _loc1_.avatarPreview.x = Math.max(Math.min(TooltipLayer.instance.tooltip.x - _loc1_.avatarPreview.width + 30,_peviewAvatarX),10);
         }
      }
      
      private function hidePreview() : void
      {
         if(User.current.showShopPreview === false)
         {
            return;
         }
         _previewAvatar.hide();
         updateCharacter();
      }
      
      private function getCharacterSettings(param1:Item) : AppearanceSettings
      {
         var _loc2_:AppearanceSettings = User.current.character.getCurrentSettings();
         if(param1.type == 1)
         {
            _loc2_.show_head_item = true;
            _loc2_.head = param1.identifier;
         }
         else if(param1.type == 2)
         {
            _loc2_.show_chest_item = true;
            _loc2_.chest = param1.identifier;
         }
         else if(param1.type == 3)
         {
            _loc2_.show_belt_item = true;
            _loc2_.belt = param1.identifier;
         }
         else if(param1.type == 4)
         {
            _loc2_.show_legs_item = true;
            _loc2_.legs = param1.identifier;
         }
         else if(param1.type == 5)
         {
            _loc2_.show_boots_item = true;
            _loc2_.boots = param1.identifier;
         }
         if(param1.type == 4 && _loc2_.chest != null && User.current.character.getItem("chest_item_id").isOutfitItem)
         {
            _loc2_.chest = null;
         }
         return _loc2_;
      }
   }
}

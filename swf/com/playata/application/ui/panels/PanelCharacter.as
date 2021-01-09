package com.playata.application.ui.panels
{
   import com.playata.application.AppConfig;
   import com.playata.application.AppEnvironment;
   import com.playata.application.assets.AppAssetUtil;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.marriage.Marriages;
   import com.playata.application.data.optical_changes.OpticalChangeBackground;
   import com.playata.application.data.optical_changes.OpticalChanges;
   import com.playata.application.data.titles.Titles;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogBankInventory;
   import com.playata.application.ui.dialogs.DialogCharacterDescription;
   import com.playata.application.ui.dialogs.DialogGoals;
   import com.playata.application.ui.dialogs.DialogGuildInvitation;
   import com.playata.application.ui.dialogs.DialogMovieHistory;
   import com.playata.application.ui.dialogs.DialogOpticalChanges;
   import com.playata.application.ui.dialogs.DialogOutfits;
   import com.playata.application.ui.dialogs.DialogTitles;
   import com.playata.application.ui.dialogs.DialogTutorialPopup;
   import com.playata.application.ui.elements.avatar.UiAvatar;
   import com.playata.application.ui.elements.avatar.UiAvatarImage;
   import com.playata.application.ui.elements.avatar.UiCharacterEquipLayer;
   import com.playata.application.ui.elements.booster.UiBoosterIcon;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.tab.UiInventoryTabButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.guild.UiGuildEmblem;
   import com.playata.application.ui.elements.item.UiItemGraphic;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.application.ui.elements.optical_changes.UiOpticalChangesCurrencyPanel;
   import com.playata.application.ui.elements.optical_changes.UiToggleUiButton;
   import com.playata.application.ui.elements.stats.UiStats;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.AnchorPoint;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.display.ui.TooltipLayer;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.panels.SymbolPanelCharacterGeneric;
   
   public class PanelCharacter extends DefaultPanel
   {
      
      public static var _fadeIn:Boolean = true;
       
      
      private var _btnHelp:UiButton = null;
      
      private var _btnToggleUi:UiToggleUiButton;
      
      private var _btnChangeAppearance:UiTextButton = null;
      
      private var _btnOutfits:UiButton = null;
      
      private var _btnMovies:UiButton = null;
      
      private var _btnAttack:UiPremiumButton = null;
      
      private var _btnSendMessage:UiButton = null;
      
      private var _btnViewGoals:UiButton = null;
      
      private var _btnViewGuild:UiButton = null;
      
      private var _btnInviteToGuild:UiButton = null;
      
      private var _btnTabBag1:UiInventoryTabButton = null;
      
      private var _btnTabBag2:UiInventoryTabButton = null;
      
      private var _btnTabBag3:UiInventoryTabButton = null;
      
      private var _btnBankInventory:UiButton = null;
      
      private var _btnTitle:UiButton = null;
      
      private var _tooltipLevelEnemy:UiTextTooltip = null;
      
      private var _tooltipLevelIconEnemy:UiTextTooltip = null;
      
      private var _tooltipHonor:UiTextTooltip = null;
      
      private var _tooltipHonorEnemy:UiTextTooltip = null;
      
      private var _tooltipHonorIcon:UiTextTooltip = null;
      
      private var _tooltipHonorIconEnemy:UiTextTooltip = null;
      
      private var _tooltipMovies:UiTextTooltip = null;
      
      private var _tooltipMoviesEnemy:UiTextTooltip = null;
      
      private var _tooltipMoviesIcon:UiTextTooltip = null;
      
      private var _tooltipMoviesIconEnemy:UiTextTooltip = null;
      
      private var _tooltipFans:UiTextTooltip = null;
      
      private var _tooltipFansEnemy:UiTextTooltip = null;
      
      private var _tooltipFansIcon:UiTextTooltip = null;
      
      private var _tooltipFansIconEnemy:UiTextTooltip = null;
      
      private var _tooltipGuild:UiTextTooltip = null;
      
      private var _tooltipGuildEnemy:UiTextTooltip = null;
      
      private var _tooltipOutfit:UiTextTooltip = null;
      
      private var _tooltipAvatarImage:UiTextTooltip = null;
      
      private var _avatar:UiAvatar = null;
      
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
      
      private var _booster1:UiBoosterIcon = null;
      
      private var _booster2:UiBoosterIcon = null;
      
      private var _booster3:UiBoosterIcon = null;
      
      private var _checkboxFriend:UiCheckBox = null;
      
      private var _headItemHiddenTooltip:UiTextTooltip = null;
      
      private var _chestItemHiddenTooltip:UiTextTooltip = null;
      
      private var _beltItemHiddenTooltip:UiTextTooltip = null;
      
      private var _legsItemHiddenTooltip:UiTextTooltip = null;
      
      private var _bootsItemHiddenTooltip:UiTextTooltip = null;
      
      private var _stats:UiStats = null;
      
      private var _ownStats:UiStats = null;
      
      private var _descriptionTooltip:UiTextTooltip = null;
      
      private var _customCharacter:Character = null;
      
      private var _timer:ITimer = null;
      
      private var _guildEmblem:UiGuildEmblem = null;
      
      private var _guildEmblemEnemy:UiGuildEmblem = null;
      
      private var _avatarImage:UiAvatarImage;
      
      private var _clickLayerAvatarImage:InteractiveDisplayObject = null;
      
      private var _clickLayerDescription:InteractiveDisplayObject = null;
      
      private var _characterEquipLayer:UiCharacterEquipLayer = null;
      
      private var _opticalChangeCurrencyPanel:UiOpticalChangesCurrencyPanel = null;
      
      private var _background:OpticalChangeBackground = null;
      
      public function PanelCharacter(param1:SymbolPanelCharacterGeneric)
      {
         super(param1);
         _btnHelp = new UiButton(param1.btnHelp,LocText.current.text("general/button_help"),onClickHelp);
         _btnToggleUi = new UiToggleUiButton(param1.btnToggleUi);
         _btnChangeAppearance = new UiTextButton(param1.infoBox.btnChangeAppearance,LocText.current.text("screen/character_overview/button_change_appearance"),LocText.current.text("screen/character_overview/button_change_appearance_tooltip"),onClickChangeAppearance);
         _btnOutfits = new UiButton(param1.btnOutfits,LocText.current.text("screen/character_overview/button_outfits_tooltip"),onClickOutfits);
         _btnMovies = new UiButton(param1.infoBox.btnMovies,LocText.current.text("screen/character_overview/button_movies_tooltip"),onClickMovies);
         _btnAttack = new UiPremiumButton(param1.btnAttack,CConstant.duel_single_attack_premium_amount,LocText.current.text("screen/duel/button_attack"),LocText.current.text("screen/duel/button_attack"),LocText.current.text("screen/duel/button_attack_tooltip"),LocText.current.text("screen/duel/button_attack_tooltip"),onClickAttack);
         _btnSendMessage = new UiButton(param1.infoBox.btnSendMessage,"",onClickSendMessage);
         _btnViewGoals = new UiButton(param1.infoBox.btnViewGoals,"",onClickViewGoals);
         _btnViewGuild = new UiButton(param1.infoBox.btnViewGuild,"",onClickViewGuild);
         _btnInviteToGuild = new UiButton(param1.infoBox.btnInviteToGuild,"",onClickInviteToGuild);
         _btnTabBag1 = new UiInventoryTabButton(param1.btnTabBag1,0,"1","",onClickTabBag1);
         _btnTabBag2 = new UiInventoryTabButton(param1.btnTabBag2,1,"2","",onClickTabBag2);
         _btnTabBag3 = new UiInventoryTabButton(param1.btnTabBag3,2,"3","",onClickTabBag3);
         _btnBankInventory = new UiButton(param1.iconBox,LocText.current.text("dialog/bank_inventory/title"),onClickBankInventory);
         _btnTabBag1.textTooltip.requestTextFunction = requestBag1Tooltip;
         _btnTabBag2.textTooltip.requestTextFunction = requestBag2Tooltip;
         _btnTabBag3.textTooltip.requestTextFunction = requestBag3Tooltip;
         _guildEmblem = new UiGuildEmblem(param1.infoBox.guildEmblem,null,32,32,loadGuild,false);
         _guildEmblem.enableButton = true;
         _guildEmblemEnemy = new UiGuildEmblem(param1.infoBox.enemyInformation.guildEmblem,null,32,32,loadGuild,false);
         _guildEmblemEnemy.enableButton = true;
         _avatarImage = new UiAvatarImage(param1.infoBox.imageAvatarPlaceholder);
         if(AppConfig.titlesEnabled)
         {
            _btnTitle = new UiButton(param1.characterName,"",onClickChangeTitle);
         }
         else
         {
            param1.characterName.txtTitle.visible = false;
            param1.characterName.info.visible = false;
         }
         _tooltipLevelEnemy = new UiTextTooltip(param1.infoBox.enemyInformation.txtLevel,"");
         _tooltipLevelIconEnemy = new UiTextTooltip(param1.infoBox.enemyInformation.iconLevel,"");
         _tooltipHonor = new UiTextTooltip(param1.infoBox.txtHonor,LocText.current.text("general/honor_tooltip"));
         _tooltipHonorEnemy = new UiTextTooltip(param1.infoBox.enemyInformation.txtHonor,LocText.current.text("general/honor_tooltip"));
         _tooltipHonorIcon = new UiTextTooltip(param1.infoBox.iconHonor,LocText.current.text("general/honor_tooltip"));
         _tooltipHonorIconEnemy = new UiTextTooltip(param1.infoBox.enemyInformation.iconHonor,LocText.current.text("general/honor_tooltip"));
         _tooltipFans = new UiTextTooltip(param1.infoBox.txtFans,LocText.current.text("general/fans_tooltip"));
         _tooltipFansEnemy = new UiTextTooltip(param1.infoBox.enemyInformation.txtFans,LocText.current.text("general/fans_tooltip"));
         _tooltipFansIcon = new UiTextTooltip(param1.infoBox.iconFans,LocText.current.text("general/fans_tooltip"));
         _tooltipFansIconEnemy = new UiTextTooltip(param1.infoBox.enemyInformation.iconFans,LocText.current.text("general/fans_tooltip"));
         _tooltipMovies = new UiTextTooltip(param1.infoBox.txtMovies,LocText.current.text("general/movies_tooltip"));
         _tooltipMoviesEnemy = new UiTextTooltip(param1.infoBox.enemyInformation.txtMovies,LocText.current.text("general/movies_tooltip"));
         _tooltipMoviesIcon = new UiTextTooltip(param1.infoBox.iconMovies,LocText.current.text("general/movies_tooltip"));
         _tooltipMoviesIconEnemy = new UiTextTooltip(param1.infoBox.enemyInformation.iconMovies,LocText.current.text("general/movies_tooltip"));
         _tooltipGuild = new UiTextTooltip(param1.infoBox.txtGuildName,"");
         _tooltipGuildEnemy = new UiTextTooltip(param1.infoBox.enemyInformation.txtGuildName,"");
         _tooltipOutfit = new UiTextTooltip(param1.iconOutfitInfo,LocText.current.text("general/outfit_tooltip"));
         param1.txtOwnStats.text = LocText.current.text("screen/character_overview/own_stats");
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
         _opticalChangeCurrencyPanel = new UiOpticalChangesCurrencyPanel(param1.opticalChangePanel,onClickShowOpticalChanges);
         _booster1 = new UiBoosterIcon(param1.infoBox.boosterType1,1);
         _booster2 = new UiBoosterIcon(param1.infoBox.boosterType2,2);
         _booster3 = new UiBoosterIcon(param1.infoBox.boosterType3,3);
         _checkboxFriend = new UiCheckBox(param1.infoBox.checkFriend,false,LocText.current.text("screen/character/add_as_friend_tooltip"),onCheckedFriend,null,param1.infoBox.txtFriend);
         param1.infoBox.txtFriend.text = LocText.current.text("screen/character/add_as_friend");
         _headItemHiddenTooltip = new UiTextTooltip(param1.iconHeadItemHidden,LocText.current.text("screen/character/show_head_item_hidden_tooltip"));
         _chestItemHiddenTooltip = new UiTextTooltip(param1.iconChestItemHidden,LocText.current.text("screen/character/show_chest_item_hidden_tooltip"));
         _beltItemHiddenTooltip = new UiTextTooltip(param1.iconBeltItemHidden,LocText.current.text("screen/character/show_belt_item_hidden_tooltip"));
         _legsItemHiddenTooltip = new UiTextTooltip(param1.iconLegsItemHidden,LocText.current.text("screen/character/show_legs_item_hidden_tooltip"));
         _bootsItemHiddenTooltip = new UiTextTooltip(param1.iconBootsItemHidden,LocText.current.text("screen/character/show_boots_item_hidden_tooltip"));
         _clickLayerAvatarImage = new InteractiveDisplayObject(param1.infoBox.clickLayerAvatar);
         _clickLayerAvatarImage.onClick.add(handleAvatarImageClick);
         _clickLayerDescription = new InteractiveDisplayObject(param1.infoBox.clickLayerDescription);
         _clickLayerDescription.onClick.add(handleDescriptionClick);
         _booster1.onClick.add(handleBoosterClick);
         _booster2.onClick.add(handleBoosterClick);
         _booster3.onClick.add(handleBoosterClick);
         _stats = new UiStats(param1.stats);
         _ownStats = new UiStats(param1.statsComparison,false);
         _avatar = new UiAvatar(param1.avatar,true,false,true);
         _timer = Environment.createTimer("PanelCharacter::timer",1000,onTimerEvent);
         _descriptionTooltip = new UiTextTooltip(param1.infoBox.clickLayerDescription,"");
         _tooltipAvatarImage = new UiTextTooltip(param1.infoBox.clickLayerAvatar,LocText.current.text("screen/character_overview/button_change_appearance_photographer_tooltip"));
         if(Environment.info.isTouchScreen)
         {
            _tooltipAvatarImage.text = "";
         }
         MessageRouter.addListener("InventoryMessage.notifyBagChange",handleMessages);
         param1.infoBox.txtGuildName.onClick.add(loadGuild);
         param1.infoBox.enemyInformation.txtGuildName.onClick.add(loadGuild);
         switchBag(0);
         param1.dragLayer.removeAllChildren();
         _characterEquipLayer = new UiCharacterEquipLayer(param1.characterLayer);
         _anchorContainer.add(param1.characterName,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.avatar,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.btnAttack,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.txtTimeToNextAttack,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.txtServerId,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.iconServerLocale,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.itemSlotNecklace,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.itemSlotRing,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.itemSlotPiercing,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.itemSlotGadget,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.itemSlotMissiles,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.infoBox,AnchorPoint.RIGHT_FIXED);
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
         _anchorContainer.add(param1.statsComparison,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.txtOwnStats,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.characterLayer,AnchorPoint.BOTTOM_FIXED,0.77);
         _anchorContainer.add(param1.avatar,AnchorPoint.BOTTOM_FIXED,0.77);
         _anchorContainer.add(param1.btnAttack,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.txtTimeToNextAttack,AnchorPoint.BOTTOM_FIXED,0.5);
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
         _anchorContainer.add(param1.infoBox,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.opticalChangePanel,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.btnToggleUi,AnchorPoint.BOTTOM_RIGHT);
         _background = new OpticalChangeBackground(param1.background,22,1);
      }
      
      override public function refreshAppSize() : void
      {
         super.refreshAppSize();
         _background.refreshAppSize();
      }
      
      override public function refreshPanelLocalization() : void
      {
         var _loc1_:SymbolPanelCharacterGeneric = _vo as SymbolPanelCharacterGeneric;
         _btnHelp.tooltip = LocText.current.text("general/button_help");
         _btnToggleUi.refreshLocalization();
         _btnChangeAppearance.caption = LocText.current.text("screen/character_overview/button_change_appearance");
         _btnChangeAppearance.tooltip = LocText.current.text("screen/character_overview/button_change_appearance_tooltip");
         _btnOutfits.tooltip = LocText.current.text("screen/character_overview/button_outfits_tooltip");
         _btnMovies.tooltip = LocText.current.text("screen/character_overview/button_movies_tooltip");
         _btnAttack.nonPremiumCaption = LocText.current.text("screen/duel/button_attack");
         _btnAttack.premiumCaption = LocText.current.text("screen/duel/button_attack");
         _btnAttack.nonPremiumTooltip = LocText.current.text("screen/duel/button_attack_tooltip");
         _btnAttack.premiumTooltip = LocText.current.text("screen/duel/button_attack_tooltip");
         _tooltipHonor.text = LocText.current.text("general/honor_tooltip");
         _tooltipHonorEnemy.text = LocText.current.text("general/honor_tooltip");
         _tooltipHonorIcon.text = LocText.current.text("general/honor_tooltip");
         _tooltipHonorIconEnemy.text = LocText.current.text("general/honor_tooltip");
         _tooltipFans.text = LocText.current.text("general/fans_tooltip");
         _tooltipFansEnemy.text = LocText.current.text("general/fans_tooltip");
         _tooltipFansIcon.text = LocText.current.text("general/fans_tooltip");
         _tooltipFansIconEnemy.text = LocText.current.text("general/fans_tooltip");
         _tooltipMovies.text = LocText.current.text("general/movies_tooltip");
         _tooltipMoviesEnemy.text = LocText.current.text("general/movies_tooltip");
         _tooltipMoviesIcon.text = LocText.current.text("general/movies_tooltip");
         _tooltipMoviesIconEnemy.text = LocText.current.text("general/movies_tooltip");
         _tooltipOutfit.text = LocText.current.text("general/outfit_tooltip");
         _tooltipAvatarImage.text = LocText.current.text("screen/character_overview/button_change_appearance_photographer_tooltip");
         if(Environment.info.isTouchScreen)
         {
            _tooltipAvatarImage.text = "";
         }
         _loc1_.txtOwnStats.text = LocText.current.text("screen/character_overview/own_stats");
         _headItemHiddenTooltip.text = LocText.current.text("screen/character/show_head_item_hidden_tooltip");
         _chestItemHiddenTooltip.text = LocText.current.text("screen/character/show_chest_item_hidden_tooltip");
         _beltItemHiddenTooltip.text = LocText.current.text("screen/character/show_belt_item_hidden_tooltip");
         _legsItemHiddenTooltip.text = LocText.current.text("screen/character/show_legs_item_hidden_tooltip");
         _bootsItemHiddenTooltip.text = LocText.current.text("screen/character/show_boots_item_hidden_tooltip");
         _opticalChangeCurrencyPanel.refreshLocalization();
         if(_shown)
         {
            refresh();
         }
      }
      
      override public function dispose() : void
      {
         _clickLayerAvatarImage.dispose();
         _clickLayerDescription.dispose();
         _characterEquipLayer.dispose();
         _btnHelp.dispose();
         _btnHelp = null;
         _opticalChangeCurrencyPanel.dispose();
         _opticalChangeCurrencyPanel = null;
         _btnChangeAppearance.dispose();
         _btnChangeAppearance = null;
         _btnOutfits.dispose();
         _btnOutfits = null;
         _btnMovies.dispose();
         _btnMovies = null;
         _btnAttack.dispose();
         _btnAttack = null;
         _btnSendMessage.dispose();
         _btnSendMessage = null;
         _btnViewGoals.dispose();
         _btnViewGoals = null;
         _btnViewGuild.dispose();
         _btnViewGuild = null;
         _btnInviteToGuild.dispose();
         _btnInviteToGuild = null;
         _btnTabBag1.dispose();
         _btnTabBag1 = null;
         _btnTabBag2.dispose();
         _btnTabBag2 = null;
         _btnTabBag3.dispose();
         _btnTabBag3 = null;
         _btnBankInventory.dispose();
         _btnBankInventory = null;
         _tooltipLevelEnemy.dispose();
         _tooltipLevelIconEnemy.dispose();
         _tooltipHonor.dispose();
         _tooltipHonorEnemy.dispose();
         _tooltipHonorIcon.dispose();
         _tooltipHonorIconEnemy.dispose();
         _tooltipFans.dispose();
         _tooltipFansEnemy.dispose();
         _tooltipFansIcon.dispose();
         _tooltipFansIconEnemy.dispose();
         _tooltipMovies.dispose();
         _tooltipMoviesEnemy.dispose();
         _tooltipMoviesIcon.dispose();
         _tooltipMoviesIconEnemy.dispose();
         _tooltipGuild.dispose();
         _tooltipGuildEnemy.dispose();
         _tooltipOutfit.dispose();
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
         _booster1.dispose();
         _booster2.dispose();
         _booster3.dispose();
         _checkboxFriend.dispose();
         _headItemHiddenTooltip.dispose();
         _chestItemHiddenTooltip.dispose();
         _beltItemHiddenTooltip.dispose();
         _legsItemHiddenTooltip.dispose();
         _bootsItemHiddenTooltip.dispose();
         _stats.dispose();
         _ownStats.dispose();
         _avatar.dispose();
         _background.dispose();
         _tooltipLevelEnemy = null;
         _tooltipLevelIconEnemy = null;
         _tooltipHonor = null;
         _tooltipHonorEnemy = null;
         _tooltipHonorIcon = null;
         _tooltipHonorIconEnemy = null;
         _tooltipFans = null;
         _tooltipFansEnemy = null;
         _tooltipFansIcon = null;
         _tooltipFansIconEnemy = null;
         _tooltipMovies = null;
         _tooltipMoviesEnemy = null;
         _tooltipMoviesIcon = null;
         _tooltipMoviesIconEnemy = null;
         _tooltipGuild = null;
         _tooltipGuildEnemy = null;
         _tooltipOutfit = null;
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
         _booster1 = null;
         _booster2 = null;
         _booster3 = null;
         _checkboxFriend = null;
         _headItemHiddenTooltip = null;
         _chestItemHiddenTooltip = null;
         _beltItemHiddenTooltip = null;
         _legsItemHiddenTooltip = null;
         _bootsItemHiddenTooltip = null;
         _stats = null;
         _ownStats = null;
         _avatar = null;
         _background = null;
         _guildEmblem.dispose();
         _guildEmblemEnemy.dispose();
         _guildEmblem = null;
         _guildEmblemEnemy = null;
         _timer.dispose();
         _timer = null;
         super.dispose();
         MessageRouter.removeAllListeners(handleMessages);
      }
      
      public function get avatar() : UiAvatar
      {
         return _avatar;
      }
      
      private function onTimerEvent() : void
      {
         if(_customCharacter == null)
         {
            return;
         }
         if(!User.current)
         {
            if(_timer)
            {
               _timer.stop();
            }
            return;
         }
         if(!_shown)
         {
            return;
         }
         var _loc1_:SymbolPanelCharacterGeneric = _vo as SymbolPanelCharacterGeneric;
         _loc1_.txtTimeToNextAttack.text = LocText.current.text("screen/character/time_to_next_attack",TimeUtil.secondsToString(User.current.character.secondsToNextFreeDuel));
         _loc1_.txtTimeToNextAttack.visible = !User.current.character.hasAvailableFreeDuel && _customCharacter != null;
         _btnAttack.premium = !User.current.character.hasAvailableFreeDuel;
      }
      
      override public function show(param1:* = null) : void
      {
         payload = param1;
         var vo:SymbolPanelCharacterGeneric = _vo as SymbolPanelCharacterGeneric;
         vo.txtTimeToNextAttack.text = "";
         super.show(payload);
         _avatar.startAnimation();
         if(_customCharacter == null)
         {
            switchBag(User.current.character.currentBag);
         }
         panelManager.dragDropManager.dragLayer = vo.dragLayer;
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
         panelManager.dragDropManager.addDropTarget(_characterEquipLayer);
         var character:Character = User.current.character;
         if(!character.hasTutorialFlag("first_visit"))
         {
            TooltipLayer.instance.showTooltips = false;
            var fadeInElements:Vector.<IDisplayObject> = new Vector.<IDisplayObject>();
            fadeInElements.push(_inventorySlot1.container);
            fadeInElements.push(_inventorySlot2.container);
            fadeInElements.push(_inventorySlot3.container);
            fadeInElements.push(_inventorySlot4.container);
            fadeInElements.push(_inventorySlot5.container);
            fadeInElements.push(_inventorySlot6.container);
            fadeInElements.push(_itemSlotHead.container);
            fadeInElements.push(_itemSlotChest.container);
            fadeInElements.push(_itemSlotBelt.container);
            fadeInElements.push(_itemSlotLegs.container);
            fadeInElements.push(_itemSlotBoots.container);
            fadeInElements.push(_itemSlotNecklace.container);
            fadeInElements.push(_itemSlotRing.container);
            fadeInElements.push(_itemSlotPiercing.container);
            fadeInElements.push(_itemSlotGadget.container);
            fadeInElements.push(_itemSlotMissiles.container);
            fadeInElements.push(_btnHelp);
            fadeInElements.push(_btnMovies);
            fadeInElements.push(_booster1.container);
            fadeInElements.push(_booster2.container);
            fadeInElements.push(_booster3.container);
            fadeInElements.push(_stats.container);
            fadeInElements.push(vo.infoBox.frameBackground);
            if(_btnTitle)
            {
               fadeInElements.push(_btnTitle);
            }
            else
            {
               fadeInElements.push(vo.characterName);
            }
            fadeInElements.push(vo.infoBox.txtHonor);
            fadeInElements.push(vo.infoBox.iconGuild);
            fadeInElements.push(vo.infoBox.txtGuildName);
            fadeInElements.push(vo.infoBox.txtDescription);
            fadeInElements.push(vo.infoBox.iconHonor);
            fadeInElements.push(vo.infoBox.enemyInformation);
            fadeInElements.push(vo.infoBox.iconPhotographer);
            fadeInElements.push(ViewManager.instance.baseUserPanel.container);
            fadeInElements.push(vo.infoBox.iconMovies);
            fadeInElements.push(vo.infoBox.txtMovies);
            fadeInElements.push(_btnMovies);
            fadeInElements.push(vo.infoBox.iconFans);
            fadeInElements.push(vo.infoBox.txtFans);
            fadeInElements.push(vo.infoBox.imageAvatarPlaceholder);
            var delayDuration:Number = 2;
            var _loc4_:int = 0;
            var _loc3_:* = fadeInElements;
            for each(fadeInElement in fadeInElements)
            {
               fadeInElement.alpha = 0;
               fadeInElement.tweenTo(3,{
                  "delay":delayDuration,
                  "alpha":1
               });
            }
            var enableTooltips:Function = function():void
            {
               TooltipLayer.instance.showTooltips = true;
               var _loc1_:String = LocText.current.text("tutorial/character_created/title_male");
               if(character.isFemale)
               {
                  _loc1_ = LocText.current.text("tutorial/character_created/title_female");
               }
               Environment.audio.playFX("event_duel_time_complete.mp3");
               Environment.panelManager.showDialog(new DialogTutorialPopup(_loc1_,LocText.current.text("tutorial/character_created/text",character.name),showMissionsArrow));
               character.setTutorialFlag("first_visit");
            };
            Runtime.delayFunction(enableTooltips,delayDuration + 2);
         }
         else
         {
            if(_fadeIn)
            {
               ViewManager.instance.fadeInPanel(_vo);
            }
            if(character == User.current.character)
            {
               if(!character.hasTutorialFlag("tutorial_finished"))
               {
                  if(!character.hasTutorialFlag("mission_shown") || !character.hasTutorialFlag("first_mission"))
                  {
                     showMissionsArrow();
                  }
                  else if(character.hasAvailableStatPoints && character.level == 2 && !character.hasTutorialFlag("tutorial_finished"))
                  {
                     ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/improve_stats_arrow_text"),"right_side","left",195,(!!Environment.info.isTouchScreen?120:Number(194)) + LayoutUtil.deviceAdjustedHeightCorrection / 2,1,-120,true);
                     ViewManager.instance.baseUserPanel.refreshMainNavigationButtons();
                  }
                  else if(!character.hasTutorialFlag("shop_shown") || !character.hasTutorialFlag("first_item"))
                  {
                     ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/shop_arrow_text"),"right_back","down",281 + LayoutUtil.deviceAdjustedWidthCorrection / 2,535 + LayoutUtil.deviceAdjustedHeightCorrection,1.5,-30,true);
                  }
                  else if(!character.hasTutorialFlag("first_duel"))
                  {
                     ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/duel_arrow_text"),"right_back","down",368 + LayoutUtil.deviceAdjustedWidthCorrection / 2,535 + LayoutUtil.deviceAdjustedHeightCorrection,1.5,-30,true);
                  }
               }
               else if(!User.current.character.hasTutorialFlag("storygoals"))
               {
                  ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/storyggoals_arrow_text"),"right_side","up",125,110,1.5,0,false,"storygoals");
               }
               else if(User.current.character.level >= CConstant.movie_min_level && !character.hasTutorialFlag("movie_new"))
               {
                  ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/movies_arrow_text"),"left_back","down",473 + LayoutUtil.deviceAdjustedWidthCorrection / 2,530 + LayoutUtil.deviceAdjustedHeightCorrection,1.5);
               }
               else if(AppConfig.streamingEnabled && User.current.character.fansTotal > 0 && !character.hasTutorialFlag("streaming_unlocked"))
               {
                  ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/streaming_arrow_text"),"left_back","down",574 + LayoutUtil.deviceAdjustedWidthCorrection / 2,530 + LayoutUtil.deviceAdjustedHeightCorrection,1.5);
               }
               else if(User.current.character.level >= CConstant.optical_change_unlock_level && !character.hasTutorialFlag("optical_change"))
               {
                  ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/optical_change_text"),"right_back","left",240 + LayoutUtil.deviceAdjustedWidthCorrection / 2,403 + LayoutUtil.deviceAdjustedHeightCorrection,1.5);
               }
            }
         }
      }
      
      override public function hide() : void
      {
         if(_avatar)
         {
            _avatar.stopAnimation();
         }
         if(_background)
         {
            _background.hide();
         }
         if(_opticalChangeCurrencyPanel)
         {
            _opticalChangeCurrencyPanel.hide();
         }
         super.hide();
      }
      
      private function showMissionsArrow() : void
      {
         ViewManager.instance.tutorialArrow.hide();
         ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/missions_arrow_text"),"right_back","down",191 + LayoutUtil.deviceAdjustedWidthCorrection / 2,535 + LayoutUtil.deviceAdjustedHeightCorrection,1,-30,true);
      }
      
      override public function refresh() : void
      {
         var _loc7_:* = null;
         var _loc5_:int = 0;
         var _loc2_:* = null;
         super.refresh();
         ViewManager.instance.baseUserPanel.refreshGoalIcon();
         var _loc4_:SymbolPanelCharacterGeneric = _vo as SymbolPanelCharacterGeneric;
         var _loc1_:Character = User.current.character;
         _loc4_.infoBox.clickLayerAvatar.visible = _customCharacter == null && User.current.character.hasTutorialFlag("tutorial_finished");
         if(_customCharacter != null)
         {
            _loc1_ = _customCharacter;
            _avatarImage.showWithSettings(_customCharacter.avatarImage);
         }
         else
         {
            _avatarImage.setToUser();
         }
         _btnToggleUi.refresh(_loc1_);
         if(_customCharacter)
         {
            _background.setBackground(_customCharacter.opticalChanges);
         }
         else
         {
            _background.setBackground(OpticalChanges.instance.allActiveOptions);
         }
         if(_btnTitle)
         {
            _loc4_.characterName.killTweens();
            _loc4_.characterName.removeAllFilters();
            if(_customCharacter == null && (Titles.instance.availableTitles(_loc1_).length > 0 || Marriages.instance.getMarriagesOfCharacterId(_loc1_.id).length > 0))
            {
               _btnTitle.buttonEnabled = true;
               _loc4_.characterName.info.caption.text = _loc1_.newTitlesCount.toString();
               _loc4_.characterName.info.x = _loc4_.characterName.txtName.textWidth * 0.5 + 5;
               if(_loc1_.newTitlesCount > 0)
               {
                  _loc4_.characterName.info.visible = true;
                  _loc4_.characterName.tweenTo(1,{
                     "yoyo":true,
                     "repeat":-1,
                     "glowFilter":{
                        "color":16711908,
                        "alpha":1,
                        "strength":3,
                        "blurX":40,
                        "blurY":40
                     }
                  });
                  _btnTitle.tooltip = LocText.current.text("screen/character_overview/tooltip_new_titles",_loc1_.newTitlesCount);
                  if(_loc1_.hasTutorialFlag("tutorial_finished") && !_loc1_.hasTutorialFlag("titles") && !ViewManager.instance.tutorialArrow.tutorialVisible)
                  {
                     ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/titles_arrow_text",_loc1_.newTitlesCount),"left_back","up",580 + LayoutUtil.deviceAdjustedWidthCorrection / 2,110,1.5,0,true);
                  }
               }
               else
               {
                  _loc4_.characterName.info.visible = false;
                  _btnTitle.tooltip = "";
               }
            }
            else
            {
               _btnTitle.tooltip = _customCharacter != null?"":LocText.current.text("screen/character/no_title_tooltip");
               _btnTitle.buttonEnabled = false;
               _loc4_.characterName.info.visible = false;
            }
         }
         var _loc8_:int = LocText.current.gender;
         if(_customCharacter != null)
         {
            LocText.current.gender = !!_customCharacter.isMale?1:2;
         }
         ViewManager.instance.baseUserPanel.showUserBars(_customCharacter == null);
         _btnChangeAppearance.visible = _customCharacter == null && User.current.character.hasTutorialFlag("tutorial_finished");
         _btnOutfits.visible = _customCharacter == null && User.current.character.level >= CConstant.outfit_min_level;
         _loc4_.btnOutfits.iconExclamationMark.visible = _btnOutfits.visible && User.current.character.outfits.hasMissingItems();
         if(_btnOutfits.visible && !User.current.character.hasTutorialFlag("tutorial_outfits") && !ViewManager.instance.tutorialArrow.tutorialVisible)
         {
            ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/outfits_arrow_text"),"right_front","down",212,510 + LayoutUtil.deviceAdjustedHeightCorrection / 2,1.5,0,true);
         }
         _btnMovies.visible = User.current.character.hasTutorialFlag("tutorial_finished");
         if(_btnMovies.visible)
         {
            if(_loc1_.moviesTotal > 0)
            {
               _btnMovies.buttonEnabled = true;
               _btnMovies.tooltip = _customCharacter != null?LocText.current.text("screen/character_overview/button_movies_movies_other",_loc1_.name):LocText.current.text("screen/character_overview/button_movies_movies_player");
            }
            else
            {
               _btnMovies.buttonEnabled = false;
               _btnMovies.tooltip = _customCharacter != null?LocText.current.text("screen/character_overview/button_movies_no_movie_other",_loc1_.name):LocText.current.text("screen/character_overview/button_movies_no_movie_player");
            }
         }
         _inventorySlot1.container.visible = _customCharacter == null && _btnTabBag1.tabbed;
         _inventorySlot2.container.visible = _customCharacter == null && _btnTabBag1.tabbed;
         _inventorySlot3.container.visible = _customCharacter == null && _btnTabBag1.tabbed;
         _inventorySlot4.container.visible = _customCharacter == null && _btnTabBag1.tabbed;
         _inventorySlot5.container.visible = _customCharacter == null && _btnTabBag1.tabbed;
         _inventorySlot6.container.visible = _customCharacter == null && _btnTabBag1.tabbed;
         _inventorySlot7.container.visible = _customCharacter == null && _btnTabBag2.tabbed;
         _inventorySlot8.container.visible = _customCharacter == null && _btnTabBag2.tabbed;
         _inventorySlot9.container.visible = _customCharacter == null && _btnTabBag2.tabbed;
         _inventorySlot10.container.visible = _customCharacter == null && _btnTabBag2.tabbed;
         _inventorySlot11.container.visible = _customCharacter == null && _btnTabBag2.tabbed;
         _inventorySlot12.container.visible = _customCharacter == null && _btnTabBag2.tabbed;
         _inventorySlot13.container.visible = _customCharacter == null && _btnTabBag3.tabbed;
         _inventorySlot14.container.visible = _customCharacter == null && _btnTabBag3.tabbed;
         _inventorySlot15.container.visible = _customCharacter == null && _btnTabBag3.tabbed;
         _inventorySlot16.container.visible = _customCharacter == null && _btnTabBag3.tabbed;
         _inventorySlot17.container.visible = _customCharacter == null && _btnTabBag3.tabbed;
         _inventorySlot18.container.visible = _customCharacter == null && _btnTabBag3.tabbed;
         _btnBankInventory.visible = _customCharacter == null && User.current.character.hasTutorialFlag("tutorial_finished");
         _itemSlotHead.locked = _customCharacter != null;
         _itemSlotChest.locked = _customCharacter != null;
         _itemSlotBelt.locked = _customCharacter != null;
         _itemSlotLegs.locked = _customCharacter != null;
         _itemSlotBoots.locked = _customCharacter != null;
         _itemSlotNecklace.locked = _customCharacter != null;
         _itemSlotRing.locked = _customCharacter != null;
         _itemSlotPiercing.locked = _customCharacter != null;
         _itemSlotGadget.locked = _customCharacter != null;
         _itemSlotMissiles.locked = _customCharacter != null;
         _stats.enableIncrease(_customCharacter == null);
         _loc4_.statsComparison.visible = _customCharacter != null;
         _loc4_.txtOwnStats.visible = _customCharacter != null;
         _ownStats.enableIncrease(false);
         _loc4_.infoBox.iconOnline.visible = _customCharacter != null && _customCharacter.isOnline;
         _loc4_.infoBox.txtOnline.visible = _customCharacter != null && _customCharacter.isOnline;
         _loc4_.infoBox.txtOnline.text = LocText.current.text("screen/character_overview/online_tooltip");
         _btnAttack.visible = _customCharacter != null && !_customCharacter.isDeleted;
         _loc4_.txtTimeToNextAttack.visible = !User.current.character.hasAvailableFreeDuel && _customCharacter != null;
         _btnSendMessage.visible = _customCharacter != null && !_customCharacter.isDeleted;
         _btnSendMessage.tooltip = LocText.current.text("screen/character_overview/button_send_message_tooltip",_loc1_.name);
         _btnViewGoals.visible = _customCharacter != null;
         _btnViewGoals.tooltip = LocText.current.text("screen/character_overview/button_view_goals_tooltip",_loc1_.name);
         _btnViewGuild.visible = _customCharacter != null && (_customCharacter.hasGuild || !_customCharacter.hasGuild && !User.current.character.hasGuild);
         _btnViewGuild.tooltip = LocText.current.text("screen/character_overview/button_view_guild_tooltip",_loc1_.name);
         _btnInviteToGuild.visible = _customCharacter != null && !_customCharacter.isDeleted && !_customCharacter.hasGuild && (User.current.character.hasGuild && User.current.character.guildRank != 3 && !User.current.character.guild.isFull);
         _btnInviteToGuild.tooltip = LocText.current.text("screen/character_overview/button_invite_to_guild_tooltip",_loc1_.name);
         if(_customCharacter != null && (!_customCharacter.hasGuild && !User.current.character.hasGuild))
         {
            _btnViewGuild.buttonEnabled = false;
            _btnViewGuild.tooltip = LocText.current.text("screen/character_overview/button_view_guild_no_guild_tooltip",_loc1_.name);
         }
         else
         {
            _btnViewGuild.buttonEnabled = true;
         }
         _loc4_.characterName.txtName.text = _loc1_.name;
         _loc4_.characterName.txtTitle.text = _loc1_.title;
         _loc4_.infoBox.enemyInformation.visible = !_loc1_.isMe;
         _loc4_.infoBox.iconPhotographer.visible = _loc1_.isMe;
         if(_loc1_.hasGuild)
         {
            if(!_loc1_.isMe)
            {
               _loc4_.infoBox.enemyInformation.txtGuildName.htmlText = "<a href=\'event:null\'>" + StringUtil.cutLength(_loc1_.guild.name,15) + "</a>";
               if(_loc1_.guild.name.length <= 15)
               {
                  _tooltipGuildEnemy.text = LocText.current.text("screen/character_overview/guild_other_tooltip",_loc1_.name);
                  _guildEmblemEnemy.tooltip = _tooltipGuildEnemy.text;
               }
               else
               {
                  _tooltipGuildEnemy.text = LocText.current.text("screen/character_overview/guild_other_full_name_tooltip",_loc1_.name,_loc1_.guild.name);
                  _guildEmblemEnemy.tooltip = _tooltipGuildEnemy.text;
               }
               _guildEmblemEnemy.refresh(_loc1_.guild.emblemSettings);
               _loc4_.infoBox.enemyInformation.iconGuild.visible = false;
            }
            else
            {
               _loc4_.infoBox.txtGuildName.htmlText = "<a href=\'event:null\'>" + StringUtil.cutLength(_loc1_.guild.name,15) + "</a>";
               if(_loc1_.guild.name.length <= 15)
               {
                  _tooltipGuild.text = LocText.current.text("screen/character_overview/guild_own_tooltip");
                  _guildEmblem.tooltip = _tooltipGuild.text;
               }
               else
               {
                  _tooltipGuild.text = LocText.current.text("screen/character_overview/guild_full_name_tooltip",_loc1_.guild.name);
                  _guildEmblem.tooltip = _tooltipGuild.text;
               }
               _loc4_.infoBox.iconGuild.visible = false;
               _guildEmblem.refresh(_loc1_.guild.emblemSettings);
            }
         }
         else if(_loc1_.isMe)
         {
            _loc4_.infoBox.txtGuildName.text = LocText.current.text("screen/character_overview/no_guild");
            _tooltipGuild.text = _loc4_.infoBox.txtGuildName.text;
            _loc4_.infoBox.iconGuild.visible = true;
            _loc4_.infoBox.guildEmblem.visible = false;
         }
         else
         {
            _loc4_.infoBox.enemyInformation.txtGuildName.text = LocText.current.text("screen/character_overview/no_guild");
            _tooltipGuildEnemy.text = _loc4_.infoBox.enemyInformation.txtGuildName.text;
            _loc4_.infoBox.enemyInformation.iconGuild.visible = true;
            _loc4_.infoBox.enemyInformation.guildEmblem.visible = false;
         }
         if(_customCharacter != null)
         {
            _descriptionTooltip.text = LocText.current.text("screen/character/description_other_tooltip");
            _tooltipLevelEnemy.text = LocText.current.text("general/level_general_tooltip",_loc1_.level);
            _tooltipLevelIconEnemy.text = _tooltipLevelEnemy.text;
            _loc4_.infoBox.iconHonor.visible = false;
            _loc4_.infoBox.iconGuild.visible = false;
            _loc4_.infoBox.iconFans.visible = false;
            _loc4_.infoBox.iconMovies.visible = false;
            _loc4_.infoBox.txtGuildName.visible = false;
            _loc4_.infoBox.txtHonor.visible = false;
            _loc4_.infoBox.txtFans.visible = false;
            _loc4_.infoBox.txtMovies.visible = false;
            _loc4_.infoBox.txtGuildName.visible = false;
            _loc4_.infoBox.guildEmblem.visible = false;
            _loc4_.infoBox.enemyInformation.txtHonor.text = LocText.current.formatHugeNumber(_loc1_.honor);
            _loc4_.infoBox.enemyInformation.txtLevel.text = String(_loc1_.level);
            _loc4_.infoBox.enemyInformation.txtFans.text = LocText.current.shortenHugeNumber(_loc1_.fansTotal);
            _loc4_.infoBox.enemyInformation.txtMovies.text = LocText.current.formatHugeNumber(_loc1_.moviesTotal);
         }
         else
         {
            _descriptionTooltip.text = LocText.current.text("screen/character/description_self_tooltip");
            _loc4_.infoBox.iconHonor.visible = true;
            _loc4_.infoBox.iconFans.visible = true;
            _loc4_.infoBox.iconMovies.visible = true;
            _loc4_.infoBox.txtHonor.visible = true;
            _loc4_.infoBox.txtGuildName.visible = true;
            _loc4_.infoBox.txtFans.visible = true;
            _loc4_.infoBox.txtMovies.visible = true;
            _loc4_.infoBox.txtHonor.text = LocText.current.formatHugeNumber(_loc1_.honor);
            _loc4_.infoBox.txtFans.text = LocText.current.shortenHugeNumber(_loc1_.fansTotal);
            _loc4_.infoBox.txtMovies.text = LocText.current.formatHugeNumber(_loc1_.moviesTotal);
         }
         _loc4_.infoBox.txtDescription.text = _loc1_.description;
         if(_loc4_.infoBox.txtDescription.textHeight >= _loc4_.infoBox.txtDescription.height)
         {
            _loc7_ = "";
            _loc5_ = 0;
            while(_loc5_ < 5)
            {
               _loc7_ = _loc7_ + _loc4_.infoBox.txtDescription.getLineText(_loc5_);
               _loc5_++;
            }
            _loc7_ = _loc7_ + ("... [" + LocText.current.text("screen/character/description/text_more") + "]");
            _loc4_.infoBox.txtDescription.text = _loc7_;
         }
         _stats.refresh(_loc1_);
         if(_customCharacter == null)
         {
            _tooltipHonor.text = LocText.current.text("general/honor_tooltip");
            _tooltipHonorIcon.text = LocText.current.text("general/honor_tooltip");
            _tooltipFans.text = LocText.current.text("general/fans_tooltip");
            _tooltipFansIcon.text = LocText.current.text("general/fans_tooltip");
            _tooltipMovies.text = LocText.current.text("general/movies_tooltip");
            _tooltipMoviesIcon.text = LocText.current.text("general/movies_tooltip");
         }
         else
         {
            _ownStats.refresh(User.current.character,_customCharacter);
            _tooltipHonorEnemy.text = LocText.current.text("general/honor_enemy_tooltip",_customCharacter.name,LocText.current.formatHugeNumber(_loc1_.honor));
            _tooltipHonorIconEnemy.text = LocText.current.text("general/honor_enemy_tooltip",_customCharacter.name,LocText.current.formatHugeNumber(_loc1_.honor));
            if(_loc1_.fansTotal > 0)
            {
               _tooltipFansEnemy.text = LocText.current.text("general/fans_enemy_tooltip",_customCharacter.name,LocText.current.formatHugeNumber(_loc1_.fansTotal));
               _tooltipFansIconEnemy.text = LocText.current.text("general/fans_enemy_tooltip",_customCharacter.name,LocText.current.formatHugeNumber(_loc1_.fansTotal));
            }
            else
            {
               _tooltipFansEnemy.text = LocText.current.text("general/no_fans_enemy_tooltip",_customCharacter.name);
               _tooltipFansIconEnemy.text = LocText.current.text("general/no_fans_enemy_tooltip",_customCharacter.name);
            }
            if(_loc1_.moviesTotal > 0)
            {
               _tooltipMoviesEnemy.text = LocText.current.text("general/movies_enemy_tooltip",_customCharacter.name,LocText.current.formatHugeNumber(_loc1_.moviesTotal));
               _tooltipMoviesIconEnemy.text = LocText.current.text("general/movies_enemy_tooltip",_customCharacter.name,LocText.current.formatHugeNumber(_loc1_.moviesTotal));
            }
            else
            {
               _tooltipMoviesEnemy.text = LocText.current.text("general/no_movies_enemy_tooltip",_customCharacter.name);
               _tooltipMoviesIconEnemy.text = LocText.current.text("general/no_movies_enemy_tooltip",_customCharacter.name);
            }
         }
         if(_customCharacter == null)
         {
            _booster1.refresh(_loc1_.activeQuestBoosterId,_loc1_.getInt("ts_active_quest_boost_expires"));
            _booster2.refresh(_loc1_.activeStatsBoosterId,_loc1_.getInt("ts_active_stats_boost_expires"));
            _booster3.refresh(_loc1_.activeWorkBoosterId,_loc1_.getInt("ts_active_work_boost_expires"));
         }
         else
         {
            _booster1.refresh(_loc1_.activeQuestBoosterId,-1,_customCharacter);
            _booster2.refresh(_loc1_.activeStatsBoosterId,-1,_customCharacter);
            _booster3.refresh(_loc1_.activeWorkBoosterId,-1,_customCharacter);
         }
         if(_loc1_.inventory != null && _loc1_.inventory.hasData("bag_item1_id"))
         {
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
         }
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
         var _loc9_:Item = _loc1_.getItem("chest_item_id");
         if(_loc9_ && _loc9_.isOutfitItem && _loc1_.isChestItemShown)
         {
            _loc4_.iconOutfitInfo.visible = true;
         }
         else
         {
            _loc4_.iconOutfitInfo.visible = false;
         }
         _avatar.update(_loc1_.getCurrentSettings(),_customCharacter == null);
         _loc4_.infoBox.txtFriend.visible = AppEnvironment.appPlatform.isFriendbarSupported && User.current.showFriendbar && _customCharacter != null;
         _loc4_.infoBox.checkFriend.visible = _loc4_.infoBox.txtFriend.visible;
         _loc4_.infoBox.frameBackground.gotoAndStop(!!_loc4_.infoBox.checkFriend.visible?2:1);
         if(_loc4_.infoBox.txtFriend.visible)
         {
            _checkboxFriend.checked = User.current.character.hasFriend(_customCharacter.userId);
         }
         _loc4_.iconHeadItemHidden.visible = !_loc1_.isHeadItemShown && _loc1_.getItemByType(1) != null;
         _loc4_.iconChestItemHidden.visible = !_loc1_.isChestItemShown && _loc1_.getItemByType(2) != null;
         _loc4_.iconBeltItemHidden.visible = !_loc1_.isBeltItemShown && _loc1_.getItemByType(3) != null;
         _loc4_.iconLegsItemHidden.visible = !_loc1_.isLegsItemShown && _loc1_.getItemByType(4) != null;
         _loc4_.iconBootsItemHidden.visible = !_loc1_.isBootsItemShown && _loc1_.getItemByType(5) != null;
         _btnAttack.buttonEnabled = User.current.character.activeDuel == null;
         var _loc6_:String = PanelDuels.getDuelResultTooltip(_loc1_.level,_loc1_.honor,_loc1_.totalStats);
         if(User.current.character.activeDuel)
         {
            _loc6_ = LocText.current.text("screen/character/button_attack/occupied_with_duel_tooltip");
         }
         _btnAttack.premiumTooltip = _loc6_;
         _btnAttack.nonPremiumTooltip = _loc6_;
         if(_customCharacter != null)
         {
            LocText.current.gender = _loc8_;
         }
         _opticalChangeCurrencyPanel.refresh(_loc1_);
         var _loc3_:Boolean = !_customCharacter || _customCharacter.isOwnServer;
         _loc4_.infoBox.txtFriend.visible = _loc4_.infoBox.txtFriend.visible && _loc3_;
         _loc4_.infoBox.checkFriend.visible = _loc4_.infoBox.checkFriend.visible && _loc3_;
         _btnAttack.visible = _btnAttack.visible && _loc3_;
         _btnSendMessage.visible = _btnSendMessage.visible && _loc3_;
         _btnMovies.visible = _btnMovies.visible && _loc3_;
         _loc4_.txtServerId.visible = !_loc3_;
         _loc4_.iconServerLocale.visible = !_loc3_;
         if(!_loc3_)
         {
            _loc4_.txtServerId.text = _customCharacter.serverId;
            _loc2_ = ServerInfo.getLocaleFromServer(_customCharacter.serverId);
            if(_loc2_)
            {
               _loc4_.iconServerLocale.gotoAndStop(AppAssetUtil.getLocaleFlagIndex(_loc2_));
            }
         }
         refreshBag();
      }
      
      private function handleBoosterClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
         ViewManager.instance.showBoosterDialog();
      }
      
      private function handleDescriptionClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
         panelManager.showDialog(new DialogCharacterDescription(_customCharacter != null?_customCharacter:User.current.character));
      }
      
      public function set customCharacter(param1:Character) : void
      {
         _customCharacter = param1;
         if(_customCharacter != null)
         {
            _timer.start();
            onTimerEvent();
            refresh();
         }
         else
         {
            _timer.stop();
         }
      }
      
      public function get customCharacter() : Character
      {
         return _customCharacter;
      }
      
      override public function reset() : void
      {
         _customCharacter = null;
         _opticalChangeCurrencyPanel.reset();
      }
      
      private function onClickChangeTitle(param1:InteractionEvent) : void
      {
         var _loc2_:Character = User.current.character;
         if(!_loc2_.hasTutorialFlag("titles") && (Titles.instance.availableTitles(_loc2_).length > 0 || Marriages.instance.getMarriagesOfCharacterId(_loc2_.id).length > 0))
         {
            ViewManager.instance.tutorialArrow.hide();
            _loc2_.setTutorialFlag("titles");
         }
         Environment.panelManager.showDialog(new DialogTitles(_loc2_,refresh));
      }
      
      private function onClickHelp(param1:InteractionEvent) : void
      {
         showTutorialDialog();
      }
      
      private function onClickAttack(param1:InteractionEvent) : void
      {
         startDuel();
      }
      
      private function startDuel() : void
      {
         Environment.application.sendActionRequest("startDuel",{
            "character_id":_customCharacter.id,
            "use_premium":_btnAttack.premium
         },handleRequests);
      }
      
      private function onClickSendMessage(param1:InteractionEvent) : void
      {
         ViewManager.instance.baseUserPanel.streamsPanel.createPrivateConversation(_customCharacter.name);
      }
      
      private function onClickViewGoals(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("getCharacterGoals",{
            "character_id":_customCharacter.id,
            "server_id":_customCharacter.serverId
         },handleRequests);
      }
      
      private function onClickViewGuild(param1:InteractionEvent) : void
      {
         loadGuild(null);
      }
      
      private function loadGuild(param1:InteractionEvent = null) : void
      {
         if(_customCharacter == null && User.current.character.guildId == 0)
         {
            return;
         }
         if(_customCharacter != null && _customCharacter.guildId == 0)
         {
            return;
         }
         if(_customCharacter == null || _customCharacter.guildId == User.current.character.guildId)
         {
            ViewManager.instance.showPanel("guild");
            return;
         }
         ViewManager.instance.loadGuild(_customCharacter.guildId,null,_customCharacter.serverId);
      }
      
      private function onClickInviteToGuild(param1:InteractionEvent) : void
      {
         panelManager.showDialog(new DialogGuildInvitation(_customCharacter.name));
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
      
      private function onClickBankInventory(param1:InteractionEvent) : void
      {
         panelManager.showDialog(new DialogBankInventory());
      }
      
      private function refreshBag() : void
      {
         if(User.current == null || User.current.character == null)
         {
            return;
         }
         var _loc1_:Boolean = _customCharacter == null && User.current.character.level >= CConstant.inventory_bag2_unlock_level;
         var _loc2_:Boolean = _customCharacter == null && User.current.character.level >= CConstant.inventory_bag3_unlock_level;
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
      
      private function onClickChangeAppearance(param1:InteractionEvent) : void
      {
         ViewManager.instance.showPanel("character_appearance");
      }
      
      private function onClickShowOpticalChanges(param1:InteractionEvent) : void
      {
         ViewManager.instance.tutorialArrow.hide();
         Environment.panelManager.showDialog(new DialogOpticalChanges(true));
      }
      
      private function onClickOutfits(param1:InteractionEvent) : void
      {
         if(ViewManager.instance.tutorialArrow.tutorialVisible)
         {
            User.current.character.setTutorialFlag("tutorial_outfits");
            ViewManager.instance.tutorialArrow.hide();
         }
         Environment.panelManager.showDialog(new DialogOutfits());
      }
      
      private function handleAvatarImageClick(param1:InteractionEvent) : void
      {
         ViewManager.instance.showPanel("character_appearance_photographer");
      }
      
      private function onClickMovies(param1:InteractionEvent) : void
      {
         var _loc2_:Character = _customCharacter != null?_customCharacter:User.current.character;
         Environment.panelManager.showDialog(new DialogMovieHistory(_loc2_));
      }
      
      private function showTutorialDialog() : void
      {
         Environment.panelManager.showDialog(new DialogTutorialPopup(LocText.current.text("dialog/tutorial/character_overview/title"),LocText.current.text("dialog/tutorial/character_overview/text"),onTutorialDialogClosed));
      }
      
      private function onTutorialDialogClosed() : void
      {
         User.current.character.setTutorialFlag("character");
      }
      
      private function onCheckedFriend(param1:Boolean) : void
      {
         if(param1)
         {
            Environment.application.sendActionRequest("addFriend",{"friend_user_id":_customCharacter.userId},handleRequests);
         }
         else
         {
            Environment.application.sendActionRequest("removeFriend",{"friend_user_id":_customCharacter.userId},handleRequests);
         }
      }
      
      private function handleInteractionUpEquip(param1:InteractionEvent) : void
      {
         if(_customCharacter)
         {
            return;
         }
         if(UiItemGraphic.draggedItem == null)
         {
            return;
         }
         var _loc2_:Item = UiItemGraphic.draggedItem.item;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.isUsable)
         {
            if(!UiItemGraphic.draggedItem.itemSlot || !UiItemGraphic.draggedItem.itemSlot.itemGraphic)
            {
               return;
            }
            UiItemGraphic.draggedItem.itemSlot.itemGraphic.useItem();
            return;
         }
         var _loc3_:Item = User.current.character.getItemByType(_loc2_.type);
         if(_loc3_ && _loc3_.id == _loc2_.id)
         {
            return;
         }
         if(!UiItemGraphic.draggedItem.itemSlot || !UiItemGraphic.draggedItem.itemSlot.itemGraphic)
         {
            return;
         }
         UiItemGraphic.draggedItem.itemSlot.itemGraphic.handleItemChange(_loc2_.itemSlotType,null);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "startDuel":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  Environment.audio.playFX("duel_stamina_use.mp3");
                  if(User.current.showDuelBattles)
                  {
                     PanelBattle.activeDuel = User.current.character.activeDuel;
                     ViewManager.instance.showPanel("battle");
                  }
                  else
                  {
                     PanelBattle.lastViewedMode = 2;
                     MessageRouter.dispatch(new Message("ViewMessage.notifyBattleFinished",null,this));
                  }
               }
               else if(param1.error == "errStartDuelAttackNotAllowed")
               {
                  panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/duel_attack_not_allowed/title"),LocText.current.text("dialog/duel_attack_not_allowed/text",LocText.current.text("general/attack",CConstant.duel_attack_limit)),LocText.current.text("general/button_ok")));
               }
               else if(!(param1.error == "errStartDuelInvalidEnemy" || param1.error == "errStartDuelAttackCurrentlyNotAllowed"))
               {
                  if(param1.error == "errRemoveDuelStaminaNotEnough")
                  {
                     panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/duel_stamina_not_enough/title"),LocText.current.text("dialog/duel_stamina_not_enough/text"),LocText.current.text("general/button_ok")));
                  }
                  else if(param1.error == "errRemovePremiumCurrencyNotEnough")
                  {
                     ViewManager.instance.showNotEnoughPremiumDialog(CConstant.duel_single_attack_premium_amount);
                  }
                  else if(param1.error == "errStartDuelActiveDuelFound")
                  {
                     panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_duel_active_duel/title"),LocText.current.text("dialog/start_duel_active_duel/text"),LocText.current.text("general/button_ok")));
                  }
                  else
                  {
                     Environment.reportError(param1.error,param1.request);
                  }
               }
               break;
            case "getCharacterGoals":
               if(param1.error == "")
               {
                  if(param1.appResponse.hasData("requested_character_current_goal_values"))
                  {
                     _customCharacter.refreshGoalValues(param1.appResponse.requested_character_current_goal_values);
                  }
                  if(param1.appResponse.hasData("requested_character_collected_goals"))
                  {
                     _customCharacter.refreshCollectedGoals(param1.appResponse.requested_character_collected_goals);
                  }
                  panelManager.showDialog(new DialogGoals(_customCharacter));
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "addFriend":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  AppEnvironment.friendBar.addFriend(_customCharacter);
               }
               else if(param1.error != "errAddFriendAlreadyFriend")
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "removeFriend":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  AppEnvironment.friendBar.removeFriend(param1.request.getInt("friend_user_id"));
               }
               else if(param1.error != "errRemoveFriendNoSuchFriend")
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
      
      private function handleMessages(param1:Message) : void
      {
         var _loc2_:* = param1.type;
         if("InventoryMessage.notifyBagChange" !== _loc2_)
         {
            throw new Error("Encountered unknown message type! type=" + param1.type);
         }
         switchBag(param1.dataAsInt);
      }
   }
}

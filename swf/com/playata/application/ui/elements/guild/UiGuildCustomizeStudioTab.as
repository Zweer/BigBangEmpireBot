package com.playata.application.ui.elements.guild
{
   import com.playata.application.data.constants.CGuildBackgroundLayer;
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.guild.StudioAppearanceSettings;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiSimplePremiumAndGameCurrencyButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.UriSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.network.request.RequestData;
   import visuals.ui.elements.guild.SymbolGuildCustomizationGeneric;
   import visuals.ui.elements.guild.SymbolStudioCustomizationNewBubbleGeneric;
   
   public class UiGuildCustomizeStudioTab
   {
       
      
      private var _content:SymbolGuildCustomizationGeneric;
      
      private var _onHideCallback:Function;
      
      private var _backgroundContainer:IDisplayObjectContainer;
      
      private var _settings:StudioAppearanceSettings;
      
      private var _btnLeftRoom:UiButton;
      
      private var _btnLeftQuarter:UiButton;
      
      private var _btnLeftMotivation:UiButton;
      
      private var _btnLeftPopularity:UiButton;
      
      private var _btnLeftEquipment:UiButton;
      
      private var _btnLeftActorLeft:UiButton;
      
      private var _btnLeftActorRight:UiButton;
      
      private var _btnRightRoom:UiButton;
      
      private var _btnRightQuarter:UiButton;
      
      private var _btnRightMotivation:UiButton;
      
      private var _btnRightPopularity:UiButton;
      
      private var _btnRightEquipment:UiButton;
      
      private var _btnRightActorsLeft:UiButton;
      
      private var _btnRightActorsRight:UiButton;
      
      private var _btnCancel:UiButton;
      
      private var _btnCustomize:UiSimplePremiumAndGameCurrencyButton;
      
      private var _pricePremiumTotal:int;
      
      private var _priceGameCurrencyTotal:int;
      
      private var _tooltipBubbleRoom:UiTextTooltip;
      
      private var _tooltipBubbleQuarter:UiTextTooltip;
      
      private var _tooltipBubbleEquipment:UiTextTooltip;
      
      private var _tooltipBubbleMotivation:UiTextTooltip;
      
      private var _tooltipBubblePopularity:UiTextTooltip;
      
      private var _tooltipBubbleActorsLeft:UiTextTooltip;
      
      private var _tooltipBubbleActorsRight:UiTextTooltip;
      
      public function UiGuildCustomizeStudioTab(param1:SymbolGuildCustomizationGeneric, param2:IDisplayObjectContainer, param3:Function)
      {
         super();
         _content = param1;
         _backgroundContainer = param2;
         _onHideCallback = param3;
         _content.visible = false;
         _content.txtCurrentPremiumCaption.text = LocText.current.text("dialog/guild_not_enough_coins_premium_currency/title");
         _btnCancel = new UiButton(param1.btnCancel,LocText.current.text("screen/guild/studio_customization/withdraw_tooltip"),onClickCancel);
         _btnCustomize = new UiSimplePremiumAndGameCurrencyButton(param1.btnCustomize,LocText.current.text("screen/guild/studio_customization/button_change_caption"),false,false,"",onClickCustomize);
         _btnLeftRoom = new UiButton(param1.btnLeftRoom,LocText.current.text("screen/guild/studio_customization/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftQuarter = new UiButton(param1.btnLeftQuarter,LocText.current.text("screen/guild/studio_customization/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftMotivation = new UiButton(param1.btnLeftMotivation,LocText.current.text("screen/guild/studio_customization/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftPopularity = new UiButton(param1.btnLeftPopularity,LocText.current.text("screen/guild/studio_customization/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftEquipment = new UiButton(param1.btnLeftEquipment,LocText.current.text("screen/guild/studio_customization/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftActorLeft = new UiButton(param1.btnLeftActorsLeft,LocText.current.text("screen/guild/studio_customization/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftActorRight = new UiButton(param1.btnLeftActorsRight,LocText.current.text("screen/guild/studio_customization/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnRightRoom = new UiButton(param1.btnRightRoom,LocText.current.text("screen/guild/studio_customization/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightQuarter = new UiButton(param1.btnRightQuarter,LocText.current.text("screen/guild/studio_customization/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightMotivation = new UiButton(param1.btnRightMotivation,LocText.current.text("screen/guild/studio_customization/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightPopularity = new UiButton(param1.btnRightPopularity,LocText.current.text("screen/guild/studio_customization/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightEquipment = new UiButton(param1.btnRightEquipment,LocText.current.text("screen/guild/studio_customization/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightActorsLeft = new UiButton(param1.btnRightActorsLeft,LocText.current.text("screen/guild/studio_customization/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightActorsRight = new UiButton(param1.btnRightActorsRight,LocText.current.text("screen/guild/studio_customization/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnLeftRoom.tag = "room";
         _btnLeftQuarter.tag = "quarter";
         _btnLeftMotivation.tag = "motivation";
         _btnLeftPopularity.tag = "popularity";
         _btnLeftEquipment.tag = "equipment";
         _btnLeftActorLeft.tag = "actors_left";
         _btnLeftActorRight.tag = "actors_right";
         _btnRightRoom.tag = "room";
         _btnRightQuarter.tag = "quarter";
         _btnRightMotivation.tag = "motivation";
         _btnRightPopularity.tag = "popularity";
         _btnRightEquipment.tag = "equipment";
         _btnRightActorsLeft.tag = "actors_left";
         _btnRightActorsRight.tag = "actors_right";
         param1.txtRoom.text = LocText.current.text("screen/guild/studio_customization/room");
         param1.txtQuarter.text = LocText.current.text("screen/guild/studio_customization/quarter");
         param1.txtPopularity.text = LocText.current.text("screen/guild/studio_customization/popularity");
         param1.txtMotivation.text = LocText.current.text("screen/guild/studio_customization/motivation");
         param1.txtEquipment.text = LocText.current.text("screen/guild/studio_customization/equipment");
         param1.txtActorsLeft.text = LocText.current.text("screen/guild/studio_customization/actors_left");
         param1.txtActorsRight.text = LocText.current.text("screen/guild/studio_customization/actors_right");
         var _loc4_:* = LocText.current.text("screen/guild/studio_customization/free_customization");
         param1.txtPriceFreeActorsRight.text = _loc4_;
         _loc4_ = _loc4_;
         param1.txtPriceFreeActorsLeft.text = _loc4_;
         _loc4_ = _loc4_;
         param1.txtPriceFreeEquipment.text = _loc4_;
         _loc4_ = _loc4_;
         param1.txtPriceFreePopularity.text = _loc4_;
         _loc4_ = _loc4_;
         param1.txtPriceFreeMotivation.text = _loc4_;
         _loc4_ = _loc4_;
         param1.txtPriceFreeQuarter.text = _loc4_;
         param1.txtPriceFreeRoom.text = _loc4_;
         _loc4_ = false;
         param1.txtPriceFreeActorsRight.visible = _loc4_;
         _loc4_ = _loc4_;
         param1.txtPriceFreeActorsLeft.visible = _loc4_;
         _loc4_ = _loc4_;
         param1.txtPriceFreeEquipment.visible = _loc4_;
         _loc4_ = _loc4_;
         param1.txtPriceFreePopularity.visible = _loc4_;
         _loc4_ = _loc4_;
         param1.txtPriceFreeMotivation.visible = _loc4_;
         _loc4_ = _loc4_;
         param1.txtPriceFreeQuarter.visible = _loc4_;
         param1.txtPriceFreeRoom.visible = _loc4_;
         param1.bubbleNewRoom.visible = false;
         param1.bubbleNewQuarter.visible = false;
         param1.bubbleNewEquipment.visible = false;
         param1.bubbleNewMotivation.visible = false;
         param1.bubbleNewPopularity.visible = false;
         param1.bubbleNewActorsLeft.visible = false;
         param1.bubbleNewActorsRight.visible = false;
         param1.addChild(param1.bubbleNewRoom);
         param1.addChild(param1.bubbleNewQuarter);
         param1.addChild(param1.bubbleNewEquipment);
         param1.addChild(param1.bubbleNewMotivation);
         param1.addChild(param1.bubbleNewPopularity);
         param1.addChild(param1.bubbleNewActorsLeft);
         param1.addChild(param1.bubbleNewActorsRight);
         param1.bubbleNewRoom.x = Math.round(param1.txtRoom.x + param1.txtRoom.textWidth + (param1.txtRoom.width - param1.txtRoom.textWidth + param1.bubbleNewRoom.width) * 0.5 - 3);
         param1.bubbleNewQuarter.x = Math.round(param1.txtQuarter.x + param1.txtQuarter.textWidth + (param1.txtQuarter.width - param1.txtQuarter.textWidth + param1.bubbleNewQuarter.width) * 0.5 - 3);
         param1.bubbleNewEquipment.x = Math.round(param1.txtEquipment.x + param1.txtEquipment.textWidth + (param1.txtEquipment.width - param1.txtEquipment.textWidth + param1.bubbleNewEquipment.width) * 0.5 - 3);
         param1.bubbleNewMotivation.x = Math.round(param1.txtMotivation.x + param1.txtMotivation.textWidth + (param1.txtMotivation.width - param1.txtMotivation.textWidth + param1.bubbleNewMotivation.width) * 0.5 - 3);
         param1.bubbleNewPopularity.x = Math.round(param1.txtPopularity.x + param1.txtPopularity.textWidth + (param1.txtPopularity.width - param1.txtPopularity.textWidth + param1.bubbleNewPopularity.width) * 0.5 - 3);
         param1.bubbleNewActorsLeft.x = Math.round(param1.txtActorsLeft.x + param1.txtActorsLeft.textWidth + (param1.txtActorsLeft.width - param1.txtActorsLeft.textWidth + param1.bubbleNewActorsLeft.width) * 0.5 - 3);
         param1.bubbleNewActorsRight.x = Math.round(param1.txtActorsRight.x + param1.txtActorsRight.textWidth + (param1.txtActorsRight.width - param1.txtActorsRight.textWidth + param1.bubbleNewActorsRight.width) * 0.5 - 3);
         _tooltipBubbleRoom = new UiTextTooltip(param1.bubbleNewRoom,"");
         _tooltipBubbleQuarter = new UiTextTooltip(param1.bubbleNewQuarter,"");
         _tooltipBubbleEquipment = new UiTextTooltip(param1.bubbleNewEquipment,"");
         _tooltipBubbleMotivation = new UiTextTooltip(param1.bubbleNewMotivation,"");
         _tooltipBubblePopularity = new UiTextTooltip(param1.bubbleNewPopularity,"");
         _tooltipBubbleActorsLeft = new UiTextTooltip(param1.bubbleNewActorsLeft,"");
         _tooltipBubbleActorsRight = new UiTextTooltip(param1.bubbleNewActorsRight,"");
      }
      
      private function onClickChangeAppearanceRight(param1:InteractionEvent) : void
      {
         var _loc2_:String = (param1.target as UiButton).tagAsString;
         var _loc3_:String = getValue(_loc2_,1);
         _settings.setString(_loc2_,_loc3_);
         refreshBackgroundLayers();
         refreshPriceList();
         refreshSaveButton();
      }
      
      private function onClickChangeAppearanceLeft(param1:InteractionEvent) : void
      {
         var _loc2_:String = (param1.target as UiButton).tagAsString;
         var _loc3_:String = getValue(_loc2_,-1);
         _settings.setString(_loc2_,_loc3_);
         refreshBackgroundLayers();
         refreshPriceList();
         refreshSaveButton();
      }
      
      private function getValue(param1:String, param2:int) : String
      {
         var _loc3_:Vector.<String> = getPossibleValues(param1);
         var _loc4_:int = _loc3_.indexOf(_settings.getString(param1));
         _loc4_ = _loc4_ + param2;
         if(_loc4_ < 0)
         {
            _loc4_ = _loc3_.length - 1;
         }
         else if(_loc4_ == _loc3_.length)
         {
            _loc4_ = 0;
         }
         return _loc3_[_loc4_];
      }
      
      private function getPossibleValues(param1:String) : Vector.<String>
      {
         var _loc6_:* = null;
         var _loc2_:Guild = User.current.character.guild;
         var _loc4_:* = 0;
         var _loc7_:* = param1;
         switch(_loc7_)
         {
            case "room":
            case "actors_left":
               _loc4_ = Number(_loc2_.totalImprovementPercentage());
               break;
            case "actors_right":
               _loc4_ = Number(_loc2_.statGuildCapacity);
               break;
            case "quarter":
               _loc4_ = Number(_loc2_.statQuestGameCurrencyRewardBoost);
               break;
            case "motivation":
               _loc4_ = Number(_loc2_.statQuestXpRewardBoost);
               break;
            case "popularity":
               _loc4_ = Number(_loc2_.statCharacterBaseStatsBoost);
               break;
            case "equipment":
         }
         var _loc3_:Vector.<String> = new Vector.<String>(0);
         var _loc9_:int = 0;
         var _loc8_:* = CGuildBackgroundLayer.ids;
         for each(var _loc5_ in CGuildBackgroundLayer.ids)
         {
            _loc6_ = CGuildBackgroundLayer.fromId(_loc5_);
            if(_loc6_.type == param1 && _loc6_.value <= _loc4_)
            {
               _loc3_.push(_loc6_.assetIdentifier);
            }
         }
         return _loc3_;
      }
      
      private function refreshBackgroundLayers() : void
      {
         _backgroundContainer.removeAllChildren();
         var _loc2_:Vector.<String> = ServerInfo.studioBackgroundUrlsBySettings(_settings);
         if(_loc2_ && _loc2_.length > 0)
         {
            var _loc4_:int = 0;
            var _loc3_:* = _loc2_;
            for each(var _loc1_ in _loc2_)
            {
               _backgroundContainer.addChild(UriSprite.load(_loc1_,1120,630,true));
            }
         }
      }
      
      private function refreshPriceList() : void
      {
         var _loc1_:* = undefined;
         _pricePremiumTotal = 0;
         _priceGameCurrencyTotal = 0;
         _loc1_ = updatePrice("room");
         _priceGameCurrencyTotal = _priceGameCurrencyTotal + _loc1_[0];
         _pricePremiumTotal = _pricePremiumTotal + _loc1_[1];
         _loc1_ = updatePrice("quarter");
         _priceGameCurrencyTotal = _priceGameCurrencyTotal + _loc1_[0];
         _pricePremiumTotal = _pricePremiumTotal + _loc1_[1];
         _loc1_ = updatePrice("motivation");
         _priceGameCurrencyTotal = _priceGameCurrencyTotal + _loc1_[0];
         _pricePremiumTotal = _pricePremiumTotal + _loc1_[1];
         _loc1_ = updatePrice("popularity");
         _priceGameCurrencyTotal = _priceGameCurrencyTotal + _loc1_[0];
         _pricePremiumTotal = _pricePremiumTotal + _loc1_[1];
         _loc1_ = updatePrice("equipment");
         _priceGameCurrencyTotal = _priceGameCurrencyTotal + _loc1_[0];
         _pricePremiumTotal = _pricePremiumTotal + _loc1_[1];
         _loc1_ = updatePrice("actors_left");
         _priceGameCurrencyTotal = _priceGameCurrencyTotal + _loc1_[0];
         _pricePremiumTotal = _pricePremiumTotal + _loc1_[1];
         _loc1_ = updatePrice("actors_right");
         _priceGameCurrencyTotal = _priceGameCurrencyTotal + _loc1_[0];
         _pricePremiumTotal = _pricePremiumTotal + _loc1_[1];
         _content.txtPricePremiumTotal.text = LocText.current.formatHugeNumber(_pricePremiumTotal);
         var _loc2_:Boolean = true;
         _content.txtPricePremiumTotal.visible = _loc2_;
         _content.iconPremiumTotal.visible = _loc2_;
         _content.txtPriceGameCurrencyTotal.text = LocText.current.formatHugeNumber(_priceGameCurrencyTotal);
         _loc2_ = true;
         _content.txtPriceGameCurrencyTotal.visible = _loc2_;
         _content.iconGameCurrencyTotal.visible = _loc2_;
      }
      
      private function updatePrice(param1:String) : Vector.<int>
      {
         var _loc10_:ILabel = null;
         var _loc9_:ILabel = null;
         var _loc2_:IDisplayObject = null;
         var _loc3_:IDisplayObject = null;
         var _loc5_:SymbolStudioCustomizationNewBubbleGeneric = null;
         var _loc7_:UiTextTooltip = null;
         var _loc12_:* = param1;
         switch(_loc12_)
         {
            case "room":
               _loc10_ = _content.txtPriceRoom;
               _loc9_ = _content.txtPriceFreeRoom;
               _loc2_ = _content.iconPremiumRoom;
               _loc3_ = _content.iconGameCurrencyRoom;
               _loc5_ = _content.bubbleNewRoom;
               _loc7_ = _tooltipBubbleRoom;
               break;
            case "quarter":
               _loc10_ = _content.txtPriceQuarter;
               _loc9_ = _content.txtPriceFreeQuarter;
               _loc2_ = _content.iconPremiumQuarter;
               _loc3_ = _content.iconGameCurrencyQuarter;
               _loc5_ = _content.bubbleNewQuarter;
               _loc7_ = _tooltipBubbleQuarter;
               break;
            case "motivation":
               _loc10_ = _content.txtPriceMotivation;
               _loc9_ = _content.txtPriceFreeMotivation;
               _loc2_ = _content.iconPremiumMotivation;
               _loc3_ = _content.iconGameCurrencyMotivation;
               _loc5_ = _content.bubbleNewMotivation;
               _loc7_ = _tooltipBubbleMotivation;
               break;
            case "popularity":
               _loc10_ = _content.txtPricePopularity;
               _loc9_ = _content.txtPriceFreePopularity;
               _loc2_ = _content.iconPremiumPopularity;
               _loc3_ = _content.iconGameCurrencyPopularity;
               _loc5_ = _content.bubbleNewPopularity;
               _loc7_ = _tooltipBubblePopularity;
               break;
            case "equipment":
               _loc10_ = _content.txtPriceEquipment;
               _loc9_ = _content.txtPriceFreeEquipment;
               _loc2_ = _content.iconPremiumEquipment;
               _loc3_ = _content.iconGameCurrencyEquipment;
               _loc5_ = _content.bubbleNewEquipment;
               _loc7_ = _tooltipBubbleEquipment;
               break;
            case "actors_left":
               _loc10_ = _content.txtPriceActorsLeft;
               _loc9_ = _content.txtPriceFreeActorsLeft;
               _loc2_ = _content.iconPremiumActorsLeft;
               _loc3_ = _content.iconGameCurrencyActorsLeft;
               _loc5_ = _content.bubbleNewActorsLeft;
               _loc7_ = _tooltipBubbleActorsLeft;
               break;
            case "actors_right":
               _loc10_ = _content.txtPriceActorsRight;
               _loc9_ = _content.txtPriceFreeActorsRight;
               _loc2_ = _content.iconPremiumActorsRight;
               _loc3_ = _content.iconGameCurrencyActorsRight;
               _loc5_ = _content.bubbleNewActorsRight;
               _loc7_ = _tooltipBubbleActorsRight;
         }
         var _loc8_:StudioAppearanceSettings = User.current.character.guild.currentStudioAppearance;
         var _loc6_:int = 0;
         var _loc4_:int = 0;
         var _loc11_:Vector.<String> = User.current.character.guild.getFreeCustomizations(param1);
         _loc5_.visible = _loc11_.length > 0;
         _loc5_.txt.text = _loc11_.length.toString();
         _loc7_.text = _loc11_.length > 0?LocText.current.text("screen/guild/studio_customization/tooltip_free_customizations",_loc11_.length):"";
         if(_loc8_.getString(param1) == _settings.getString(param1))
         {
            _loc12_ = false;
            _loc9_.visible = _loc12_;
            _loc12_ = _loc12_;
            _loc3_.visible = _loc12_;
            _loc12_ = _loc12_;
            _loc2_.visible = _loc12_;
            _loc10_.visible = _loc12_;
         }
         else
         {
            _loc10_.visible = true;
            _loc6_ = _loc11_.indexOf(_settings.getString(param1)) >= 0?0:getPremiumPriceOfValue(param1,_settings.getString(param1));
            _loc4_ = _loc6_ > 0?0:_loc11_.indexOf(_settings.getString(param1)) >= 0?0:getGameCurrencyPriceOfValue(param1,_settings.getString(param1));
            _loc10_.text = LocText.current.formatHugeNumber(_loc6_ > 0?_loc6_:int(_loc4_));
            _loc2_.visible = _loc6_ > 0;
            _loc3_.visible = _loc4_ > 0;
            _loc10_.visible = _loc6_ > 0 || _loc4_ > 0;
            _loc9_.visible = _loc6_ == 0 && _loc4_ == 0;
         }
         return new <int>[_loc4_,_loc6_];
      }
      
      private function getPremiumPriceOfValue(param1:String, param2:String) : int
      {
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc5_:* = CGuildBackgroundLayer.ids;
         for each(var _loc3_ in CGuildBackgroundLayer.ids)
         {
            _loc4_ = CGuildBackgroundLayer.fromId(_loc3_);
            if(_loc4_.type == param1 && _loc4_.assetIdentifier == param2)
            {
               return _loc4_.costPremiumCurrency;
            }
         }
         return 0;
      }
      
      private function getGameCurrencyPriceOfValue(param1:String, param2:String) : int
      {
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc5_:* = CGuildBackgroundLayer.ids;
         for each(var _loc3_ in CGuildBackgroundLayer.ids)
         {
            _loc4_ = CGuildBackgroundLayer.fromId(_loc3_);
            if(_loc4_.type == param1 && _loc4_.assetIdentifier == param2)
            {
               return _loc4_.gameCurrencyCost;
            }
         }
         return 0;
      }
      
      private function refreshSaveButton() : void
      {
         var _loc1_:* = null;
         var _loc4_:Boolean = false;
         _btnCustomize.refresh(_pricePremiumTotal > 0,_priceGameCurrencyTotal > 0);
         var _loc2_:int = User.current.character.guildRank;
         if(_loc2_ == 3)
         {
            _btnCustomize.buttonEnabled = false;
            _btnCustomize.tooltip = LocText.current.text("screen/guild/studio_customization/button_customize_tooltip_not_allowed");
         }
         else
         {
            _loc1_ = User.current.character.guild.currentStudioAppearance;
            _loc4_ = false;
            var _loc6_:int = 0;
            var _loc5_:* = _loc1_.keys;
            for each(var _loc3_ in _loc1_.keys)
            {
               if(_loc1_.getString(_loc3_) != _settings.getString(_loc3_))
               {
                  _loc4_ = true;
                  break;
               }
            }
            _btnCustomize.buttonEnabled = _loc4_;
            _btnCustomize.tooltip = !!_btnCustomize.buttonEnabled?LocText.current.text("screen/guild/studio_customization/button_customize_tooltip"):LocText.current.text("screen/guild/studio_customization/button_customize_tooltip_nothing_changed");
         }
      }
      
      public function dispose() : void
      {
         _btnCancel.dispose();
         _btnCancel = null;
         _btnCustomize.dispose();
         _btnCustomize = null;
         _btnLeftRoom.dispose();
         _btnLeftRoom = null;
         _btnLeftQuarter.dispose();
         _btnLeftQuarter = null;
         _btnLeftMotivation.dispose();
         _btnLeftMotivation = null;
         _btnLeftPopularity.dispose();
         _btnLeftPopularity = null;
         _btnLeftEquipment.dispose();
         _btnLeftEquipment = null;
         _btnLeftActorLeft.dispose();
         _btnLeftActorLeft = null;
         _btnLeftActorRight.dispose();
         _btnLeftActorRight = null;
         _btnRightRoom.dispose();
         _btnRightRoom = null;
         _btnRightQuarter.dispose();
         _btnRightQuarter = null;
         _btnRightMotivation.dispose();
         _btnRightMotivation = null;
         _btnRightPopularity.dispose();
         _btnRightPopularity = null;
         _btnRightEquipment.dispose();
         _btnRightEquipment = null;
         _btnRightActorsLeft.dispose();
         _btnRightActorsLeft = null;
         _btnRightActorsRight.dispose();
         _btnRightActorsRight = null;
         _onHideCallback = null;
         _tooltipBubbleRoom.dispose();
         _tooltipBubbleQuarter.dispose();
         _tooltipBubbleEquipment.dispose();
         _tooltipBubbleMotivation.dispose();
         _tooltipBubblePopularity.dispose();
         _tooltipBubbleActorsLeft.dispose();
         _tooltipBubbleActorsRight.dispose();
      }
      
      private function onClickCancel(param1:InteractionEvent) : void
      {
         _content.visible = false;
      }
      
      private function onClickCustomize(param1:InteractionEvent) : void
      {
         var _loc2_:RequestData = RequestData.empty;
         var _loc5_:int = 0;
         var _loc4_:* = _settings.keys;
         for each(var _loc3_ in _settings.keys)
         {
            _loc2_.setString(_loc3_,_settings.getString(_loc3_));
         }
         Environment.application.sendActionRequest("customizeStudio",_loc2_,handleRequests);
      }
      
      protected function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("customizeStudio" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            _content.visible = false;
            _onHideCallback();
         }
         else if(param1.error == "errRemoveGameCurrencyNotEnough" || param1.error == "errRemovePremiumCurrencyNotEnough")
         {
            ViewManager.instance.showGuildNotEnoughGameCurrencyPremiumCurrencyDialog(_priceGameCurrencyTotal,_pricePremiumTotal);
         }
         else if(param1.error == "errCustomizeStudioNoPermission")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/customize_studio/no_permission_title"),LocText.current.text("dialog/customize_studio/no_permission_text"),LocText.current.text("general/button_ok")));
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      public function show() : void
      {
         _content.visible = true;
         var _loc1_:Guild = User.current.character.guild;
         _content.txtCurrentPremium.text = LocText.current.formatHugeNumber(_loc1_.premiumCurrency);
         _content.txtCurrentGameCurrency.text = LocText.current.formatHugeNumber(_loc1_.gameCurrency);
         _settings = _loc1_.currentStudioAppearance;
         refreshPriceList();
         refreshSaveButton();
      }
      
      public function get visible() : Boolean
      {
         return _content.visible;
      }
      
      public function refresh() : void
      {
         var _loc1_:Guild = User.current.character.guild;
         _content.txtCurrentPremium.text = LocText.current.formatHugeNumber(_loc1_.premiumCurrency);
         _content.txtCurrentGameCurrency.text = LocText.current.formatHugeNumber(_loc1_.gameCurrency);
         refreshPriceList();
         refreshSaveButton();
      }
   }
}

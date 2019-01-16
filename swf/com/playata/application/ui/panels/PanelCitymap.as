package com.playata.application.ui.panels
{
   import com.playata.application.AppConfig;
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.constants.CDungeonTemplate;
   import com.playata.application.data.convention.Convention;
   import com.playata.application.data.dating.DatingUtil;
   import com.playata.application.data.dungeon.Dungeon;
   import com.playata.application.data.goal.GoalValue;
   import com.playata.application.data.quest.Quest;
   import com.playata.application.data.story_dungeon.StoryDungeon;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogBoosterSense;
   import com.playata.application.ui.dialogs.DialogConventionComplete;
   import com.playata.application.ui.dialogs.DialogConventionInfo;
   import com.playata.application.ui.dialogs.DialogDungeonOpen;
   import com.playata.application.ui.dialogs.DialogDungeonQuestBriefing;
   import com.playata.application.ui.dialogs.DialogDungeonUnlocked;
   import com.playata.application.ui.dialogs.DialogOutOfEnergy;
   import com.playata.application.ui.dialogs.DialogQuestBriefing;
   import com.playata.application.ui.dialogs.DialogRefreshQuests;
   import com.playata.application.ui.dialogs.DialogTutorialConventions;
   import com.playata.application.ui.dialogs.DialogTutorialPopup;
   import com.playata.application.ui.elements.avatar.UiAvatarImage;
   import com.playata.application.ui.elements.background.UiBackgroundFader;
   import com.playata.application.ui.elements.citymap.UiCitymapButton;
   import com.playata.application.ui.elements.citymap.UiCitymapConventionIcon;
   import com.playata.application.ui.elements.citymap.UiCitymapDatingIcon;
   import com.playata.application.ui.elements.citymap.UiCitymapDungeonButton;
   import com.playata.application.ui.elements.citymap.UiCitymapProgressPoints;
   import com.playata.application.ui.elements.citymap.UiCitymapQuestIcon;
   import com.playata.application.ui.elements.citymap.UiCitymapStageRewards;
   import com.playata.application.ui.elements.citymap.UiCitymapStoryDungeonIcon;
   import com.playata.application.ui.elements.citymap.animations.ICitymapButtonClouds;
   import com.playata.application.ui.elements.citymap.animations.SymbolCloudsDungeon1Animation;
   import com.playata.application.ui.elements.citymap.animations.SymbolCloudsDungeon2Animation;
   import com.playata.application.ui.elements.citymap.animations.SymbolCloudsDungeon3Animation;
   import com.playata.application.ui.elements.citymap.animations.SymbolCloudsLocation1Animation;
   import com.playata.application.ui.elements.citymap.animations.SymbolCloudsLocation2Animation;
   import com.playata.application.ui.elements.citymap.animations.SymbolCloudsLocation3Animation;
   import com.playata.application.ui.elements.citymap.animations.SymbolCloudsLocation4Animation;
   import com.playata.application.ui.elements.citymap.animations.SymbolCloudsLocation5Animation;
   import com.playata.application.ui.elements.citymap.animations.SymbolCloudsLocation6Animation;
   import com.playata.application.ui.elements.citymap.animations.SymbolCloudsLocation7Animation;
   import com.playata.application.ui.elements.citymap.animations.SymbolCloudsLocation8Animation;
   import com.playata.application.ui.elements.citymap.animations.SymbolCloudsLocation9Animation;
   import com.playata.application.ui.elements.citymap.animations.SymbolCloudsLocationOliviaJonesAnimation;
   import com.playata.application.ui.elements.dungeon.UiDungeonKeyButton;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.resource.UiUseResourceButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.AnchorPoint;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.citymap.SymbolCitymapContentGeneric;
   import visuals.ui.elements.citymap.SymbolCloudsDungeon1Generic;
   import visuals.ui.elements.citymap.SymbolCloudsDungeon2Generic;
   import visuals.ui.elements.citymap.SymbolCloudsDungeon3Generic;
   import visuals.ui.elements.citymap.SymbolCloudsLocation1Generic;
   import visuals.ui.elements.citymap.SymbolCloudsLocation2Generic;
   import visuals.ui.elements.citymap.SymbolCloudsLocation3Generic;
   import visuals.ui.elements.citymap.SymbolCloudsLocation4Generic;
   import visuals.ui.elements.citymap.SymbolCloudsLocation5Generic;
   import visuals.ui.elements.citymap.SymbolCloudsLocation6Generic;
   import visuals.ui.elements.citymap.SymbolCloudsLocation7Generic;
   import visuals.ui.elements.citymap.SymbolCloudsLocation8Generic;
   import visuals.ui.elements.citymap.SymbolCloudsLocation9Generic;
   import visuals.ui.elements.citymap.SymbolCloudsLocationOliviaJonesGeneric;
   import visuals.ui.panels.SymbolPanelCitymapGeneric;
   
   public class PanelCitymap extends DefaultPanel
   {
      
      public static const ACTION_QUESTING:int = 1;
      
      public static const ACTION_DUNGEON:int = 2;
      
      private static const AVATAR_POSITION:Object = {
         "1":{
            "x":763,
            "y":184
         },
         "2":{
            "x":676,
            "y":416
         },
         "3":{
            "x":437,
            "y":196
         },
         "4":{
            "x":381,
            "y":366
         },
         "5":{
            "x":170,
            "y":454
         },
         "6":{
            "x":213,
            "y":318
         },
         "7":{
            "x":518,
            "y":445
         },
         "8":{
            "x":589,
            "y":181
         },
         "9":{
            "x":874,
            "y":208
         },
         "100":{
            "x":698,
            "y":113
         }
      };
      
      public static var unlockedStage:int = 0;
      
      public static var unlockedDungeon:String = "";
      
      public static var lastAction:int = 0;
       
      
      private var _btnHelp:UiButton = null;
      
      private var _locationButtons:Vector.<UiCitymapButton>;
      
      private var _dungeonButtons:StringMap;
      
      private var _conventionIcons:Vector.<UiCitymapConventionIcon>;
      
      private var _storyDungeonIcons:Vector.<UiCitymapStoryDungeonIcon>;
      
      private var _datingIcons:Vector.<UiCitymapDatingIcon>;
      
      private var _questIcons:Vector.<UiCitymapQuestIcon>;
      
      private var _rewards:Vector.<UiCitymapStageRewards>;
      
      private var _buttonMapping:IntMap;
      
      private var _conventionsToUpdate:Vector.<UiCitymapConventionIcon>;
      
      private var _updateTimer:ITimer;
      
      private var _avatarImage:UiAvatarImage;
      
      private var _points:UiCitymapProgressPoints;
      
      private var _tooltipEnergy:UiTextTooltip = null;
      
      private var _tooltipEnergyText:UiTextTooltip = null;
      
      private var _btnBuyEnergy:UiButton = null;
      
      private var _btnRefreshQuests:UiButton = null;
      
      private var _btnMostXPQuest:UiButton = null;
      
      private var _btnMostGameCurrencyQuest:UiButton = null;
      
      private var _btnDungeonKeyQuest:UiButton = null;
      
      private var _btnRepeatStoryDungeonKeyQuest:UiButton = null;
      
      private var _btnRepeatDatingKeyQuest:UiButton = null;
      
      private var _btnUseResource:UiUseResourceButton = null;
      
      private var _btnSenseBoosterIcon:UiButton;
      
      private var _btnDungeonTicket:UiDungeonKeyButton;
      
      private var _quest:Quest = null;
      
      public function PanelCitymap(param1:SymbolPanelCitymapGeneric)
      {
         var _loc5_:int = 0;
         var _loc9_:* = null;
         var _loc12_:* = null;
         var _loc15_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc17_:* = null;
         var _loc2_:* = null;
         var _loc16_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc4_:SymbolCitymapContentGeneric = param1.citymapContent;
         var _loc18_:IDisplayObject = null;
         _loc5_ = 0;
         while(_loc5_ < _loc4_.numChildren)
         {
            _loc18_ = _loc4_.getChildAt(_loc5_);
            if(_loc18_.name.indexOf("dungeon_") == 0 || _loc18_.name.indexOf("customStage") == 0)
            {
               _loc18_.visible = false;
            }
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < _loc4_.clouds.numChildren)
         {
            _loc18_ = _loc4_.clouds.getChildAt(_loc5_);
            if(_loc18_.name.indexOf("dungeon_") == 0 || _loc18_.name.indexOf("customStage") == 0)
            {
               _loc18_.visible = false;
            }
            _loc5_++;
         }
         _btnHelp = new UiButton(param1.btnHelp,LocText.current.text("general/button_help"),onClickHelp);
         _btnBuyEnergy = new UiButton(param1.btnBuyEnergy,LocText.current.text("screen/quest/button_buy_energy"),onClickBuyEnergy);
         _btnRefreshQuests = new UiButton(param1.btnRefreshQuests,LocText.current.text("screen/quest/button_refresh_quests"),onClickRefreshQuests);
         _btnMostXPQuest = new UiButton(param1.btnMostXPQuest,"",onClickMostXPQuest);
         _btnMostGameCurrencyQuest = new UiButton(param1.btnMostCoinQuest,"",onClickMostCoinQuest);
         _btnDungeonKeyQuest = new UiButton(param1.btnDungeonKeyQuest,LocText.current.text("screen/quest/dungeon_key_quest_tooltip"),onClickDungeonKeyQuest);
         _btnRepeatStoryDungeonKeyQuest = new UiButton(param1.btnRepeatStoryDungeonKeyQuest,"",onClickRepeatStoryDungeonKeyQuest);
         _btnRepeatDatingKeyQuest = new UiButton(param1.btnRepeatDatingKeyQuest,"",onClickRepeatDatingKeyQuest);
         _btnUseResource = new UiUseResourceButton(param1.btnUseResource,1,false,"quest");
         _btnSenseBoosterIcon = new UiButton(param1.btnSenseBoosterIcon,LocText.current.text("screen/quest/button_sense_booster",GameUtil.getSenseBoosterDurationString()),onClickSenseBooster);
         _btnDungeonTicket = new UiDungeonKeyButton(param1.btnDungeonTicket);
         _btnMostXPQuest.onInteractionOver.add(handleMostXPMouseOver);
         _btnMostXPQuest.onInteractionOut.add(handleMostXPMouseOut);
         _btnMostGameCurrencyQuest.onInteractionOver.add(handleMostCoinMouseOver);
         _btnMostGameCurrencyQuest.onInteractionOut.add(handleMostCoinMouseOut);
         _btnDungeonKeyQuest.onInteractionOver.add(handleDungeonKeyQuestMouseOver);
         _btnDungeonKeyQuest.onInteractionOut.add(handleDungeonKeyQuestMouseOut);
         _btnRepeatStoryDungeonKeyQuest.onInteractionOver.add(handleRepeatStoryDungeonKeyQuestMouseOver);
         _btnRepeatStoryDungeonKeyQuest.onInteractionOut.add(handleRepeatStoryDungeonKeyQuestMouseOut);
         _btnRepeatDatingKeyQuest.onInteractionOver.add(handleRepeatDatingKeyQuestMouseOver);
         _btnRepeatDatingKeyQuest.onInteractionOut.add(handleRepeatDatingKeyQuestMouseOut);
         _locationButtons = new Vector.<UiCitymapButton>(0);
         _buttonMapping = new IntMap();
         _conventionIcons = new Vector.<UiCitymapConventionIcon>(0);
         _storyDungeonIcons = new Vector.<UiCitymapStoryDungeonIcon>(0);
         _datingIcons = new Vector.<UiCitymapDatingIcon>(0);
         _questIcons = new Vector.<UiCitymapQuestIcon>(0);
         _rewards = new Vector.<UiCitymapStageRewards>(0);
         var _loc6_:ICitymapButtonClouds = null;
         var _loc14_:int = CConstant.quest_max_stage;
         _loc5_ = 1;
         while(_loc5_ <= _loc14_)
         {
            switch(int(_loc5_) - 1)
            {
               case 0:
                  _loc6_ = new SymbolCloudsLocation1Animation(_loc4_.clouds["location" + _loc5_] as SymbolCloudsLocation1Generic);
                  break;
               case 1:
                  _loc6_ = new SymbolCloudsLocation2Animation(_loc4_.clouds["location" + _loc5_] as SymbolCloudsLocation2Generic);
                  break;
               case 2:
                  _loc6_ = new SymbolCloudsLocation3Animation(_loc4_.clouds["location" + _loc5_] as SymbolCloudsLocation3Generic);
                  break;
               case 3:
                  _loc6_ = new SymbolCloudsLocation4Animation(_loc4_.clouds["location" + _loc5_] as SymbolCloudsLocation4Generic);
                  break;
               case 4:
                  _loc6_ = new SymbolCloudsLocation5Animation(_loc4_.clouds["location" + _loc5_] as SymbolCloudsLocation5Generic);
                  break;
               case 5:
                  _loc6_ = new SymbolCloudsLocation6Animation(_loc4_.clouds["location" + _loc5_] as SymbolCloudsLocation6Generic);
                  break;
               case 6:
                  _loc6_ = new SymbolCloudsLocation7Animation(_loc4_.clouds["location" + _loc5_] as SymbolCloudsLocation7Generic);
                  break;
               case 7:
                  _loc6_ = new SymbolCloudsLocation8Animation(_loc4_.clouds["location" + _loc5_] as SymbolCloudsLocation8Generic);
                  break;
               case 8:
                  _loc6_ = new SymbolCloudsLocation9Animation(_loc4_.clouds["location" + _loc5_] as SymbolCloudsLocation9Generic);
            }
            _loc10_ = new UiCitymapButton(_loc4_["location" + _loc5_],_loc6_,_loc5_,onAreaClicked);
            _buttonMapping.setData(_loc5_,_loc10_);
            _locationButtons.push(_loc10_);
            _loc9_ = new UiCitymapConventionIcon(_loc4_["conventionEventStage" + _loc5_],_loc5_);
            _conventionIcons.push(_loc9_);
            _loc12_ = new UiCitymapStoryDungeonIcon(_loc4_["storyDungeonStage" + _loc5_],_loc5_);
            _storyDungeonIcons.push(_loc12_);
            _loc15_ = new UiCitymapDatingIcon(_loc4_["datingStage" + _loc5_],_loc5_);
            _datingIcons.push(_loc15_);
            _loc11_ = new UiCitymapQuestIcon(_loc4_["questStage" + _loc5_],_loc5_);
            _questIcons.push(_loc11_);
            _loc17_ = new UiCitymapStageRewards(_loc4_["stage" + _loc5_ + "Rewards"],_loc5_,onQuestClicked);
            _rewards.push(_loc17_);
            if(_loc6_)
            {
               (_loc4_.clouds["location" + _loc5_] as IDisplayObject).nativeInstance.mouseEnabled = false;
               (_loc4_.clouds["location" + _loc5_] as IDisplayObject).nativeInstance.mouseChildren = false;
            }
            if(_loc9_)
            {
               (_loc4_["conventionEventStage" + _loc5_] as IDisplayObject).nativeInstance.mouseEnabled = false;
               (_loc4_["conventionEventStage" + _loc5_] as IDisplayObject).nativeInstance.mouseChildren = false;
            }
            if(_loc12_)
            {
               (_loc4_["storyDungeonStage" + _loc5_] as IDisplayObject).nativeInstance.mouseEnabled = false;
               (_loc4_["storyDungeonStage" + _loc5_] as IDisplayObject).nativeInstance.mouseChildren = false;
            }
            if(_loc15_)
            {
               (_loc4_["datingStage" + _loc5_] as IDisplayObject).nativeInstance.mouseEnabled = false;
               (_loc4_["datingStage" + _loc5_] as IDisplayObject).nativeInstance.mouseChildren = false;
            }
            if(_loc11_)
            {
               (_loc4_["questStage" + _loc5_] as IDisplayObject).nativeInstance.mouseEnabled = false;
               (_loc4_["questStage" + _loc5_] as IDisplayObject).nativeInstance.mouseChildren = false;
            }
            _loc5_++;
         }
         var _loc13_:Vector.<int> = GameUtil.getCustomStages();
         var _loc21_:* = 0;
         var _loc20_:* = _loc13_;
         for each(_loc5_ in _loc13_)
         {
            if(!(int(_loc5_) - 100))
            {
               _loc6_ = new SymbolCloudsLocationOliviaJonesAnimation(_loc4_.clouds["customStageLocation" + _loc5_] as SymbolCloudsLocationOliviaJonesGeneric);
            }
            var _loc19_:Boolean = true;
            _loc4_.clouds["customStageLocation" + _loc5_].visible = _loc19_;
            _loc4_["customStageLocation" + _loc5_].visible = _loc19_;
            _loc10_ = new UiCitymapButton(_loc4_["customStageLocation" + _loc5_],_loc6_,_loc5_,onAreaClicked,true);
            _buttonMapping.setData(_loc5_,_loc10_);
            _locationButtons.push(_loc10_);
            _loc4_["customStageConventionEventStage" + _loc5_].visible = true;
            _loc9_ = new UiCitymapConventionIcon(_loc4_["customStageConventionEventStage" + _loc5_],_loc5_,true);
            _conventionIcons.push(_loc9_);
            _loc4_["customStageStoryDungeonStage" + _loc5_].visible = true;
            _loc12_ = new UiCitymapStoryDungeonIcon(_loc4_["customStageStoryDungeonStage" + _loc5_],_loc5_);
            _storyDungeonIcons.push(_loc12_);
            _loc4_["customStageDatingStage" + _loc5_].visible = true;
            _loc15_ = new UiCitymapDatingIcon(_loc4_["customStageDatingStage" + _loc5_],_loc5_);
            _datingIcons.push(_loc15_);
            _loc4_["customStageQuest" + _loc5_].visible = true;
            _loc11_ = new UiCitymapQuestIcon(_loc4_["customStageQuest" + _loc5_],_loc5_);
            _questIcons.push(_loc11_);
            _loc4_["customStage" + _loc5_ + "Rewards"].visible = true;
            _loc17_ = new UiCitymapStageRewards(_loc4_["customStage" + _loc5_ + "Rewards"],_loc5_,onQuestClicked);
            _rewards.push(_loc17_);
            if(_loc6_)
            {
               (_loc4_.clouds["customStageLocation" + _loc5_] as IDisplayObject).nativeInstance.mouseEnabled = false;
               (_loc4_.clouds["customStageLocation" + _loc5_] as IDisplayObject).nativeInstance.mouseChildren = false;
            }
            if(_loc9_)
            {
               (_loc4_["customStageConventionEventStage" + _loc5_] as IDisplayObject).nativeInstance.mouseEnabled = false;
               (_loc4_["customStageConventionEventStage" + _loc5_] as IDisplayObject).nativeInstance.mouseChildren = false;
            }
            if(_loc12_)
            {
               (_loc4_["customStageStoryDungeonStage" + _loc5_] as IDisplayObject).nativeInstance.mouseEnabled = false;
               (_loc4_["customStageStoryDungeonStage" + _loc5_] as IDisplayObject).nativeInstance.mouseChildren = false;
            }
            if(_loc15_)
            {
               (_loc4_["customStageDatingStage" + _loc5_] as IDisplayObject).nativeInstance.mouseEnabled = false;
               (_loc4_["customStageDatingStage" + _loc5_] as IDisplayObject).nativeInstance.mouseChildren = false;
            }
            if(_loc11_)
            {
               (_loc4_["customStageQuest" + _loc5_] as IDisplayObject).nativeInstance.mouseEnabled = false;
               (_loc4_["customStageQuest" + _loc5_] as IDisplayObject).nativeInstance.mouseChildren = false;
            }
         }
         _points = new UiCitymapProgressPoints(_loc4_.progressPoints,onLocationVisible);
         _dungeonButtons = new StringMap();
         if(AppConfig.dungeonsEnabled)
         {
            var _loc23_:int = 0;
            var _loc22_:* = CDungeonTemplate.ids;
            for each(var _loc3_ in CDungeonTemplate.ids)
            {
               _loc2_ = "dungeon_" + _loc3_;
               _loc16_ = _loc4_.getChildByName(_loc2_) as IDisplayObjectContainer;
               _loc7_ = _loc4_.clouds.getChildByName(_loc2_);
               _loc19_ = true;
               _loc7_.visible = _loc19_;
               _loc16_.visible = _loc19_;
               if(_loc7_)
               {
                  _loc7_.nativeInstance.mouseEnabled = false;
                  _loc7_.nativeInstance.mouseChildren = false;
               }
               _loc21_ = _loc3_;
               switch(_loc21_)
               {
                  case "burning_bernie":
                     _loc6_ = new SymbolCloudsDungeon1Animation(_loc7_ as SymbolCloudsDungeon1Generic);
                     break;
                  case "flaming_wheels":
                     _loc6_ = new SymbolCloudsDungeon2Animation(_loc7_ as SymbolCloudsDungeon2Generic);
                     break;
                  case "whiplash":
                     _loc6_ = new SymbolCloudsDungeon3Animation(_loc7_ as SymbolCloudsDungeon3Generic);
               }
               _loc8_ = new UiCitymapDungeonButton(_loc16_,_loc6_,_loc3_,onDungeonClicked,checkForFinishedDungeons);
               _dungeonButtons.setData(_loc3_,_loc8_);
            }
         }
         _tooltipEnergy = new UiTextTooltip(param1.iconEnergy,"");
         _tooltipEnergyText = new UiTextTooltip(param1.txtEnergyLeft,"");
         _tooltipEnergy.requestTextFunction = getQuestEnergyTooltip;
         _tooltipEnergyText.requestTextFunction = getQuestEnergyTooltip;
         param1.nativeInstance.blendMode = "layer";
         _updateTimer = Environment.createTimer("PanelCitymap::timer",1000,onUpdateTimer);
         _conventionsToUpdate = new Vector.<UiCitymapConventionIcon>();
         _avatarImage = new UiAvatarImage(_loc4_.imageAvatarPlaceholder);
         super(param1);
         _anchorContainer.add(param1.btnDungeonTicket,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.btnBuyEnergy,AnchorPoint.TOP_RIGHT);
         _anchorContainer.add(param1.iconEnergy,AnchorPoint.TOP_RIGHT);
         _anchorContainer.add(param1.txtEnergyLeft,AnchorPoint.TOP_RIGHT);
         _anchorContainer.add(param1.btnRefreshQuests,AnchorPoint.TOP_RIGHT);
         _anchorContainer.add(param1.btnSenseBoosterIcon,AnchorPoint.TOP_RIGHT);
         _anchorContainer.add(param1.btnMostCoinQuest,AnchorPoint.TOP_RIGHT);
         _anchorContainer.add(param1.btnMostXPQuest,AnchorPoint.TOP_RIGHT);
         _anchorContainer.add(param1.btnRepeatStoryDungeonKeyQuest,AnchorPoint.TOP_RIGHT);
         _anchorContainer.add(param1.btnRepeatDatingKeyQuest,AnchorPoint.TOP_RIGHT);
         _anchorContainer.add(param1.btnUseResource,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.btnUseResource,AnchorPoint.BOTTOM_FIXED);
      }
      
      public static function checkForConventionInfo() : void
      {
         if(!User.current.character.hasTutorialFlag("tutorial_finished"))
         {
            return;
         }
         checkForPendingConventions();
         checkForFinishedConventions();
         checkForNewConventions();
      }
      
      private static function checkForPendingConventions() : void
      {
         var _loc1_:Vector.<Convention> = User.current.character.pendingConventions;
         var _loc4_:int = 0;
         var _loc3_:* = _loc1_;
         for each(var _loc2_ in _loc1_)
         {
            if(!DialogDungeonQuestBriefing.isOpen && !DialogQuestBriefing.isOpen && !DialogConventionInfo.isOpen && !DialogConventionComplete.isOpen && !DialogConventionInfo.hasBeenShown(_loc2_))
            {
               Environment.panelManager.showDialog(new DialogConventionInfo(_loc2_));
            }
         }
      }
      
      private static function checkForFinishedConventions() : void
      {
         var _loc2_:Vector.<Convention> = User.current.character.finishedConventions;
         var _loc4_:int = 0;
         var _loc3_:* = _loc2_;
         for each(var _loc1_ in _loc2_)
         {
            if(!DialogDungeonQuestBriefing.isOpen && !DialogQuestBriefing.isOpen && !DialogConventionInfo.isOpen && !DialogConventionComplete.isOpen && !DialogConventionInfo.hasBeenShown(_loc1_))
            {
               if(DialogConventionInfo.pendingHasBeenShown(_loc1_))
               {
                  Environment.panelManager.showDialog(new DialogConventionComplete(_loc1_));
               }
               else
               {
                  Environment.panelManager.showDialog(new DialogConventionInfo(_loc1_));
               }
            }
         }
      }
      
      private static function checkForNewConventions() : void
      {
         var _loc1_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = User.current.character.newConventionIds;
         for each(var _loc2_ in User.current.character.newConventionIds)
         {
            _loc1_ = User.current.character.getConvention(_loc2_);
            if(_loc1_)
            {
               if(!DialogDungeonQuestBriefing.isOpen && !DialogQuestBriefing.isOpen && !DialogConventionInfo.isOpen && !DialogConventionComplete.isOpen && !DialogConventionInfo.hasBeenShown(_loc1_))
               {
                  if(!User.current.character.hasTutorialFlag("conventions") && !DialogTutorialConventions.isOpen)
                  {
                     Environment.panelManager.showDialog(new DialogTutorialConventions());
                  }
                  Environment.panelManager.showDialog(new DialogConventionInfo(_loc1_));
               }
            }
         }
      }
      
      override public function reset() : void
      {
         super.reset();
         unlockedDungeon = "";
         unlockedStage = 0;
         lastAction = 0;
      }
      
      override public function refreshAppSize() : void
      {
         super.refreshAppSize();
         var _loc1_:SymbolPanelCitymapGeneric = _vo as SymbolPanelCitymapGeneric;
         UiBackgroundFader.scaleWidthCenter(_loc1_.citymapContent);
      }
      
      private function handleMostXPMouseOut(param1:InteractionEvent) : void
      {
         var _loc2_:Quest = User.current.character.mostXPQuest;
         var _loc3_:UiCitymapButton = _buttonMapping.getData(_loc2_.stage);
         _loc3_.outHandler(null);
      }
      
      private function handleMostXPMouseOver(param1:InteractionEvent) : void
      {
         var _loc2_:Quest = User.current.character.mostXPQuest;
         var _loc3_:UiCitymapButton = _buttonMapping.getData(_loc2_.stage);
         _loc3_.overHandler(null);
      }
      
      private function handleMostCoinMouseOut(param1:InteractionEvent) : void
      {
         var _loc2_:Quest = User.current.character.mostGameCurrencyQuest;
         var _loc3_:UiCitymapButton = _buttonMapping.getData(_loc2_.stage);
         _loc3_.outHandler(null);
      }
      
      private function handleMostCoinMouseOver(param1:InteractionEvent) : void
      {
         var _loc2_:Quest = User.current.character.mostGameCurrencyQuest;
         var _loc3_:UiCitymapButton = _buttonMapping.getData(_loc2_.stage);
         _loc3_.overHandler(null);
      }
      
      private function handleDungeonKeyQuestMouseOut(param1:InteractionEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:Quest = User.current.character.dungeonKeyQuest;
         if(_loc2_)
         {
            _loc3_ = _buttonMapping.getData(_loc2_.stage);
            _loc3_.outHandler(null);
         }
      }
      
      private function handleDungeonKeyQuestMouseOver(param1:InteractionEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:Quest = User.current.character.dungeonKeyQuest;
         if(_loc2_)
         {
            _loc3_ = _buttonMapping.getData(_loc2_.stage);
            _loc3_.overHandler(null);
         }
      }
      
      private function handleRepeatStoryDungeonKeyQuestMouseOut(param1:InteractionEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:Quest = User.current.character.dungeonKeyQuest;
         if(_loc2_)
         {
            _loc3_ = _buttonMapping[_loc2_.stage];
            _loc3_.outHandler(null);
         }
      }
      
      private function handleRepeatStoryDungeonKeyQuestMouseOver(param1:InteractionEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:Quest = User.current.character.repeatStoryDungeonKeyQuest;
         if(_loc2_)
         {
            _loc3_ = _buttonMapping[_loc2_.stage];
            _loc3_.overHandler(null);
         }
      }
      
      private function handleRepeatDatingKeyQuestMouseOut(param1:InteractionEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:Quest = User.current.character.repeatDatingKeyQuest;
         if(_loc2_)
         {
            _loc3_ = _buttonMapping[_loc2_.stage];
            _loc3_.outHandler(null);
         }
      }
      
      private function handleRepeatDatingKeyQuestMouseOver(param1:InteractionEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:Quest = User.current.character.repeatDatingKeyQuest;
         if(_loc2_)
         {
            _loc3_ = _buttonMapping[_loc2_.stage];
            _loc3_.overHandler(null);
         }
      }
      
      private function onClickBuyEnergy(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogOutOfEnergy(null,true));
      }
      
      private function onClickRefreshQuests(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogRefreshQuests());
      }
      
      private function onClickSenseBooster(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogBoosterSense());
      }
      
      private function onClickMostXPQuest(param1:InteractionEvent) : void
      {
         var _loc2_:Quest = User.current.character.mostXPQuest;
         PanelQuests.openQuestId = _loc2_.id;
         onAreaClicked(_loc2_.stage);
      }
      
      private function onClickMostCoinQuest(param1:InteractionEvent) : void
      {
         var _loc2_:Quest = User.current.character.mostGameCurrencyQuest;
         PanelQuests.openQuestId = _loc2_.id;
         onAreaClicked(_loc2_.stage);
      }
      
      private function onClickDungeonKeyQuest(param1:InteractionEvent) : void
      {
         var _loc2_:Quest = User.current.character.dungeonKeyQuest;
         if(_loc2_)
         {
            PanelQuests.openQuestId = _loc2_.id;
            onAreaClicked(_loc2_.stage);
         }
      }
      
      private function onClickRepeatStoryDungeonKeyQuest(param1:InteractionEvent) : void
      {
         var _loc2_:Quest = User.current.character.repeatStoryDungeonKeyQuest;
         if(_loc2_)
         {
            PanelQuests.openQuestId = _loc2_.id;
            onAreaClicked(_loc2_.stage);
         }
      }
      
      private function onClickRepeatDatingKeyQuest(param1:InteractionEvent) : void
      {
         var _loc2_:Quest = User.current.character.repeatDatingKeyQuest;
         if(_loc2_)
         {
            PanelQuests.openQuestId = _loc2_.id;
            onAreaClicked(_loc2_.stage);
         }
      }
      
      private function getQuestEnergyTooltip() : String
      {
         return LocText.current.text("screen/quest/energy_amount_tooltip",TimeUtil.secondsToString(User.current.character.secondsUntilQuestEnergyRefresh));
      }
      
      private function onLocationVisible(param1:int) : void
      {
         var _loc2_:UiCitymapButton = _buttonMapping.getData(param1);
         _loc2_.playNewLocationAnimation();
      }
      
      private function onAreaClicked(param1:int) : void
      {
         ViewManager.instance.tutorialArrow.hide();
         Environment.application.sendActionRequest("setCharacterStage",{
            "stage":param1,
            "on_map":false
         },handleRequests);
      }
      
      private function onQuestClicked(param1:Quest) : void
      {
         _quest = param1;
         onAreaClicked(_quest.stage);
      }
      
      private function onDungeonClicked(param1:String) : void
      {
         Runtime.killDelayedFunction(hideDungeonTutorialLady);
         ViewManager.instance.tutorialArrow.hide();
         var _loc2_:Character = User.current.character;
         if(_loc2_.currentDungeon && _loc2_.currentDungeon.identifier == param1)
         {
            Environment.application.sendActionRequest("setCharacterLocation",{"location":3},handleRequests);
         }
         else if(_loc2_.currentDungeon && _loc2_.currentDungeon.identifier != param1)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/dungeon_not_accessible/title"),LocText.current.text("dialog/dungeon_not_accessible/text"),LocText.current.text("general/button_ok")));
         }
         else if(TimeUtil.serverDateTime.isToday(_loc2_.tsLastDungeonStarted))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/dungeon_cooldown/title"),LocText.current.text("dialog/dungeon_cooldown/text"),LocText.current.text("general/button_ok")));
         }
         else
         {
            Environment.panelManager.showDialog(new DialogDungeonOpen(param1));
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "setCharacterStage":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  ViewManager.instance.showPanel("quests");
                  lastAction = 1;
                  if(_quest != null && ViewManager.instance.activePanel == "quests")
                  {
                     (ViewManager.instance.activePanelInstance as PanelQuests).openQuest(_quest);
                  }
                  _quest = null;
               }
               else if(param1.error != "errSetCharacterStageInvalidQuestStage")
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "setCharacterLocation":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  PanelDungeon.visualizeEnter = true;
                  ViewManager.instance.showPanel("dungeon");
                  lastAction = 2;
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
      
      private function onClickHelp(param1:InteractionEvent) : void
      {
         showTutorialDialog();
      }
      
      override public function show(param1:* = null) : void
      {
         ViewManager.instance.fadeInPanel(_vo);
         ViewManager.instance.setBackground(11);
         super.show(param1);
         _points.refresh();
         if(unlockedDungeon != "")
         {
            Environment.panelManager.showDialog(new DialogDungeonUnlocked(PanelCitymap.unlockedDungeon,onDialogDungeonUnlockClosed));
         }
         else if(User.current.character.hasDungeonKey && !User.current.character.hasTutorialFlag("first_dungeon"))
         {
            ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/first_dungeon_arrow_text"),"left_back","right",840 + LayoutUtil.deviceAdjustedWidthCorrection,480,1,30);
            Runtime.delayFunction(hideDungeonTutorialLady,5);
         }
      }
      
      private function hideDungeonTutorialLady() : void
      {
         ViewManager.instance.tutorialArrow.hide();
      }
      
      private function onDialogDungeonUnlockClosed() : void
      {
         var _loc1_:UiCitymapDungeonButton = _dungeonButtons.getData(unlockedDungeon);
         _loc1_.playNewDungeonAnimation();
         unlockedDungeon = "";
      }
      
      override public function hide() : void
      {
         super.hide();
         Runtime.killDelayedFunction(hideDungeonTutorialLady);
         _updateTimer.stop();
         _points.stopAnimation();
         var _loc3_:int = 0;
         var _loc2_:* = _dungeonButtons.values;
         for each(var _loc1_ in _dungeonButtons.values)
         {
            _loc1_.stopTimer();
         }
      }
      
      override public function refresh() : void
      {
         var _loc13_:* = null;
         var _loc1_:* = null;
         var _loc15_:* = null;
         var _loc8_:* = null;
         var _loc10_:* = null;
         var _loc16_:* = null;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         super.refresh();
         var _loc14_:SymbolPanelCitymapGeneric = _vo as SymbolPanelCitymapGeneric;
         var _loc12_:Character = User.current.character;
         _btnBuyEnergy.visible = _loc12_.questEnergy <= 50 && _loc12_.hasUsedAllQuestEnergy == false && _loc12_.hasTutorialFlag("tutorial_finished");
         _btnDungeonTicket.refresh();
         _btnRefreshQuests.visible = _loc12_.hasTutorialFlag("tutorial_finished");
         _btnMostXPQuest.visible = _loc12_.senseBoosterActive && _loc12_.hasTutorialFlag("tutorial_finished");
         _btnMostGameCurrencyQuest.visible = _btnMostXPQuest.visible;
         _btnDungeonKeyQuest.visible = false;
         _btnRepeatStoryDungeonKeyQuest.visible = false;
         _btnRepeatDatingKeyQuest.visible = false;
         _btnSenseBoosterIcon.visible = !_loc12_.senseBoosterActive && _loc12_.hasTutorialFlag("tutorial_finished");
         _btnUseResource.visible = _loc12_.hasTutorialFlag("tutorial_finished") && AppEnvironment.appPlatform.isResourceRequestAllowed;
         _btnUseResource.refresh();
         if(_btnMostXPQuest.visible)
         {
            _loc13_ = _loc12_.mostXPQuest;
            if(_loc13_.reward.movieVotes > 0)
            {
               _btnMostXPQuest.tooltip = LocText.current.text("screen/quest/most_xp_quest_incl_voting_tooltip",GameUtil.getXpString(_loc13_.xpRewardInclVoting),LocText.current.formatHugeNumber(Math.round(_loc13_.xpPerEnergyValue)),LocText.current.text("dialog/stage_unlocked/stage" + _loc13_.stage + "_title"));
            }
            else
            {
               _btnMostXPQuest.tooltip = LocText.current.text("screen/quest/most_xp_quest_tooltip",GameUtil.getXpString(_loc13_.xpRewardInclVoting),LocText.current.formatHugeNumber(Math.round(_loc13_.xpPerEnergyValue)),LocText.current.text("dialog/stage_unlocked/stage" + _loc13_.stage + "_title"));
            }
            _loc1_ = _loc12_.mostGameCurrencyQuest;
            if(_loc1_.hasItemReward && _loc1_.reward.movieVotes > 0)
            {
               _btnMostGameCurrencyQuest.tooltip = LocText.current.text("screen/quest/most_coin_quest_incl_item_and_voting_tooltip",GameUtil.getGameCurrencyString(_loc1_.coinRewardInclItemAndVoting),LocText.current.formatHugeNumber(Math.round(_loc1_.gameCurrencyPerEnergyValue)),LocText.current.text("dialog/stage_unlocked/stage" + _loc1_.stage + "_title"));
            }
            else if(_loc1_.reward.movieVotes > 0)
            {
               _btnMostGameCurrencyQuest.tooltip = LocText.current.text("screen/quest/most_coin_quest_incl_voting_tooltip",GameUtil.getGameCurrencyString(_loc1_.coinRewardInclItemAndVoting),LocText.current.formatHugeNumber(Math.round(_loc1_.gameCurrencyPerEnergyValue)),LocText.current.text("dialog/stage_unlocked/stage" + _loc1_.stage + "_title"));
            }
            else if(_loc1_.hasItemReward)
            {
               _btnMostGameCurrencyQuest.tooltip = LocText.current.text("screen/quest/most_coin_quest_incl_item_tooltip",GameUtil.getGameCurrencyString(_loc1_.coinRewardInclItemAndVoting),LocText.current.formatHugeNumber(Math.round(_loc1_.gameCurrencyPerEnergyValue)),LocText.current.text("dialog/stage_unlocked/stage" + _loc1_.stage + "_title"));
            }
            else
            {
               _btnMostGameCurrencyQuest.tooltip = LocText.current.text("screen/quest/most_coin_quest_tooltip",GameUtil.getGameCurrencyString(_loc1_.coinRewardInclItemAndVoting),LocText.current.formatHugeNumber(Math.round(_loc1_.gameCurrencyPerEnergyValue)),LocText.current.text("dialog/stage_unlocked/stage" + _loc1_.stage + "_title"));
            }
            _loc15_ = _loc12_.dungeonKeyQuest;
            if(_loc15_)
            {
               _btnDungeonKeyQuest.visible = true;
            }
            if(_btnDungeonKeyQuest.visible)
            {
               _loc14_.btnRepeatStoryDungeonKeyQuest.x = _loc14_.btnDungeonKeyQuest.x - 68;
            }
            else
            {
               _loc14_.btnRepeatStoryDungeonKeyQuest.x = _loc14_.btnDungeonKeyQuest.x;
            }
            _loc8_ = _loc12_.repeatStoryDungeonKeyQuest;
            if(_loc8_)
            {
               _btnRepeatStoryDungeonKeyQuest.visible = true;
               _btnRepeatStoryDungeonKeyQuest.tooltip = LocText.current.text("screen/quest/repeat_story_dungeon_key_quest_tooltip",StoryDungeon.getName(_loc8_.reward.repeatStoryDungeonIndex));
            }
            if(_btnRepeatStoryDungeonKeyQuest.visible)
            {
               _loc14_.btnRepeatDatingKeyQuest.x = _loc14_.btnRepeatStoryDungeonKeyQuest.x - 57;
            }
            else
            {
               _loc14_.btnRepeatDatingKeyQuest.x = _loc14_.btnRepeatStoryDungeonKeyQuest.x;
            }
            _loc10_ = _loc12_.repeatDatingKeyQuest;
            if(_loc10_)
            {
               _btnRepeatDatingKeyQuest.visible = true;
               _btnRepeatDatingKeyQuest.tooltip = LocText.current.text("screen/quest/repeat_dating_key_quest_tooltip",DatingUtil.getName(_loc10_.reward.repeatDatingIndex));
            }
         }
         _loc14_.txtEnergyLeft.text = LocText.current.text("general/energy_amount",_loc12_.questEnergy,Quest.maxQuestEnergy);
         _avatarImage.setToUser();
         switch(int(lastAction) - 1)
         {
            case 0:
               _loc16_ = AVATAR_POSITION[_loc12_.currentQuestStage];
               break;
            case 1:
               if(_loc12_.currentDungeon)
               {
                  _loc16_ = getAvatarImagePositionForDungeon(_loc12_.currentDungeon.identifier);
               }
               else
               {
                  _loc16_ = AVATAR_POSITION[_loc12_.currentQuestStage];
               }
         }
         _loc14_.citymapContent.imageAvatarPlaceholder.x = _loc16_.x;
         _loc14_.citymapContent.imageAvatarPlaceholder.y = _loc16_.y;
         _loc14_.citymapContent.imageAvatarPlaceholder.visible = true;
         var _loc20_:int = 0;
         var _loc19_:* = _locationButtons;
         for each(var _loc6_ in _locationButtons)
         {
            _loc6_.refresh();
         }
         var _loc22_:int = 0;
         var _loc21_:* = _questIcons;
         for each(var _loc9_ in _questIcons)
         {
            _loc9_.refresh();
         }
         var _loc3_:Vector.<GoalValue> = _loc12_.openGoalValues(true);
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc2_ = _loc3_[_loc4_];
            if(_loc2_.goal.identifier.indexOf("quest") < 0)
            {
               _loc3_.splice(_loc4_,1);
               _loc4_--;
            }
            _loc4_++;
         }
         var _loc24_:int = 0;
         var _loc23_:* = _rewards;
         for each(var _loc18_ in _rewards)
         {
            _loc18_.refresh(_loc3_);
         }
         _conventionsToUpdate.length = 0;
         var _loc26_:int = 0;
         var _loc25_:* = _conventionIcons;
         for each(var _loc7_ in _conventionIcons)
         {
            if(_loc7_.refresh())
            {
               _conventionsToUpdate.push(_loc7_);
            }
         }
         if(_conventionsToUpdate.length > 0)
         {
            _updateTimer.start();
         }
         else
         {
            _updateTimer.stop();
         }
         var _loc28_:int = 0;
         var _loc27_:* = _storyDungeonIcons;
         for each(var _loc11_ in _storyDungeonIcons)
         {
            _loc11_.refresh();
         }
         var _loc30_:int = 0;
         var _loc29_:* = _datingIcons;
         for each(var _loc17_ in _datingIcons)
         {
            _loc17_.refresh();
         }
         checkForConventionInfo();
         var _loc32_:int = 0;
         var _loc31_:* = _dungeonButtons.values;
         for each(var _loc5_ in _dungeonButtons.values)
         {
            _loc5_.refresh();
         }
         checkForFinishedDungeons();
      }
      
      private function getAvatarImagePositionForDungeon(param1:String) : Object
      {
         if(AVATAR_POSITION.hasOwnProperty(param1))
         {
            return AVATAR_POSITION[param1];
         }
         var _loc3_:SymbolPanelCitymapGeneric = _vo as SymbolPanelCitymapGeneric;
         var _loc2_:String = "dungeon_" + param1;
         var _loc4_:IDisplayObject = _loc3_.citymapContent.getChildByName(_loc2_);
         return {
            "x":_loc4_.x + 3,
            "y":_loc4_.y - 44
         };
      }
      
      private function checkForFinishedDungeons() : void
      {
         var _loc1_:Dungeon = User.current.character.currentDungeon;
         if(_loc1_)
         {
            PanelDungeon.instance.checkDungeonStatus();
         }
      }
      
      private function onUpdateTimer() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _conventionsToUpdate;
         for each(var _loc1_ in _conventionsToUpdate)
         {
            _loc1_.refresh();
         }
      }
      
      override public function refreshPanelLocalization() : void
      {
         _btnHelp.tooltip = LocText.current.text("general/button_help");
         _btnBuyEnergy.tooltip = LocText.current.text("screen/quest/button_buy_energy");
         _btnSenseBoosterIcon.tooltip = LocText.current.text("screen/quest/button_sense_booster",GameUtil.getSenseBoosterDurationString());
      }
      
      override public function dispose() : void
      {
         var _loc1_:SymbolPanelCitymapGeneric = _vo as SymbolPanelCitymapGeneric;
         var _loc4_:int = 0;
         var _loc3_:* = _locationButtons;
         for each(var _loc2_ in _locationButtons)
         {
            _loc2_.dispose();
         }
         _btnBuyEnergy.dispose();
         _btnBuyEnergy = null;
         _btnRefreshQuests.dispose();
         _btnRefreshQuests = null;
         _btnMostXPQuest.dispose();
         _btnMostXPQuest = null;
         _btnMostGameCurrencyQuest.dispose();
         _btnMostGameCurrencyQuest = null;
         _btnDungeonKeyQuest.dispose();
         _btnDungeonKeyQuest = null;
         _btnRepeatStoryDungeonKeyQuest.dispose();
         _btnRepeatStoryDungeonKeyQuest = null;
         _btnUseResource.dispose();
         _btnUseResource = null;
         _tooltipEnergy.dispose();
         _tooltipEnergy = null;
         _tooltipEnergyText.dispose();
         _tooltipEnergyText = null;
         _btnSenseBoosterIcon.dispose();
         _btnSenseBoosterIcon = null;
         _btnDungeonTicket.dispose();
         _btnDungeonTicket = null;
         super.dispose();
      }
      
      private function showTutorialDialog() : void
      {
         Environment.panelManager.showDialog(new DialogTutorialPopup(LocText.current.text("dialog/tutorial/citymap/title"),LocText.current.text("dialog/tutorial/citymap/text"),onTutorialDialogClosed));
      }
      
      private function onTutorialDialogClosed() : void
      {
         User.current.character.setTutorialFlag("citymap");
      }
   }
}

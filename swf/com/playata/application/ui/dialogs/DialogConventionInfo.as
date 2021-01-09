package com.playata.application.ui.dialogs
{
   import com.greensock.easing.Back;
   import com.greensock.easing.Quart;
   import com.playata.application.data.convention.Convention;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.effects.GlowFilterEffect;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.item.UiItemGraphic;
   import com.playata.application.ui.panels.PanelCitymap;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.UriSprite;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogConventionInfoGeneric;
   
   public class DialogConventionInfo extends UiDialog
   {
      
      private static var _isOpen:Boolean = false;
      
      private static var _shownNewConventionIds:Vector.<int> = new Vector.<int>();
      
      private static var _shownPendingConventionIds:Vector.<int> = new Vector.<int>();
      
      private static var _shownFinishedConventionIds:Vector.<int> = new Vector.<int>();
       
      
      private var _btnClose:UiTextButton = null;
      
      private var _btnHelp:UiButton;
      
      private var _convention:Convention = null;
      
      private var _tooltipGameCurrency:UiTextTooltip;
      
      private var _tooltipXp:UiTextTooltip;
      
      private var _tooltipTopRank:UiTextTooltip;
      
      private var _tooltipTopPool:UiTextTooltip;
      
      private var _tooltipOther:UiTextTooltip;
      
      private var _tooltipRewards:UiTextTooltip;
      
      private var _glowFilterTopRankItem:GlowFilterEffect = null;
      
      private var _glowFilterTopPoolItem:GlowFilterEffect = null;
      
      public function DialogConventionInfo(param1:Convention)
      {
         var _loc2_:SymbolDialogConventionInfoGeneric = new SymbolDialogConventionInfoGeneric();
         super(_loc2_);
         _convention = param1;
         _isOpen = true;
         _loc2_.txtCallerName.text = param1.callerName;
         _loc2_.txtRewards.visible = false;
         if(param1.isRunning)
         {
            _loc2_.txtDialogTitle.text = LocText.current.text("dialog/convention/title_new_event");
            _loc2_.txtInfo.text = param1.briefingText;
            _loc2_.rewards.txtRewardsCaption.text = LocText.current.text("dialog/convention/rewards_caption");
            _loc2_.rewards.txtRewardTop1.text = LocText.current.text("dialog/convention/reward_top_rank");
            _loc2_.rewards.txtRewardTop10.text = LocText.current.text("dialog/convention/reward_top_pool");
            _loc2_.rewards.txtRewardOther.text = LocText.current.text("dialog/convention/reward_other");
            _loc2_.rewards.iconTopRankItem.icon.removeAllChildren();
            _loc2_.rewards.iconTopPoolItem.icon.removeAllChildren();
            _loc2_.rewards.iconTopRankItem.icon.addChild(UriSprite.load(_convention.rewardTopRankItemIconImageUrl,30,30,false,1,null,true));
            _loc2_.rewards.iconTopPoolItem.icon.addChild(UriSprite.load(_convention.rewardTopPoolItemIconImageUrl,30,30,false,1,null,true));
            _glowFilterTopRankItem = UiItemGraphic.getItemGlowEffect(_convention.rewardTopRankItemQuality,_loc2_.rewards.iconTopRankItem);
            _glowFilterTopPoolItem = UiItemGraphic.getItemGlowEffect(_convention.rewardTopPoolItemQuality,_loc2_.rewards.iconTopPoolItem);
            _glowFilterTopRankItem.play();
            _glowFilterTopPoolItem.play();
            var _loc5_:String = "???";
            _loc2_.rewards.txtXp.text = _loc5_;
            _loc2_.rewards.txtGameCurrency.text = _loc5_;
            _tooltipGameCurrency = new UiTextTooltip(_loc2_.rewards.txtGameCurrency,LocText.current.text("dialog/convention/rewards_tooltip_game_currency"));
            _tooltipXp = new UiTextTooltip(_loc2_.rewards.txtXp,LocText.current.text("dialog/convention/rewards_tooltip_xp"));
            _tooltipTopRank = new UiTextTooltip(_loc2_.rewards.txtRewardTop1,LocText.current.text("dialog/convention/reward_top_rank_tooltip",_convention.rewardTopRankItemName));
            _tooltipTopPool = new UiTextTooltip(_loc2_.rewards.txtRewardTop10,LocText.current.text("dialog/convention/reward_top_pool_tooltip",_convention.rewardTopPoolItemName));
            _tooltipOther = new UiTextTooltip(_loc2_.rewards.txtRewardOther,LocText.current.text("dialog/convention/reward_other_tooltip"));
            _tooltipRewards = new UiTextTooltip(_loc2_.rewards.txtRewardsCaption,LocText.current.text("convention/reward_info_tooltip"));
         }
         else
         {
            _loc2_.rewards.visible = false;
            if(param1.isSuccessful)
            {
               _loc2_.txtDialogTitle.text = LocText.current.text("dialog/convention/title_successful");
               _loc2_.txtInfo.text = param1.successfulText;
            }
            else
            {
               _loc2_.txtDialogTitle.text = LocText.current.text("dialog/convention/title_failed");
               _loc2_.txtInfo.text = param1.failedText;
            }
            if(param1.isPending && User.current.character.fansTotal > 0)
            {
               _loc2_.txtRewards.visible = true;
               _loc2_.txtRewards.text = LocText.current.text("dialog/convention/rewards_processing");
            }
         }
         _btnHelp = new UiButton(_loc2_.btnHelp,LocText.current.text("general/button_help"),onClickHelp);
         _btnClose = new UiTextButton(_loc2_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
         _loc2_.conventionBannerLeft.removeAllChildren();
         var _loc4_:IDisplayObject = UriSprite.load(param1.bannerLeftUrl,130,290,true);
         _loc4_.x = -130;
         _loc2_.conventionBannerLeft.addChild(_loc4_);
         _loc2_.conventionBannerRight.removeAllChildren();
         var _loc3_:IDisplayObject = UriSprite.load(param1.bannerRightUrl,130,290,true);
         _loc2_.conventionBannerRight.addChild(_loc3_);
         _loc2_.conventionBannerLeft.tweenFrom(0.5,{
            "delay":0.5,
            "x":130.toString(),
            "ease":Quart.easeOut
         });
         _loc2_.conventionBannerLeft.tweenFrom(1,{
            "delay":0.5,
            "rotation":"-20",
            "ease":Back.easeOut
         });
         _loc2_.conventionBannerRight.tweenFrom(0.5,{
            "delay":0.5,
            "x":(-130).toString(),
            "ease":Quart.easeOut
         });
         _loc2_.conventionBannerRight.tweenFrom(1,{
            "delay":0.5,
            "rotation":"20",
            "ease":Back.easeOut
         });
      }
      
      public static function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      public static function reset() : void
      {
         _shownNewConventionIds = new Vector.<int>();
         _shownPendingConventionIds = new Vector.<int>();
         _shownFinishedConventionIds = new Vector.<int>();
      }
      
      public static function pendingHasBeenShown(param1:Convention) : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:* = _shownPendingConventionIds;
         for each(var _loc2_ in _shownPendingConventionIds)
         {
            if(_loc2_ == param1.id)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function hasBeenShown(param1:Convention) : Boolean
      {
         if(!param1.isFinished && !param1.isPending)
         {
            var _loc6_:int = 0;
            var _loc5_:* = _shownNewConventionIds;
            for each(var _loc4_ in _shownNewConventionIds)
            {
               if(_loc4_ == param1.id)
               {
                  return true;
               }
            }
            _shownNewConventionIds.push(param1.id);
            User.current.character.removeNewConventionId(param1.id);
            return false;
         }
         if(param1.isPending)
         {
            var _loc8_:int = 0;
            var _loc7_:* = _shownPendingConventionIds;
            for each(var _loc2_ in _shownPendingConventionIds)
            {
               if(_loc2_ == param1.id)
               {
                  return true;
               }
            }
            _shownPendingConventionIds.push(param1.id);
            return false;
         }
         if(param1.isFinished)
         {
            var _loc10_:int = 0;
            var _loc9_:* = _shownFinishedConventionIds;
            for each(var _loc3_ in _shownFinishedConventionIds)
            {
               if(_loc3_ == param1.id)
               {
                  return true;
               }
            }
            _shownFinishedConventionIds.push(param1.id);
            return false;
         }
         return false;
      }
      
      public static function removeFinishedConventionId(param1:int) : void
      {
         var _loc2_:int = _shownFinishedConventionIds.indexOf(param1);
         if(_loc2_ !== -1)
         {
            _shownFinishedConventionIds.splice(_loc2_,1);
         }
      }
      
      private function onClickHelp(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogTutorialConventions());
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         if(_glowFilterTopRankItem != null)
         {
            _glowFilterTopRankItem.dispose();
            _glowFilterTopRankItem = null;
         }
         if(_glowFilterTopPoolItem != null)
         {
            _glowFilterTopPoolItem.dispose();
            _glowFilterTopPoolItem = null;
         }
         _btnHelp.dispose();
         _btnHelp = null;
         if(_tooltipGameCurrency)
         {
            _tooltipGameCurrency.dispose();
            _tooltipGameCurrency = null;
         }
         if(_tooltipXp)
         {
            _tooltipXp.dispose();
            _tooltipXp = null;
         }
         if(_tooltipTopRank)
         {
            _tooltipTopRank.dispose();
            _tooltipTopRank = null;
         }
         if(_tooltipTopPool)
         {
            _tooltipTopPool.dispose();
            _tooltipTopPool = null;
         }
         if(_tooltipOther)
         {
            _tooltipOther.dispose();
            _tooltipOther = null;
         }
         if(_tooltipRewards)
         {
            _tooltipRewards.dispose();
            _tooltipRewards = null;
         }
         super.dispose();
      }
      
      override public function show() : void
      {
         super.show();
         Environment.audio.playFX("event_convention_info_phone.mp3");
      }
      
      override public function close(param1:Function = null) : void
      {
         _isOpen = false;
         super.close(param1);
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
         if(_convention.isRunning)
         {
            Environment.application.sendActionRequest("assignConvention",{"convention_id":_convention.id},handleRequests);
         }
         else if(_convention.isPending)
         {
            ViewManager.instance.baseUserPanel.syncGame();
         }
         else
         {
            Environment.panelManager.showDialog(new DialogConventionComplete(_convention));
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "assignConvention":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  if(ViewManager.instance.activePanel != "citymap" && (!User.current.character.activeQuest && User.current.character.currentQuestStage != _convention.stage || User.current.character.onMap))
                  {
                     Environment.application.sendActionRequest("setCharacterStage",{
                        "stage":_convention.stage,
                        "on_map":false
                     },handleRequests);
                  }
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "setCharacterStage":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  ViewManager.instance.showPanel("quests");
                  PanelCitymap.lastAction = 1;
               }
               else if(param1.error != "errSetCharacterStageInvalidQuestStage")
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
      
      override public function get defaultButton() : Button
      {
         return _btnClose;
      }
   }
}

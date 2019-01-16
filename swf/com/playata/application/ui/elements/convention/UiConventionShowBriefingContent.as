package com.playata.application.ui.elements.convention
{
   import com.greensock.TimelineMax;
   import com.greensock.easing.Back;
   import com.greensock.easing.Quart;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.convention.Convention;
   import com.playata.application.data.convention.ConventionShow;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.dialogs.DialogTutorialConventions;
   import com.playata.application.ui.elements.fan_foto.UiFansThermometer;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.UriSprite;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.conventions.SymbolConventionShowBriefingContentGeneric;
   
   public class UiConventionShowBriefingContent
   {
       
      
      private var _content:SymbolConventionShowBriefingContentGeneric = null;
      
      private var _convention:Convention = null;
      
      private var _npcFansBar:UiFansThermometer = null;
      
      private var _tooltipTimeLeft:UiTextTooltip = null;
      
      private var _tooltipRewards:UiTextTooltip;
      
      private var _timer:ITimer = null;
      
      private var _tooltipXp:UiTextTooltip = null;
      
      private var _bannerLeftContainer:IDisplayObjectContainer;
      
      private var _bannerRightContainer:IDisplayObjectContainer;
      
      private var _timeline:TimelineMax;
      
      private var _btnHelp:UiButton;
      
      private var _reward1:UiConventionReward;
      
      public function UiConventionShowBriefingContent(param1:SymbolConventionShowBriefingContentGeneric, param2:IDisplayObjectContainer, param3:IDisplayObjectContainer)
      {
         super();
         _content = param1;
         _bannerLeftContainer = param2;
         _bannerRightContainer = param3;
         _tooltipTimeLeft = new UiTextTooltip(_content.txtTimeLeft,LocText.current.text("dialog/convention_show_briefing/time_left_tooltip"));
         _npcFansBar = new UiFansThermometer(_content.progress,10,10);
         _tooltipXp = new UiTextTooltip(_content.txtXp,"");
         _tooltipRewards = new UiTextTooltip(_content.txtRewardsCaption,LocText.current.text("convention/reward_info_tooltip"));
         _reward1 = new UiConventionReward(_content.reward1);
         _timer = Environment.createTimer("UiConventionShowBriefingContent::timer",1000,onTimerEvent);
         _bannerLeftContainer.removeAllChildren();
         _bannerRightContainer.removeAllChildren();
         _timeline = new TimelineMax({"paused":true});
         _timeline.insert(_bannerLeftContainer.tweenFrom(0.5,{
            "x":130.toString(),
            "ease":Quart.easeOut
         }));
         _timeline.insert(_bannerLeftContainer.tweenFrom(1,{
            "rotation":"-20",
            "ease":Back.easeOut
         }));
         _timeline.insert(_bannerRightContainer.tweenFrom(0.5,{
            "x":(-130).toString(),
            "ease":Quart.easeOut
         }));
         _timeline.insert(_bannerRightContainer.tweenFrom(1,{
            "rotation":"20",
            "ease":Back.easeOut
         }));
         _btnHelp = new UiButton(param1.btnHelp,LocText.current.text("general/button_help"),onClickHelp);
         param1.addChild(_btnHelp);
      }
      
      private function onClickHelp(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogTutorialConventions());
      }
      
      public function dispose() : void
      {
         if(_timeline)
         {
            _timeline.clear();
         }
         _timer.dispose();
         _timer = null;
         _npcFansBar.dispose();
         _npcFansBar = null;
         _tooltipTimeLeft.dispose();
         _tooltipTimeLeft = null;
         _tooltipXp.dispose();
         _tooltipXp = null;
         _tooltipRewards.dispose();
         _tooltipRewards = null;
         _btnHelp.dispose();
         _btnHelp = null;
         _reward1.dispose();
         _reward1 = null;
      }
      
      public function get content() : SymbolConventionShowBriefingContentGeneric
      {
         return _content;
      }
      
      public function refresh(param1:Convention) : void
      {
         _convention = param1;
         if(_convention == null)
         {
            return;
         }
         _content.txtConventionName.text = _convention.name;
         _content.txtBriefing.text = _convention.nextShowBriefing;
         _content.txtBriefing.autoFontSize = true;
         _content.txtRequirementsCaption.text = LocText.current.text("dialog/convention_show_briefing/requirements_caption");
         _content.txtDuration.text = LocText.current.text("dialog/convention_show_briefing/requirement_time_format",TimeUtil.secondsToString(ConventionShow.showDuration));
         _content.txtRewardsCaption.text = LocText.current.text("dialog/convention_show_briefing/rewards_caption");
         _content.txtGameCurrency.text = _convention.nextShowReward;
         _content.txtXp.text = "+" + GameUtil.getXpString(_convention.ownXpRewardNextShow);
         _content.txtXpTotal.htmlText = LocText.current.text("dialog/convention_show_briefing/reward_xp_total","<font color=\"#ff00e4\">" + LocText.current.formatHugeNumber(_convention.ownXpRewardTotalNextShow) + "</font>");
         _content.txtXpTotal.x = _content.txtXp.x + _content.txtXp.textWidth + 12;
         _tooltipXp.text = LocText.current.text("dialog/convention_show_briefing/reward_xp_tooltip",GameUtil.getXpString(_convention.ownXpRewardTotalNextShow),GameUtil.getXpString(_convention.ownXpRewardNextShow));
         _reward1.setValue(1,LocText.current.text("dialog/convention_show_briefing/reward_quest_energy"),LocText.current.text("dialog/convention_show_briefing/reward_quest_energy_tooltip",GameUtil.getHighestConventionRewardValue(1)));
         refreshHitpoints();
         _bannerLeftContainer.removeAllChildren();
         var _loc3_:IDisplayObjectContainer = UriSprite.load(_convention.bannerLeftUrl,130,290,true);
         _loc3_.x = -130;
         _bannerLeftContainer.addChild(_loc3_);
         _bannerRightContainer.removeAllChildren();
         var _loc2_:IDisplayObjectContainer = UriSprite.load(_convention.bannerRightUrl,130,290,true);
         _bannerRightContainer.addChild(_loc2_);
         _timer.start();
         onTimerEvent();
      }
      
      public function showBanner() : void
      {
         _timeline.timeScale(1);
         _timeline.play();
      }
      
      public function hideBanner() : void
      {
         if(!_timeline)
         {
            return;
         }
         _timeline.timeScale(2);
         _timeline.reverse();
      }
      
      public function refreshHitpoints() : void
      {
         if(_convention == null)
         {
            return;
         }
         _npcFansBar.maximum = _convention.fansTotal;
         _npcFansBar.value = _convention.fansCurrent;
      }
      
      private function onTimerEvent() : void
      {
         if(!User.current)
         {
            if(_timer)
            {
               _timer.stop();
            }
            return;
         }
         if(_convention == null)
         {
            return;
         }
         _content.txtTimeLeft.text = TimeUtil.secondsToStringFormat(_convention.remainingSeconds,"H:m:s");
      }
   }
}

package com.playata.application.ui.elements.advertisement
{
   import com.greensock.TimelineMax;
   import com.playata.application.AppConfig;
   import com.playata.application.AppEnvironment;
   import com.playata.application.advertisment.AdvertismentUtil;
   import com.playata.application.advertisment.AppVideoAdvertisment;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.effects.HighlightEffect;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.buttons.SymbolButtonVideoAdvertismentGeneric;
   
   public class UiVideoAdvertismentButton extends Sprite
   {
       
      
      private var _button:UiButton = null;
      
      private var _type:int = 0;
      
      private var _referenceId:int = 0;
      
      private var _videoAdvertismentId:int = 0;
      
      private var _tooltipText:String = "";
      
      private var _timer:ITimer;
      
      private var _rawContent:SymbolButtonVideoAdvertismentGeneric;
      
      private var _iconHighlight:HighlightEffect;
      
      private var _animationTimeline:TimelineMax = null;
      
      public function UiVideoAdvertismentButton(param1:SymbolButtonVideoAdvertismentGeneric)
      {
         super();
         _rawContent = param1;
         _button = new UiButton(param1,"",onClick);
         this.addChild(_button);
         _button.visible = false;
         _button.textTooltip.requestTextFunction = requestTooltip;
         _timer = Environment.createTimer("UiVideoAdvertismentButton::timer",1000,onUpdateRemainingTime);
         _iconHighlight = new HighlightEffect(_rawContent.icon.highlight,1.3,1.3,true);
         reset();
      }
      
      override public function dispose() : void
      {
         _iconHighlight.dispose();
         this.removeChild(_button);
         _button.dispose();
         _button = null;
         _timer.dispose();
         _timer = null;
         super.dispose();
      }
      
      public function get content() : UiButton
      {
         return _button;
      }
      
      public function reset() : void
      {
         if(_animationTimeline)
         {
            _animationTimeline.kill();
            _animationTimeline = null;
         }
         _timer.stop();
      }
      
      public function refresh(param1:String, param2:int, param3:int) : void
      {
         _button.visible = false;
         _timer.stop();
         if(!param3)
         {
            return;
         }
         _type = param2;
         var _loc4_:Boolean = AppVideoAdvertisment.isAvailable(param2,param3);
         if(_loc4_)
         {
            AdvertismentUtil.checkVideoAvailability(onHasVideoAdvertismentCompleted);
         }
         _tooltipText = param1;
         _button.tooltip = _tooltipText;
         _referenceId = param3;
      }
      
      private function onHasVideoAdvertismentCompleted(param1:Boolean) : void
      {
         videoAvailable = param1;
         if(videoAvailable)
         {
            _button.visible = true;
            _button.alpha = 0;
            if(!_animationTimeline)
            {
               _animationTimeline = new TimelineMax({"paused":true});
               _animationTimeline.addLabel("UiVideoAdvertisment");
               _animationTimeline.set(_rawContent,{"alpha":0},0);
               _animationTimeline.call(function():void
               {
                  _iconHighlight.unhighlight(true);
               },null,0);
               _animationTimeline.fromTo(_rawContent,0.5,{
                  "alpha":0,
                  "immediateRender":false
               },{"alpha":1},3);
               _animationTimeline.call(function():void
               {
                  _iconHighlight.loop = true;
                  _iconHighlight.highlight();
               },null,3);
               _animationTimeline.set(_rawContent,{"rotation":4.3},4.4);
               _animationTimeline.set(_rawContent,{"rotation":-5.1},4.5);
               _animationTimeline.set(_rawContent,{"rotation":4.3},4.6);
               _animationTimeline.set(_rawContent,{"rotation":0},4.7);
               _animationTimeline.set(_rawContent,{"rotation":0},4.7);
               _animationTimeline.call(function():void
               {
                  _animationTimeline.gotoAndPlay(3.5);
               },null,6.5);
               _animationTimeline.addLabel("disabled",7);
               _animationTimeline.set(_rawContent,{"alpha":0},7);
               _animationTimeline.call(function():void
               {
                  _iconHighlight.loop = false;
                  _iconHighlight.highlight(true);
               },null,7);
               _animationTimeline.fromTo(_rawContent,0.5,{
                  "alpha":0,
                  "immediateRender":false
               },{"alpha":1},10);
            }
            if(getRemainingCooldown() > 0)
            {
               _button.buttonEnabled = false;
               _animationTimeline.gotoAndPlay("disabled");
               _timer.interval = getRemainingCooldown() * 1000;
               _timer.start();
            }
            else
            {
               _animationTimeline.gotoAndPlay(0);
               _timer.stop();
               _button.buttonEnabled = true;
            }
         }
      }
      
      private function onClick(param1:InteractionEvent) : void
      {
         reset();
         ViewManager.instance.tutorialArrow.hide();
         AdvertismentUtil.playVideo(_type,_referenceId,onVideoCompleted);
      }
      
      private function onVideoCompleted(param1:Boolean, param2:Object) : void
      {
         _button.visible = false;
      }
      
      private function onUpdateRemainingTime() : void
      {
         if(!User.current)
         {
            _timer.stop();
            return;
         }
         AdvertismentUtil.checkVideoAvailability(onHasVideoAdvertismentCompleted);
      }
      
      private function requestTooltip() : String
      {
         var _loc2_:* = null;
         var _loc1_:String = "";
         if(getRemainingCooldown() > 0 && AppConfig.videoAdvertismentCooldownTooltipEnabled)
         {
            _loc2_ = TimeUtil.secondsToString(getRemainingCooldown());
            _loc1_ = LocText.current.text("dialog/video_advertisment/cooldown_tooltip",_loc2_);
         }
         return _tooltipText + _loc1_;
      }
      
      private function getRemainingCooldown() : int
      {
         return AppVideoAdvertisment.getLastShownAdvertismentTimestamp(_type) + AppEnvironment.appPlatform.getAdvertismentInfoInt("video_advertisment_blocked_time__" + _type.toString(),3600) - TimeUtil.now;
      }
      
      public function get videoAdvertismentId() : int
      {
         return _videoAdvertismentId;
      }
      
      public function get hasPendingVideo() : Boolean
      {
         return _button.visible;
      }
   }
}

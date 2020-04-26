package com.playata.application.ui.elements.citymap
{
   import com.greensock.easing.Back;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.citymap.animations.ICitymapButtonClouds;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.panels.PanelCitymap;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   
   public class UiCitymapDungeonButton
   {
       
      
      private var _button:IDisplayObjectContainer;
      
      private var _clouds:ICitymapButtonClouds;
      
      private var _dungeonId:String;
      
      private var _onClick:Function;
      
      private var _locked:Boolean = true;
      
      private var _clickArea:InteractiveDisplayObject;
      
      private var _tooltip:UiTextTooltip;
      
      private var _timer:ITimer;
      
      private var _onTimeUp:Function;
      
      public function UiCitymapDungeonButton(param1:IDisplayObjectContainer, param2:ICitymapButtonClouds, param3:String, param4:Function, param5:Function)
      {
         super();
         _button = param1;
         _clouds = param2;
         _dungeonId = param3;
         _onClick = param4;
         _onTimeUp = param5;
         _clickArea = new InteractiveDisplayObject(param1.getChildByName("clickArea"));
         _tooltip = new UiTextTooltip(_clickArea,LocText.current.text("screen/citymap/dungeon_tooltip_locked",LocText.current.formatHugeNumber(GameUtil.getDungeonUnlockFansCount(_dungeonId)),LocText.current.text("dungeon/" + _dungeonId + "/name")));
         _clickArea.onClick.add(buttonClickedHandler);
         _clickArea.onInteractionOver.add(overHandler);
         _clickArea.onInteractionOut.add(outHandler);
         _timer = Environment.createTimer("UiCitymapDungeonButton::timer",1000,onTimerEvent);
      }
      
      public function outHandler(param1:InteractionEvent) : void
      {
         _button.getChildByName("locationGraphic").tweenTo(0.2,{
            "ease":Back.easeIn,
            "scaleX":1,
            "scaleY":1,
            "rotation":0
         });
         _button.getChildByName("shadow").tweenTo(0.2,{
            "ease":Back.easeIn,
            "scaleX":1,
            "scaleY":1,
            "rotation":0
         });
         _button.getChildByName("locationGraphic").tweenTo(0.3,{"glowFilter":{
            "color":16777215,
            "alpha":1,
            "blurX":0,
            "blurY":0,
            "strength":0,
            "remove":true
         }});
      }
      
      public function overHandler(param1:InteractionEvent) : void
      {
         var _loc2_:* = 2.5;
         _button.getChildByName("locationGraphic").tweenTo(0.4,{
            "ease":Back.easeOut,
            "scaleX":1.1,
            "scaleY":1.1,
            "rotation":_loc2_
         });
         _button.getChildByName("shadow").tweenTo(0.4,{
            "ease":Back.easeOut,
            "scaleX":1.05,
            "scaleY":1.05,
            "rotation":-_loc2_ * 0.5
         });
         _button.getChildByName("locationGraphic").tweenTo(0.6,{
            "glowFilter":{
               "color":16777215,
               "alpha":1,
               "blurX":20,
               "blurY":20,
               "strength":1.5
            },
            "yoyo":true,
            "repeat":-1
         });
      }
      
      private function buttonClickedHandler(param1:InteractionEvent) : void
      {
      }
      
      public function refresh() : void
      {
         var _loc1_:Character = User.current.character;
         var _loc2_:int = GameUtil.getDungeonUnlockFansCount(_dungeonId);
         _locked = _loc1_.fansTotal < _loc2_;
         if(_locked || PanelCitymap.unlockedDungeon == _dungeonId)
         {
            _clouds.locked();
         }
         else
         {
            _clouds.available();
         }
         if(_loc1_.currentDungeon && _loc1_.currentDungeon.identifier == _dungeonId && _loc1_.currentDungeon.remainingSeconds > 0)
         {
            _timer.start();
            onTimerEvent();
            _button.getChildByName("time").visible = true;
         }
         else
         {
            _timer.stop();
            if(_button.getChildByName("time").visible)
            {
               ViewManager.instance.baseUserPanel.onSynGame();
            }
            _button.getChildByName("time").visible = false;
         }
         if(!_locked)
         {
            _tooltip.text = LocText.current.text("dungeon/" + _dungeonId + "/name");
         }
         else
         {
            _tooltip.text = LocText.current.text("screen/citymap/dungeon_tooltip_locked",LocText.current.formatHugeNumber(GameUtil.getDungeonUnlockFansCount(_dungeonId)),LocText.current.text("dungeon/" + _dungeonId + "/name"));
         }
      }
      
      public function playNewDungeonAnimation() : void
      {
         Environment.audio.playFX("goal_collected.mp3");
         _clouds.showing();
         PanelCitymap.unlockedDungeon = "";
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
         var _loc2_:Character = User.current.character;
         if(_loc2_.currentDungeon == null)
         {
            return;
         }
         var _loc3_:IDisplayObjectContainer = _button.getChildByName("time") as IDisplayObjectContainer;
         var _loc1_:ILabel = _loc3_.getChildByName("txtTimeLeft") as ILabel;
         _loc1_.text = TimeUtil.secondsToStringFormat(_loc2_.currentDungeon.remainingSeconds,"H:m:s");
         if(_loc2_.currentDungeon.remainingSeconds <= 0)
         {
            refresh();
            _onTimeUp();
         }
      }
      
      public function stopTimer() : void
      {
         _timer.stop();
      }
   }
}

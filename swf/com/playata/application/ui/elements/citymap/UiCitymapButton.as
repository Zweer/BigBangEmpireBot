package com.playata.application.ui.elements.citymap
{
   import com.greensock.easing.Back;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.citymap.animations.ICitymapButtonClouds;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.panels.PanelCitymap;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   
   public class UiCitymapButton
   {
       
      
      private var _button:IDisplayObjectContainer;
      
      private var _clouds:ICitymapButtonClouds;
      
      private var _stage:int;
      
      private var _onClick:Function;
      
      private var _locked:Boolean = true;
      
      private var _clickArea:InteractiveDisplayObject;
      
      private var _tooltip:UiTextTooltip;
      
      private var _isCustomStage:Boolean;
      
      public function UiCitymapButton(param1:IDisplayObjectContainer, param2:ICitymapButtonClouds, param3:int, param4:Function, param5:Boolean = false)
      {
         super();
         _button = param1;
         _clouds = param2;
         _stage = param3;
         _onClick = param4;
         _isCustomStage = param5;
         _clickArea = new InteractiveDisplayObject(param1.getChildByName("clickArea"));
         _tooltip = new UiTextTooltip(_clickArea,LocText.current.text("screen/citymap/button_tooltip_locked",GameUtil.getQuestStageUnlockLevel(_stage),LocText.current.text("dialog/stage_unlocked/stage" + _stage + "_title")));
         _tooltip.forceShowOnMobile = true;
         _clickArea.onClick.add(buttonClickedHandler);
         _clickArea.onInteractionOver.add(overHandler);
         _clickArea.onInteractionOut.add(outHandler);
      }
      
      public function dispose() : void
      {
      }
      
      public function outHandler(param1:InteractionEvent) : void
      {
         if(!_locked)
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
      }
      
      public function overHandler(param1:InteractionEvent) : void
      {
         var _loc2_:* = NaN;
         if(!_locked)
         {
            _loc2_ = 2.5;
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
      }
      
      private function buttonClickedHandler(param1:InteractionEvent) : void
      {
         if(!_locked)
         {
            _onClick(_stage);
         }
      }
      
      public function refresh() : void
      {
         var _loc1_:int = 0;
         if(_isCustomStage)
         {
            _locked = !GameUtil.isCustomStageUnlocked(User.current.character,_stage);
         }
         else
         {
            _loc1_ = User.current.character.maxQuestStage;
            _locked = _loc1_ < _stage;
         }
         if(_locked || _loc1_ == _stage && PanelCitymap.unlockedStage == _stage)
         {
            _clouds.locked();
         }
         else
         {
            _clouds.available();
         }
         if(!_locked)
         {
            _tooltip.text = LocText.current.text("dialog/stage_unlocked/stage" + _stage + "_title");
         }
         else
         {
            _tooltip.text = LocText.current.text("screen/citymap/button_tooltip_locked",GameUtil.getQuestStageUnlockLevel(_stage),LocText.current.text("dialog/stage_unlocked/stage" + _stage + "_title"));
         }
         if(!_locked && Environment.info.isTouchScreen)
         {
            _tooltip.text = "";
         }
      }
      
      public function playNewLocationAnimation() : void
      {
         Environment.audio.playFX("goal_collected.mp3");
         _clouds.showing();
         PanelCitymap.unlockedStage = 0;
      }
   }
}

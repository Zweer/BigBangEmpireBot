package com.playata.application.ui.elements.fan_foto
{
   import com.greensock.easing.Bounce;
   import com.greensock.easing.Power2;
   import com.playata.application.data.fan_foto.FanFoto;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogFanFotoUnlockFoto;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.fan_foto.SymbolFanFotoProgressBarGeneric;
   
   public class UiFanFotoProgressBar extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolFanFotoProgressBarGeneric;
      
      private var _animationTarget:IDisplayObject;
      
      private var _btnPlus:UiButton;
      
      private var _barTooltip:UiTextTooltip;
      
      private var _iconNotRandomTooltip:UiTextTooltip;
      
      private var _iconRandom25Tooltip:UiTextTooltip;
      
      private var _iconRandomTooltip:UiTextTooltip;
      
      public function UiFanFotoProgressBar(param1:SymbolFanFotoProgressBarGeneric, param2:Boolean = true)
      {
         _content = param1;
         super(_content);
         _content.txtValue.text = "";
         _barTooltip = new UiTextTooltip(_content.mouseLayer,LocText.current.text("panel_quests/fan_foto_progress_bar/tooltip_bar"));
         _iconRandomTooltip = new UiTextTooltip(_content.iconRandom,"");
         _iconRandom25Tooltip = new UiTextTooltip(_content.iconRandom25,"");
         _iconNotRandomTooltip = new UiTextTooltip(_content.iconNotRandom,"");
         if(param2)
         {
            onClick.add(handleClick);
            _content.mouseLayer.applySettings(new TypedObject({"useHandCursor":true}));
            _content.iconRandom.applySettings(new TypedObject({"useHandCursor":true}));
            _content.iconRandom25.applySettings(new TypedObject({"useHandCursor":true}));
            _content.iconNotRandom.applySettings(new TypedObject({"useHandCursor":true}));
            _btnPlus = new UiButton(_content.btnPlus,LocText.current.text("panel_quests/fan_foto_progress_bar/tooltip_bar"),onClickPlus);
         }
         else
         {
            _content.btnPlus.visible = false;
         }
      }
      
      override public function set visible(param1:Boolean) : void
      {
         _content.visible = param1;
         if(!_content.visible)
         {
            _animationTarget = null;
         }
      }
      
      override public function dispose() : void
      {
         visible = false;
         if(_btnPlus)
         {
            _btnPlus.dispose();
            _btnPlus = null;
         }
         _content = null;
         _barTooltip.dispose();
         _iconRandomTooltip.dispose();
         _iconRandom25Tooltip.dispose();
         _iconNotRandomTooltip.dispose();
         _barTooltip = null;
         _iconRandomTooltip = null;
         _iconRandom25Tooltip = null;
         _iconNotRandomTooltip = null;
         super.dispose();
      }
      
      private function onClickPlus(param1:InteractionEvent) : void
      {
         openUnlockDialog();
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
         openUnlockDialog();
      }
      
      private function openUnlockDialog() : void
      {
         User.current.character.setTutorialFlag("fan_foto_resource");
         ViewManager.instance.tutorialArrow.hide();
         Environment.panelManager.showDialog(new DialogFanFotoUnlockFoto());
      }
      
      public function refresh(param1:FanFoto) : void
      {
         if(!param1 || !User.current.character.hasTutorialFlag("fan_foto_resource") && param1.currentResources <= 0)
         {
            visible = false;
            return;
         }
         if(!User.current.character.hasTutorialFlag("fan_foto_resource") && param1.currentResources > 0)
         {
            ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/fan_foto_resource_arrow_text"),"right_front","up",_content.x + _content.width / 2,_content.y + _content.height,1.5,0,true);
         }
         visible = true;
         var _loc4_:int = param1.getResourceCost(1);
         var _loc2_:int = param1.getResourceCost(2);
         var _loc3_:int = param1.getResourceCost(3);
         _content.txtValue.text = LocText.current.formatHugeNumber(param1.currentResources) + "/" + LocText.current.formatHugeNumber(_loc3_);
         _content.txtValue.autoFontSize = true;
         _content.fill.maske.width = _content.fill.width * Math.min(param1.currentResources / _loc3_,1);
         _animationTarget = null;
         if(param1.currentResources >= _loc3_)
         {
            _animationTarget = _content.iconNotRandom;
         }
         else if(param1.currentResources >= _loc2_)
         {
            _animationTarget = _content.iconRandom25;
         }
         else if(param1.currentResources >= _loc4_)
         {
            _animationTarget = _content.iconRandom;
         }
         _iconRandomTooltip.text = LocText.current.text("panel_quests/fan_foto_progress_bar/tooltip_icon_random",_loc4_);
         _iconRandom25Tooltip.text = LocText.current.text("panel_quests/fan_foto_progress_bar/tooltip_icon_random25",_loc2_);
         _iconNotRandomTooltip.text = LocText.current.text("panel_quests/fan_foto_progress_bar/tooltip_icon_not_random",_loc3_);
         animate();
      }
      
      private function animate() : void
      {
         if(!_animationTarget || _animationTarget.isTweening)
         {
            return;
         }
         _animationTarget.tweenTo(0.5,{
            "y":_animationTarget.y - 20,
            "ease":Power2.easeOut
         });
         _animationTarget.tweenTo(1,{
            "y":_animationTarget.y,
            "ease":Bounce.easeOut,
            "delay":0.5,
            "onComplete":animationComplete
         });
      }
      
      private function animationComplete() : void
      {
         if(!_animationTarget)
         {
            return;
         }
         Runtime.delayFunction(animate,5);
      }
   }
}

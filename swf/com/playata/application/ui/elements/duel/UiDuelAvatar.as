package com.playata.application.ui.elements.duel
{
   import com.greensock.easing.Back;
   import com.greensock.easing.Sine;
   import com.playata.application.ui.elements.avatar.ICharacterTooltipProvider;
   import com.playata.application.ui.elements.avatar.UiAvatarImage;
   import com.playata.application.ui.elements.avatar.UiCharacterTooltip;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.base.SymbolAvatarContainerGeneric;
   
   public class UiDuelAvatar extends InteractiveDisplayObject
   {
      
      public static const LEFT:int = 0;
      
      public static const RIGHT:int = 1;
      
      private static const MIN_SCALE:Number = 0.65;
      
      private static const MAX_SCALE:Number = 0.72;
      
      private static const SCALE_OVER:Number = 0.8;
      
      private static const SCALE_SELECTED:Number = 1;
      
      private static const MAX_ROTATION:Number = 20;
      
      private static const OVER_OUT_ROTATION:Number = 5;
       
      
      private var _content:SymbolAvatarContainerGeneric;
      
      private var _side:int;
      
      private var _selected:Boolean;
      
      private var _callbackClick:Function;
      
      private var _callbackDoubleClick:Function;
      
      private var _callbackOver:Function;
      
      private var _callbackOut:Function;
      
      private var _tooltip:UiCharacterTooltip;
      
      private var _avatarImage:UiAvatarImage;
      
      public function UiDuelAvatar(param1:SymbolAvatarContainerGeneric, param2:Function, param3:Function, param4:Function, param5:Function, param6:int)
      {
         _content = param1;
         super(_content);
         _side = param6;
         _callbackClick = param2;
         _callbackDoubleClick = param3;
         _callbackOver = param4;
         _callbackOut = param5;
         onInteractionOver.add(onOver);
         onInteractionOut.add(onOut);
         onClick.add(handleClick);
         onDoubleClick.add(handleDoubleClick);
         _tooltip = new UiCharacterTooltip(this);
         if(_side == 1)
         {
            _tooltip.positionType = 2;
         }
         _avatarImage = new UiAvatarImage(param1.avatarImage,false);
      }
      
      private function handleDoubleClick(param1:InteractionEvent) : void
      {
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
      }
      
      private function onOut(param1:InteractionEvent) : void
      {
         if(_selected)
         {
            return;
         }
         var _loc3_:Number = randomScale();
         var _loc2_:String = "5";
         if(_content.rotation > 20 - 5 || _content.rotation > -20 + 5 && NumberUtil.randomBool)
         {
            _loc2_ = "-5";
         }
         _content.tweenTo(0.5,{
            "scaleX":_loc3_,
            "scaleY":_loc3_,
            "shortRotation":{"rotation":_loc2_},
            "ease":Back.easeOut
         });
         _content.tweenTo(0.5,{"glowFilter":{
            "color":16711908,
            "blurX":0,
            "blurY":0,
            "remove":true
         }});
         _content.parent.setChildIndex(_content,Math.floor(Math.random() * (_content.parent.numChildren - 1)));
         §§push(_callbackOut(this));
      }
      
      private function onOver(param1:InteractionEvent) : void
      {
         if(_selected)
         {
            return;
         }
         _content.tweenTo(0.5,{
            "scaleX":0.8,
            "scaleY":0.8,
            "shortRotation":{"rotation":(_content.rotation < 0?"5":"-5")},
            "ease":Back.easeOut,
            "onComplete":startWobble
         });
         _content.parent.addChild(_content);
         §§push(_callbackOver(this));
      }
      
      private function startWobble() : void
      {
         _content.tweenTo(1,{
            "scaleX":"-.05",
            "scaleY":"-.05",
            "ease":Sine.easeInOut,
            "yoyo":true,
            "repeat":-1
         });
      }
      
      public function hide() : void
      {
         _content.visible = false;
      }
      
      public function show(param1:String) : void
      {
         _avatarImage.showWithSettings(param1);
         _content.visible = true;
         _content.rotation = randomRotation();
         var _loc2_:* = randomScale();
         _content.scaleY = _loc2_;
         _content.scaleX = _loc2_;
         _content.parent.setChildIndex(_content,Math.floor(Math.random() * _content.parent.numChildren));
      }
      
      public function set highlighted(param1:Boolean) : void
      {
         if(param1)
         {
            onOver(null);
         }
         else
         {
            onOut(null);
         }
      }
      
      public function set selected(param1:Boolean) : void
      {
         if(param1 == _selected)
         {
            return;
         }
         _selected = param1;
         if(param1)
         {
            _content.tweenTo(0.5,{
               "scaleX":1,
               "scaleY":1,
               "rotation":(_content.rotation < 0?"5":"-5"),
               "ease":Back.easeOut
            });
            _content.tweenTo(0.5,{"glowFilter":{
               "color":16711908,
               "alpha":1,
               "blurX":10,
               "blurY":10
            }});
            _content.parent.addChild(_content);
         }
         else
         {
            onOut(null);
         }
      }
      
      public function get selected() : Boolean
      {
         return _selected;
      }
      
      private function randomRotation() : Number
      {
         return Math.random() * 2 * 20 - 20;
      }
      
      private function randomScale() : Number
      {
         return 0.65 + Math.random() * (0.72 - 0.65);
      }
      
      override public function dispose() : void
      {
         _tooltip.dispose();
         _tooltip = null;
         super.dispose();
      }
      
      public function setTooltipText(param1:String, param2:ICharacterTooltipProvider, param3:String) : void
      {
         _tooltip.setText(param1,param2,param3,false,true);
      }
   }
}

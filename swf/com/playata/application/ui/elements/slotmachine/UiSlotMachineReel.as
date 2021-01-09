package com.playata.application.ui.elements.slotmachine
{
   import com.greensock.easing.Back;
   import com.greensock.easing.Linear;
   import com.greensock.plugins.BlurFilterPlugin;
   import com.greensock.plugins.TweenPlugin;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.NumberUtil;
   import visuals.ui.elements.bonus.SymbolSlotMachineReelGeneric;
   import visuals.ui.elements.slotmachine.SymbolSlotMachineReelAllGeneric;
   
   public class UiSlotMachineReel
   {
       
      
      private const REEL_ITEM_HEIGHT:Number = 45;
      
      private const SPEED_FACTOR:Number = 0.2;
      
      private var _content:SymbolSlotMachineReelAllGeneric = null;
      
      private var _index:int = 1;
      
      private var _pendingStop:Boolean = false;
      
      private var _onStopped:Function = null;
      
      private var _stopped:Boolean = true;
      
      public function UiSlotMachineReel(param1:SymbolSlotMachineReelAllGeneric, param2:int = 1)
      {
         super();
         _content = param1;
         TweenPlugin.activate([BlurFilterPlugin]);
         setSymbol(param2,_content.energyTop,6);
         setSymbol(param2,_content.coins,1);
         setSymbol(param2,_content.item,2);
         setSymbol(param2,_content.booster,3);
         setSymbol(param2,_content.statPoints,4);
         setSymbol(param2,_content.xp,5);
         setSymbol(param2,_content.energy,6);
         setSymbol(param2,_content.coinsBottom,1);
         stop(NumberUtil.randomInt(1,6),true);
      }
      
      public function dispose() : void
      {
      }
      
      public function spin() : void
      {
         _stopped = false;
         _content.tweenTo(2,{
            "delay":NumberUtil.randomNumber(0,1),
            "y":45 * 2,
            "ease":Back.easeIn,
            "onComplete":spinRepeatedly
         });
      }
      
      public function stop(param1:int, param2:Boolean, param3:Function = null) : void
      {
         _index = param1;
         if(param2)
         {
            _content.y = symbolY(_index);
            if(param3 !== null)
            {
               param3();
            }
            return;
         }
         _pendingStop = true;
         _onStopped = param3;
      }
      
      public function get isStopped() : Boolean
      {
         return _stopped;
      }
      
      private function spinRepeatedly() : void
      {
         _content.y = endOfReelY;
         var _loc1_:TypedObject = new TypedObject({
            "y":symbolY(1),
            "ease":Linear.easeNone,
            "repeat":2,
            "onComplete":checkStopSpinning
         });
         _loc1_.setData("blurFilter",{"blurY":2});
         _content.tweenTo(getSpinTime(1),_loc1_);
      }
      
      private function checkStopSpinning() : void
      {
         if(!_pendingStop)
         {
            spinRepeatedly();
         }
         else
         {
            stopSpinning();
         }
      }
      
      private function stopSpinning() : void
      {
         var spinStopped:Function = function():void
         {
            _stopped = true;
            if(!§§pop())
            {
               _onStopped();
            }
         };
         _content.y = endOfReelY;
         _pendingStop = false;
         var tweenData:TypedObject = new TypedObject({
            "y":symbolY(_index),
            "ease":Back.easeOut,
            "onComplete":spinStopped
         });
         tweenData.setData("blurFilter",{
            "blurY":1,
            "remove":true
         });
         _content.tweenTo(2,tweenData);
      }
      
      private function getSpinTime(param1:int, param2:Boolean = false) : Number
      {
         if(param2)
         {
            return param1 / 3 * 0.2;
         }
         return (6 - param1) / 3 * 0.2;
      }
      
      private function symbolY(param1:int) : int
      {
         return -((param1 - 2) * 45);
      }
      
      private function get endOfReelY() : int
      {
         return -225;
      }
      
      private function setSymbol(param1:int, param2:SymbolSlotMachineReelGeneric, param3:int) : void
      {
         param2.coins.visible = param3 == 1;
         param2.item.visible = param3 == 2;
         param2.booster.visible = param3 == 3;
         param2.statPoints.visible = param3 == 4;
         param2.xp.visible = param3 == 5;
         param2.energy.visible = param3 == 6;
      }
   }
}

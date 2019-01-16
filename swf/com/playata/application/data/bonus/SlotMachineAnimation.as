package com.playata.application.data.bonus
{
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.timer.ITimer;
   import visuals.ui.panels.SymbolPanelSlotMachineGeneric;
   
   public class SlotMachineAnimation
   {
       
      
      private var _panel:SymbolPanelSlotMachineGeneric;
      
      private var _girlsTimer:ITimer;
      
      private var _lightsRedTimer:ITimer;
      
      private var _lightsWhiteTimer:ITimer;
      
      private var _xxxTimer:ITimer;
      
      private var _jackpotTimer:ITimer;
      
      private var _type:int = 0;
      
      public function SlotMachineAnimation()
      {
         super();
      }
      
      public function setup(param1:SymbolPanelSlotMachineGeneric) : void
      {
         _panel = param1;
         _girlsTimer = Environment.createTimer("SlotMachineAnimation::girlsTimer",500,onGirlsTimer);
         _lightsRedTimer = Environment.createTimer("SlotMachineAnimation::girlsTimer",250,onLightsRedTimer);
         _lightsWhiteTimer = Environment.createTimer("SlotMachineAnimation::girlsTimer",125,onLightsWhiteTimer);
         _xxxTimer = Environment.createTimer("SlotMachineAnimation::girlsTimer",1000,onXXXTimer);
         _jackpotTimer = Environment.createTimer("SlotMachineAnimation::girlsTimer",250,onJackpotTimer);
         hideAll();
      }
      
      public function dispose() : void
      {
         _girlsTimer.dispose();
         _lightsRedTimer.dispose();
         _lightsWhiteTimer.dispose();
         _xxxTimer.dispose();
         _jackpotTimer.dispose();
      }
      
      public function hideAll() : void
      {
         _panel.slotmachine.girls.girlLeft.visible = false;
         _panel.slotmachine.girls.girlRight.visible = false;
         _panel.slotmachine.lightRed.lampLeft.visible = false;
         _panel.slotmachine.lightRed.lampRight.visible = false;
         _panel.slotmachine.lightWhite.left.visible = false;
         _panel.slotmachine.lightWhite.right.visible = false;
         _panel.slotmachine.xxx.left.visible = false;
         _panel.slotmachine.xxx.middle.visible = false;
         _panel.slotmachine.xxx.right.visible = false;
         _panel.slotmachine.jackpot.visible = false;
      }
      
      public function animate(param1:int) : void
      {
         _type = param1;
         switch(int(_type))
         {
            case 0:
               stop();
               break;
            case 1:
            case 2:
            case 3:
               _girlsTimer.start();
               _lightsRedTimer.start();
               _lightsWhiteTimer.start();
               _xxxTimer.start();
               _jackpotTimer.start();
         }
      }
      
      public function stop() : void
      {
         _girlsTimer.stop();
         _lightsRedTimer.stop();
         _lightsWhiteTimer.stop();
         _xxxTimer.stop();
         _jackpotTimer.stop();
         hideAll();
      }
      
      private function onGirlsTimer() : void
      {
         switch(int(_type) - 1)
         {
            case 0:
               _panel.slotmachine.girls.girlLeft.visible = _xxxTimer.currentCount % 3 == 0 || _xxxTimer.currentCount % 3 == 1;
               _panel.slotmachine.girls.girlRight.visible = _xxxTimer.currentCount % 3 == 1 || _xxxTimer.currentCount % 3 == 2;
               break;
            case 1:
               _panel.slotmachine.girls.girlLeft.visible = _xxxTimer.currentCount % 2 == 1;
               _panel.slotmachine.girls.girlRight.visible = _xxxTimer.currentCount % 2 == 1;
               break;
            case 2:
               _panel.slotmachine.girls.girlLeft.visible = _girlsTimer.currentCount % 2 == 0;
               _panel.slotmachine.girls.girlRight.visible = _girlsTimer.currentCount % 2 == 0;
         }
      }
      
      private function onXXXTimer() : void
      {
         switch(int(_type) - 1)
         {
            case 0:
               _panel.slotmachine.xxx.left.visible = _xxxTimer.currentCount % 3 == 0;
               _panel.slotmachine.xxx.middle.visible = _xxxTimer.currentCount % 3 == 1;
               _panel.slotmachine.xxx.right.visible = _xxxTimer.currentCount % 3 == 2;
               break;
            case 1:
               _panel.slotmachine.xxx.left.visible = _xxxTimer.currentCount % 2 == 0;
               _panel.slotmachine.xxx.middle.visible = _xxxTimer.currentCount % 2 == 0;
               _panel.slotmachine.xxx.right.visible = _xxxTimer.currentCount % 2 == 0;
               break;
            case 2:
               _panel.slotmachine.xxx.left.visible = _xxxTimer.currentCount % 2 == 0;
               _panel.slotmachine.xxx.middle.visible = _xxxTimer.currentCount % 2 == 1;
               _panel.slotmachine.xxx.right.visible = _xxxTimer.currentCount % 2 == 0;
         }
      }
      
      private function onLightsRedTimer() : void
      {
         var _loc1_:int = 0;
         switch(int(_type) - 1)
         {
            case 0:
               _loc1_ = _lightsRedTimer.currentCount % 8;
               _panel.slotmachine.lightRed.lampLeft.visible = _loc1_ <= 1;
               _panel.slotmachine.lightRed.lampRight.visible = _loc1_ >= 2 && _loc1_ <= 3;
               break;
            case 1:
               _panel.slotmachine.lightRed.lampLeft.visible = _lightsRedTimer.currentCount % 2 == 0;
               _panel.slotmachine.lightRed.lampRight.visible = _lightsRedTimer.currentCount % 2 == 1;
               break;
            case 2:
               _panel.slotmachine.lightRed.lampLeft.visible = _lightsRedTimer.currentCount % 2 == 0;
               _panel.slotmachine.lightRed.lampRight.visible = _lightsRedTimer.currentCount % 2 == 0;
         }
      }
      
      private function onLightsWhiteTimer() : void
      {
         var _loc1_:int = 0;
         switch(int(_type) - 1)
         {
            case 0:
               _loc1_ = _lightsRedTimer.currentCount % 18;
               _panel.slotmachine.lightWhite.right.visible = _loc1_ >= 4 && _loc1_ <= 5;
               _panel.slotmachine.lightWhite.left.visible = _loc1_ >= 6 && _loc1_ <= 7;
               break;
            case 1:
               _panel.slotmachine.lightWhite.left.visible = _lightsWhiteTimer.currentCount % 2 == 0;
               _panel.slotmachine.lightWhite.right.visible = _lightsWhiteTimer.currentCount % 2 == 1;
               break;
            case 2:
               _panel.slotmachine.lightWhite.left.visible = _lightsWhiteTimer.currentCount % 2 == 0;
               _panel.slotmachine.lightWhite.right.visible = _lightsWhiteTimer.currentCount % 2 == 0;
         }
      }
      
      private function onJackpotTimer() : void
      {
         switch(int(_type) - 1)
         {
            case 0:
            case 1:
               _panel.slotmachine.jackpot.visible = _jackpotTimer.currentCount % 15 >= 10;
               break;
            case 2:
               _panel.slotmachine.jackpot.visible = _jackpotTimer.currentCount % 2 == 0;
         }
      }
   }
}

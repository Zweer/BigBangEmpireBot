package com.playata.application.ui.elements.slotmachine
{
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Runtime;
   import visuals.ui.elements.bonus.SymbolSlotMachineGeneric;
   
   public class UiSlotMachine
   {
       
      
      private var _content:SymbolSlotMachineGeneric = null;
      
      private var _reel1:UiSlotMachineReel = null;
      
      private var _reel2:UiSlotMachineReel = null;
      
      private var _reel3:UiSlotMachineReel = null;
      
      public function UiSlotMachine(param1:SymbolSlotMachineGeneric)
      {
         super();
         _content = param1;
         _reel1 = new UiSlotMachineReel(_content.reel1,1);
         _reel2 = new UiSlotMachineReel(_content.reel2,2);
         _reel3 = new UiSlotMachineReel(_content.reel3,3);
      }
      
      public function dispose() : void
      {
         _reel1.dispose();
         _reel2.dispose();
         _reel3.dispose();
      }
      
      public function startSpin() : void
      {
         Environment.audio.playFX("casino_spin.mp3");
         _reel1.spin();
         _reel2.spin();
         _reel3.spin();
      }
      
      public function stopSpin(param1:int, param2:int, param3:int, param4:Boolean, param5:Function = null) : void
      {
         slot1 = param1;
         slot2 = param2;
         slot3 = param3;
         instant = param4;
         onStopped = param5;
         var reelStopped:Function = function():void
         {
            if(_reel1.isStopped && _reel2.isStopped && _reel3.isStopped)
            {
               if(!§§pop())
               {
                  Runtime.delayFunction(onStopped,1);
               }
            }
         };
         var stopReels:Function = function():void
         {
            _reel1.stop(slot1,instant,reelStopped);
            _reel2.stop(slot2,instant,reelStopped);
            _reel3.stop(slot3,instant,reelStopped);
         };
         Runtime.delayFunction(stopReels,5);
      }
   }
}

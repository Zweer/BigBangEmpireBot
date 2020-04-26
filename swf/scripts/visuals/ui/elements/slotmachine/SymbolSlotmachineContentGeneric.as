package visuals.ui.elements.slotmachine
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.bonus.SymbolSlotMachineGeneric;
   import visuals.ui.elements.buttons.SymbolButtonResourceGeneric;
   
   public class SymbolSlotmachineContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolSlotmachineContent = null;
      
      public var txtJetons:ILabel = null;
      
      public var jetonTooltip:SymbolDummyGeneric = null;
      
      public var slotMachine:SymbolSlotMachineGeneric = null;
      
      public var btnSpin:SymbolButtonResourceGeneric = null;
      
      public var btnFreeSpin:SymbolUiButtonDefaultGeneric = null;
      
      public var chat:SymbolUiSlotmachineChatGeneric = null;
      
      public var girls:SymbolSlotmachineAnimationGirlsGeneric = null;
      
      public var lightRed:SymbolSlotmachineAnimationLightsRedGeneric = null;
      
      public var lightWhite:SymbolSlotmachineAnimationLightsWhiteGeneric = null;
      
      public var xxx:SymbolSlotmachineAnimationXXXGeneric = null;
      
      public var jackpot:SymbolSlotmachineAnimationJackpotGeneric = null;
      
      public function SymbolSlotmachineContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolSlotmachineContent;
         }
         else
         {
            _nativeObject = new SymbolSlotmachineContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtJetons = FlashLabel.fromNative(_nativeObject.txtJetons);
         jetonTooltip = new SymbolDummyGeneric(_nativeObject.jetonTooltip);
         slotMachine = new SymbolSlotMachineGeneric(_nativeObject.slotMachine);
         btnSpin = new SymbolButtonResourceGeneric(_nativeObject.btnSpin);
         btnFreeSpin = new SymbolUiButtonDefaultGeneric(_nativeObject.btnFreeSpin);
         chat = new SymbolUiSlotmachineChatGeneric(_nativeObject.chat);
         girls = new SymbolSlotmachineAnimationGirlsGeneric(_nativeObject.girls);
         lightRed = new SymbolSlotmachineAnimationLightsRedGeneric(_nativeObject.lightRed);
         lightWhite = new SymbolSlotmachineAnimationLightsWhiteGeneric(_nativeObject.lightWhite);
         xxx = new SymbolSlotmachineAnimationXXXGeneric(_nativeObject.xxx);
         jackpot = new SymbolSlotmachineAnimationJackpotGeneric(_nativeObject.jackpot);
      }
      
      public function setNativeInstance(param1:SymbolSlotmachineContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabel.setNativeInstance(txtJetons,_nativeObject.txtJetons);
         if(_nativeObject.jetonTooltip)
         {
            jetonTooltip.setNativeInstance(_nativeObject.jetonTooltip);
         }
         if(_nativeObject.slotMachine)
         {
            slotMachine.setNativeInstance(_nativeObject.slotMachine);
         }
         if(_nativeObject.btnSpin)
         {
            btnSpin.setNativeInstance(_nativeObject.btnSpin);
         }
         if(_nativeObject.btnFreeSpin)
         {
            btnFreeSpin.setNativeInstance(_nativeObject.btnFreeSpin);
         }
         if(_nativeObject.chat)
         {
            chat.setNativeInstance(_nativeObject.chat);
         }
         if(_nativeObject.girls)
         {
            girls.setNativeInstance(_nativeObject.girls);
         }
         if(_nativeObject.lightRed)
         {
            lightRed.setNativeInstance(_nativeObject.lightRed);
         }
         if(_nativeObject.lightWhite)
         {
            lightWhite.setNativeInstance(_nativeObject.lightWhite);
         }
         if(_nativeObject.xxx)
         {
            xxx.setNativeInstance(_nativeObject.xxx);
         }
         if(_nativeObject.jackpot)
         {
            jackpot.setNativeInstance(_nativeObject.jackpot);
         }
      }
   }
}

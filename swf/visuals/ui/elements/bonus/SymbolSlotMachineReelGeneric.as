package visuals.ui.elements.bonus
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.slotmachine.SymbolSlotmachineRewardBaseGeneric;
   import visuals.ui.elements.slotmachine.SymbolSlotmachineRewardBoosterGeneric;
   import visuals.ui.elements.slotmachine.SymbolSlotmachineRewardCoinGeneric;
   import visuals.ui.elements.slotmachine.SymbolSlotmachineRewardEnergyGeneric;
   import visuals.ui.elements.slotmachine.SymbolSlotmachineRewardItemGeneric;
   import visuals.ui.elements.slotmachine.SymbolSlotmachineRewardStatGeneric;
   import visuals.ui.elements.slotmachine.SymbolSlotmachineRewardXpGeneric;
   
   public class SymbolSlotMachineReelGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolSlotMachineReel = null;
      
      public var base:SymbolSlotmachineRewardBaseGeneric = null;
      
      public var coins:SymbolSlotmachineRewardCoinGeneric = null;
      
      public var xp:SymbolSlotmachineRewardXpGeneric = null;
      
      public var booster:SymbolSlotmachineRewardBoosterGeneric = null;
      
      public var statPoints:SymbolSlotmachineRewardStatGeneric = null;
      
      public var energy:SymbolSlotmachineRewardEnergyGeneric = null;
      
      public var item:SymbolSlotmachineRewardItemGeneric = null;
      
      public function SymbolSlotMachineReelGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolSlotMachineReel;
         }
         else
         {
            _nativeObject = new SymbolSlotMachineReel();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         base = new SymbolSlotmachineRewardBaseGeneric(_nativeObject.base);
         coins = new SymbolSlotmachineRewardCoinGeneric(_nativeObject.coins);
         xp = new SymbolSlotmachineRewardXpGeneric(_nativeObject.xp);
         booster = new SymbolSlotmachineRewardBoosterGeneric(_nativeObject.booster);
         statPoints = new SymbolSlotmachineRewardStatGeneric(_nativeObject.statPoints);
         energy = new SymbolSlotmachineRewardEnergyGeneric(_nativeObject.energy);
         item = new SymbolSlotmachineRewardItemGeneric(_nativeObject.item);
      }
      
      public function setNativeInstance(param1:SymbolSlotMachineReel) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.base)
         {
            base.setNativeInstance(_nativeObject.base);
         }
         if(_nativeObject.coins)
         {
            coins.setNativeInstance(_nativeObject.coins);
         }
         if(_nativeObject.xp)
         {
            xp.setNativeInstance(_nativeObject.xp);
         }
         if(_nativeObject.booster)
         {
            booster.setNativeInstance(_nativeObject.booster);
         }
         if(_nativeObject.statPoints)
         {
            statPoints.setNativeInstance(_nativeObject.statPoints);
         }
         if(_nativeObject.energy)
         {
            energy.setNativeInstance(_nativeObject.energy);
         }
         if(_nativeObject.item)
         {
            item.setNativeInstance(_nativeObject.item);
         }
      }
   }
}

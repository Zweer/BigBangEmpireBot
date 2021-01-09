package visuals.ui.elements.slotmachine
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.bonus.SymbolSlotMachineReelGeneric;
   
   public class SymbolSlotMachineReelAllGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolSlotMachineReelAll = null;
      
      public var coinsBottom:SymbolSlotMachineReelGeneric = null;
      
      public var energy:SymbolSlotMachineReelGeneric = null;
      
      public var xp:SymbolSlotMachineReelGeneric = null;
      
      public var statPoints:SymbolSlotMachineReelGeneric = null;
      
      public var booster:SymbolSlotMachineReelGeneric = null;
      
      public var item:SymbolSlotMachineReelGeneric = null;
      
      public var coins:SymbolSlotMachineReelGeneric = null;
      
      public var energyTop:SymbolSlotMachineReelGeneric = null;
      
      public function SymbolSlotMachineReelAllGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolSlotMachineReelAll;
         }
         else
         {
            _nativeObject = new SymbolSlotMachineReelAll();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         coinsBottom = new SymbolSlotMachineReelGeneric(_nativeObject.coinsBottom);
         energy = new SymbolSlotMachineReelGeneric(_nativeObject.energy);
         xp = new SymbolSlotMachineReelGeneric(_nativeObject.xp);
         statPoints = new SymbolSlotMachineReelGeneric(_nativeObject.statPoints);
         booster = new SymbolSlotMachineReelGeneric(_nativeObject.booster);
         item = new SymbolSlotMachineReelGeneric(_nativeObject.item);
         coins = new SymbolSlotMachineReelGeneric(_nativeObject.coins);
         energyTop = new SymbolSlotMachineReelGeneric(_nativeObject.energyTop);
      }
      
      public function setNativeInstance(param1:SymbolSlotMachineReelAll) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.coinsBottom)
         {
            coinsBottom.setNativeInstance(_nativeObject.coinsBottom);
         }
         if(_nativeObject.energy)
         {
            energy.setNativeInstance(_nativeObject.energy);
         }
         if(_nativeObject.xp)
         {
            xp.setNativeInstance(_nativeObject.xp);
         }
         if(_nativeObject.statPoints)
         {
            statPoints.setNativeInstance(_nativeObject.statPoints);
         }
         if(_nativeObject.booster)
         {
            booster.setNativeInstance(_nativeObject.booster);
         }
         if(_nativeObject.item)
         {
            item.setNativeInstance(_nativeObject.item);
         }
         if(_nativeObject.coins)
         {
            coins.setNativeInstance(_nativeObject.coins);
         }
         if(_nativeObject.energyTop)
         {
            energyTop.setNativeInstance(_nativeObject.energyTop);
         }
      }
   }
}

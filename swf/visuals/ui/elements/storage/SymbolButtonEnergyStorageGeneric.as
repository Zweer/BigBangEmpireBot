package visuals.ui.elements.storage
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolButtonEnergyStorageGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonEnergyStorage = null;
      
      public var icon:SymbolIconEnergyStorageGeneric = null;
      
      public function SymbolButtonEnergyStorageGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonEnergyStorage;
         }
         else
         {
            _nativeObject = new SymbolButtonEnergyStorage();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         icon = new SymbolIconEnergyStorageGeneric(_nativeObject.icon);
      }
      
      public function setNativeInstance(param1:SymbolButtonEnergyStorage) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.icon)
         {
            icon.setNativeInstance(_nativeObject.icon);
         }
      }
   }
}

package visuals.ui.elements.icons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolIconGuildStatEquipmentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolIconGuildStatEquipment = null;
      
      public function SymbolIconGuildStatEquipmentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolIconGuildStatEquipment;
         }
         else
         {
            _nativeObject = new SymbolIconGuildStatEquipment();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolIconGuildStatEquipment) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
      }
   }
}

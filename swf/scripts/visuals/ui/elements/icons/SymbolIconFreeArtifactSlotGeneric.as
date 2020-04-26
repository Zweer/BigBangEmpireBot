package visuals.ui.elements.icons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolIconFreeArtifactSlotGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolIconFreeArtifactSlot = null;
      
      public function SymbolIconFreeArtifactSlotGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolIconFreeArtifactSlot;
         }
         else
         {
            _nativeObject = new SymbolIconFreeArtifactSlot();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolIconFreeArtifactSlot) : void
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

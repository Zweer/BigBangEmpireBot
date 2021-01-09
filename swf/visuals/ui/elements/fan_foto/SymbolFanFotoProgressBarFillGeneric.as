package visuals.ui.elements.fan_foto
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   
   public class SymbolFanFotoProgressBarFillGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolFanFotoProgressBarFill = null;
      
      public var maske:SymbolDummyGeneric = null;
      
      public function SymbolFanFotoProgressBarFillGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolFanFotoProgressBarFill;
         }
         else
         {
            _nativeObject = new SymbolFanFotoProgressBarFill();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         maske = new SymbolDummyGeneric(_nativeObject.maske);
      }
      
      public function setNativeInstance(param1:SymbolFanFotoProgressBarFill) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.maske)
         {
            maske.setNativeInstance(_nativeObject.maske);
         }
      }
   }
}

package visuals.ui.elements.titles
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolSecretGeneric;
   
   public class SymbolIconSecretGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolIconSecret = null;
      
      public var symbolSecret:SymbolSecretGeneric = null;
      
      public function SymbolIconSecretGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolIconSecret;
         }
         else
         {
            _nativeObject = new SymbolIconSecret();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolSecret = new SymbolSecretGeneric(_nativeObject.symbolSecret);
      }
      
      public function setNativeInstance(param1:SymbolIconSecret) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolSecret)
         {
            symbolSecret.setNativeInstance(_nativeObject.symbolSecret);
         }
      }
   }
}

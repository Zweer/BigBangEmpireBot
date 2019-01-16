package visuals.ui.elements.herobook
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   
   public class SymbolHerobookCharacterGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolHerobookCharacter = null;
      
      public var iconCharacter:SymbolPlaceholderGeneric = null;
      
      public function SymbolHerobookCharacterGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolHerobookCharacter;
         }
         else
         {
            _nativeObject = new SymbolHerobookCharacter();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         iconCharacter = new SymbolPlaceholderGeneric(_nativeObject.iconCharacter);
      }
      
      public function setNativeInstance(param1:SymbolHerobookCharacter) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.iconCharacter)
         {
            iconCharacter.setNativeInstance(_nativeObject.iconCharacter);
         }
      }
   }
}

package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   
   public class SymbolGuildButtonArrowUpWhiteGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildButtonArrowUpWhite = null;
      
      public var symbolDummy:SymbolDummyGeneric = null;
      
      public function SymbolGuildButtonArrowUpWhiteGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildButtonArrowUpWhite;
         }
         else
         {
            _nativeObject = new SymbolGuildButtonArrowUpWhite();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolDummy = new SymbolDummyGeneric(_nativeObject.symbolDummy);
      }
      
      public function setNativeInstance(param1:SymbolGuildButtonArrowUpWhite) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolDummy)
         {
            symbolDummy.setNativeInstance(_nativeObject.symbolDummy);
         }
      }
   }
}

package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   
   public class SymbolGuildEmblemGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildEmblem = null;
      
      public var shapeBackground:SymbolPlaceholderGeneric = null;
      
      public var icon:SymbolPlaceholderGeneric = null;
      
      public function SymbolGuildEmblemGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildEmblem;
         }
         else
         {
            _nativeObject = new SymbolGuildEmblem();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         shapeBackground = new SymbolPlaceholderGeneric(_nativeObject.shapeBackground);
         icon = new SymbolPlaceholderGeneric(_nativeObject.icon);
      }
      
      public function setNativeInstance(param1:SymbolGuildEmblem) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.shapeBackground)
         {
            shapeBackground.setNativeInstance(_nativeObject.shapeBackground);
         }
         if(_nativeObject.icon)
         {
            icon.setNativeInstance(_nativeObject.icon);
         }
      }
   }
}

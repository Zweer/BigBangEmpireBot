package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolColorBoxGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolColorBox = null;
      
      public var bg:SymbolColorBoxContentGeneric = null;
      
      public var color:SymbolColorBoxContentGeneric = null;
      
      public var active:SymbolColorBoxActiveBorderGeneric = null;
      
      public function SymbolColorBoxGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolColorBox;
         }
         else
         {
            _nativeObject = new SymbolColorBox();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolColorBoxContentGeneric(_nativeObject.bg);
         color = new SymbolColorBoxContentGeneric(_nativeObject.color);
         active = new SymbolColorBoxActiveBorderGeneric(_nativeObject.active);
      }
      
      public function setNativeInstance(param1:SymbolColorBox) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.bg)
         {
            bg.setNativeInstance(_nativeObject.bg);
         }
         if(_nativeObject.color)
         {
            color.setNativeInstance(_nativeObject.color);
         }
         if(_nativeObject.active)
         {
            active.setNativeInstance(_nativeObject.active);
         }
      }
   }
}

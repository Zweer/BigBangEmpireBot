package visuals.ui.elements.quest
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolLetterboxGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolLetterbox = null;
      
      public var bottom:SymbolLetterboxBarGeneric = null;
      
      public var top:SymbolLetterboxBarGeneric = null;
      
      public function SymbolLetterboxGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolLetterbox;
         }
         else
         {
            _nativeObject = new SymbolLetterbox();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bottom = new SymbolLetterboxBarGeneric(_nativeObject.bottom);
         top = new SymbolLetterboxBarGeneric(_nativeObject.top);
      }
      
      public function setNativeInstance(param1:SymbolLetterbox) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.bottom)
         {
            bottom.setNativeInstance(_nativeObject.bottom);
         }
         if(_nativeObject.top)
         {
            top.setNativeInstance(_nativeObject.top);
         }
      }
   }
}

package visuals.ui.elements.goal
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolIconCheckmarkGeneric;
   
   public class SymbolGoalCheckmarkGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGoalCheckmark = null;
      
      public var symbolIconCheckmark:SymbolIconCheckmarkGeneric = null;
      
      public function SymbolGoalCheckmarkGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGoalCheckmark;
         }
         else
         {
            _nativeObject = new SymbolGoalCheckmark();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolIconCheckmark = new SymbolIconCheckmarkGeneric(_nativeObject.symbolIconCheckmark);
      }
      
      public function setNativeInstance(param1:SymbolGoalCheckmark) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolIconCheckmark)
         {
            symbolIconCheckmark.setNativeInstance(_nativeObject.symbolIconCheckmark);
         }
      }
   }
}

package visuals.ui.elements.event
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolEventQuestButtonHighlightGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolEventQuestButtonHighlight = null;
      
      public function SymbolEventQuestButtonHighlightGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolEventQuestButtonHighlight;
         }
         else
         {
            _nativeObject = new SymbolEventQuestButtonHighlight();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolEventQuestButtonHighlight) : void
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

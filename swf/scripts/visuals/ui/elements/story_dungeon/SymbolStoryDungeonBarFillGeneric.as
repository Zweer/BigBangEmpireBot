package visuals.ui.elements.story_dungeon
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolStoryDungeonBarFillGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStoryDungeonBarFill = null;
      
      public function SymbolStoryDungeonBarFillGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStoryDungeonBarFill;
         }
         else
         {
            _nativeObject = new SymbolStoryDungeonBarFill();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolStoryDungeonBarFill) : void
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

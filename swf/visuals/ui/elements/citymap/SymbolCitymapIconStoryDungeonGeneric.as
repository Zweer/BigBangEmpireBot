package visuals.ui.elements.citymap
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.story_dungeon.SymbolStoryDungeonGraphicGeneric;
   
   public class SymbolCitymapIconStoryDungeonGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCitymapIconStoryDungeon = null;
      
      public var graphic:SymbolStoryDungeonGraphicGeneric = null;
      
      public function SymbolCitymapIconStoryDungeonGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCitymapIconStoryDungeon;
         }
         else
         {
            _nativeObject = new SymbolCitymapIconStoryDungeon();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         graphic = new SymbolStoryDungeonGraphicGeneric(_nativeObject.graphic);
      }
      
      public function setNativeInstance(param1:SymbolCitymapIconStoryDungeon) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.graphic)
         {
            graphic.setNativeInstance(_nativeObject.graphic);
         }
      }
   }
}

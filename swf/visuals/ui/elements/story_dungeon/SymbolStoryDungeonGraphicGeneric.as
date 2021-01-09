package visuals.ui.elements.story_dungeon
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   
   public class SymbolStoryDungeonGraphicGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStoryDungeonGraphic = null;
      
      public var npcIcon:SymbolPlaceholderGeneric = null;
      
      public function SymbolStoryDungeonGraphicGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStoryDungeonGraphic;
         }
         else
         {
            _nativeObject = new SymbolStoryDungeonGraphic();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         npcIcon = new SymbolPlaceholderGeneric(_nativeObject.npcIcon);
      }
      
      public function setNativeInstance(param1:SymbolStoryDungeonGraphic) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.npcIcon)
         {
            npcIcon.setNativeInstance(_nativeObject.npcIcon);
         }
      }
   }
}

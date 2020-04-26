package visuals.ui.elements.dungeon
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolButtonDungeonQuestGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonDungeonQuest = null;
      
      public var graphic:SymbolDungeonQuestGraphicGeneric = null;
      
      public function SymbolButtonDungeonQuestGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonDungeonQuest;
         }
         else
         {
            _nativeObject = new SymbolButtonDungeonQuest();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         graphic = new SymbolDungeonQuestGraphicGeneric(_nativeObject.graphic);
      }
      
      public function setNativeInstance(param1:SymbolButtonDungeonQuest) : void
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

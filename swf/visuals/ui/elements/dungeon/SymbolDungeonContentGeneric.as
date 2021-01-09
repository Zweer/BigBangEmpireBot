package visuals.ui.elements.dungeon
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   
   public class SymbolDungeonContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDungeonContent = null;
      
      public var path:SymbolPlaceholderGeneric = null;
      
      public var btnCurrentDungeonQuest:SymbolButtonDungeonQuestGeneric = null;
      
      public function SymbolDungeonContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDungeonContent;
         }
         else
         {
            _nativeObject = new SymbolDungeonContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         path = new SymbolPlaceholderGeneric(_nativeObject.path);
         btnCurrentDungeonQuest = new SymbolButtonDungeonQuestGeneric(_nativeObject.btnCurrentDungeonQuest);
      }
      
      public function setNativeInstance(param1:SymbolDungeonContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.path)
         {
            path.setNativeInstance(_nativeObject.path);
         }
         if(_nativeObject.btnCurrentDungeonQuest)
         {
            btnCurrentDungeonQuest.setNativeInstance(_nativeObject.btnCurrentDungeonQuest);
         }
      }
   }
}

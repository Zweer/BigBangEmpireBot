package visuals.ui.elements.dungeon
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolDungeonQuestGraphicGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDungeonQuestGraphic = null;
      
      public var contentLevel:SymbolDungeonProgressButtonLevelGeneric = null;
      
      public var contentQuest:SymbolDungeonProgressButtonQuestGeneric = null;
      
      public function SymbolDungeonQuestGraphicGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDungeonQuestGraphic;
         }
         else
         {
            _nativeObject = new SymbolDungeonQuestGraphic();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         contentLevel = new SymbolDungeonProgressButtonLevelGeneric(_nativeObject.contentLevel);
         contentQuest = new SymbolDungeonProgressButtonQuestGeneric(_nativeObject.contentQuest);
      }
      
      public function setNativeInstance(param1:SymbolDungeonQuestGraphic) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.contentLevel)
         {
            contentLevel.setNativeInstance(_nativeObject.contentLevel);
         }
         if(_nativeObject.contentQuest)
         {
            contentQuest.setNativeInstance(_nativeObject.contentQuest);
         }
      }
   }
}

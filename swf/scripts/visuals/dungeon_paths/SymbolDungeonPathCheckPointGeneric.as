package visuals.dungeon_paths
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolDungeonPathCheckPointGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDungeonPathCheckPoint = null;
      
      public var symbolDungeonPathCheckPointBaseDefault:SymbolDungeonPathCheckPointBaseDefaultGeneric = null;
      
      public var baseVIP:SymbolDungeonPathCheckPointBaseVIPGeneric = null;
      
      public var completed:SymbolDungeonPathCheckMarkGeneric = null;
      
      public function SymbolDungeonPathCheckPointGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDungeonPathCheckPoint;
         }
         else
         {
            _nativeObject = new SymbolDungeonPathCheckPoint();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolDungeonPathCheckPointBaseDefault = new SymbolDungeonPathCheckPointBaseDefaultGeneric(_nativeObject.symbolDungeonPathCheckPointBaseDefault);
         baseVIP = new SymbolDungeonPathCheckPointBaseVIPGeneric(_nativeObject.baseVIP);
         completed = new SymbolDungeonPathCheckMarkGeneric(_nativeObject.completed);
      }
      
      public function setNativeInstance(param1:SymbolDungeonPathCheckPoint) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolDungeonPathCheckPointBaseDefault)
         {
            symbolDungeonPathCheckPointBaseDefault.setNativeInstance(_nativeObject.symbolDungeonPathCheckPointBaseDefault);
         }
         if(_nativeObject.baseVIP)
         {
            baseVIP.setNativeInstance(_nativeObject.baseVIP);
         }
         if(_nativeObject.completed)
         {
            completed.setNativeInstance(_nativeObject.completed);
         }
      }
   }
}

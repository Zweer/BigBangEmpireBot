package visuals.dungeon_paths
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolDungeonPathCheckPointBaseVIPGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDungeonPathCheckPointBaseVIP = null;
      
      public function SymbolDungeonPathCheckPointBaseVIPGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDungeonPathCheckPointBaseVIP;
         }
         else
         {
            _nativeObject = new SymbolDungeonPathCheckPointBaseVIP();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolDungeonPathCheckPointBaseVIP) : void
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

package visuals.ui.elements.citymap
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.dungeon.SymbolCitymapDungeonButtonTimerGeneric;
   
   public class SymbolCitymapButtonDungeonWhiplashGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCitymapButtonDungeonWhiplash = null;
      
      public var shadow:SymbolCitymapShadowDungeon3Generic = null;
      
      public var locationGraphic:SymbolCitymapDungeon3Generic = null;
      
      public var time:SymbolCitymapDungeonButtonTimerGeneric = null;
      
      public var clickArea:SymbolDungeon3ClickAreaGeneric = null;
      
      public function SymbolCitymapButtonDungeonWhiplashGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCitymapButtonDungeonWhiplash;
         }
         else
         {
            _nativeObject = new SymbolCitymapButtonDungeonWhiplash();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         shadow = new SymbolCitymapShadowDungeon3Generic(_nativeObject.shadow);
         locationGraphic = new SymbolCitymapDungeon3Generic(_nativeObject.locationGraphic);
         time = new SymbolCitymapDungeonButtonTimerGeneric(_nativeObject.time);
         clickArea = new SymbolDungeon3ClickAreaGeneric(_nativeObject.clickArea);
      }
      
      public function setNativeInstance(param1:SymbolCitymapButtonDungeonWhiplash) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.shadow)
         {
            shadow.setNativeInstance(_nativeObject.shadow);
         }
         if(_nativeObject.locationGraphic)
         {
            locationGraphic.setNativeInstance(_nativeObject.locationGraphic);
         }
         if(_nativeObject.time)
         {
            time.setNativeInstance(_nativeObject.time);
         }
         if(_nativeObject.clickArea)
         {
            clickArea.setNativeInstance(_nativeObject.clickArea);
         }
      }
   }
}

package visuals.ui.elements.citymap
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.dungeon.SymbolCitymapDungeonButtonTimerGeneric;
   
   public class SymbolCitymapButtonDungeonFlamingWheelsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCitymapButtonDungeonFlamingWheels = null;
      
      public var shadow:SymbolCitymapShadowDungeon2Generic = null;
      
      public var locationGraphic:SymbolCitymapDungeon2Generic = null;
      
      public var time:SymbolCitymapDungeonButtonTimerGeneric = null;
      
      public var clickArea:SymbolDungeon2ClickAreaGeneric = null;
      
      public function SymbolCitymapButtonDungeonFlamingWheelsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCitymapButtonDungeonFlamingWheels;
         }
         else
         {
            _nativeObject = new SymbolCitymapButtonDungeonFlamingWheels();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         shadow = new SymbolCitymapShadowDungeon2Generic(_nativeObject.shadow);
         locationGraphic = new SymbolCitymapDungeon2Generic(_nativeObject.locationGraphic);
         time = new SymbolCitymapDungeonButtonTimerGeneric(_nativeObject.time);
         clickArea = new SymbolDungeon2ClickAreaGeneric(_nativeObject.clickArea);
      }
      
      public function setNativeInstance(param1:SymbolCitymapButtonDungeonFlamingWheels) : void
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

package visuals.ui.elements.citymap
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolCitymapCloudsLayerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCitymapCloudsLayer = null;
      
      public var dungeon_burning_bernie:SymbolCloudsDungeon1Generic = null;
      
      public var dungeon_flaming_wheels:SymbolCloudsDungeon2Generic = null;
      
      public var dungeon_whiplash:SymbolCloudsDungeon3Generic = null;
      
      public var location1:SymbolCloudsLocation1Generic = null;
      
      public var location2:SymbolCloudsLocation2Generic = null;
      
      public var location3:SymbolCloudsLocation3Generic = null;
      
      public var location4:SymbolCloudsLocation4Generic = null;
      
      public var location5:SymbolCloudsLocation5Generic = null;
      
      public var location6:SymbolCloudsLocation6Generic = null;
      
      public var location7:SymbolCloudsLocation7Generic = null;
      
      public var location8:SymbolCloudsLocation8Generic = null;
      
      public var location9:SymbolCloudsLocation9Generic = null;
      
      public var customStageLocation100:SymbolCloudsLocationOliviaJonesGeneric = null;
      
      public function SymbolCitymapCloudsLayerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCitymapCloudsLayer;
         }
         else
         {
            _nativeObject = new SymbolCitymapCloudsLayer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dungeon_burning_bernie = new SymbolCloudsDungeon1Generic(_nativeObject.dungeon_burning_bernie);
         dungeon_flaming_wheels = new SymbolCloudsDungeon2Generic(_nativeObject.dungeon_flaming_wheels);
         dungeon_whiplash = new SymbolCloudsDungeon3Generic(_nativeObject.dungeon_whiplash);
         location1 = new SymbolCloudsLocation1Generic(_nativeObject.location1);
         location2 = new SymbolCloudsLocation2Generic(_nativeObject.location2);
         location3 = new SymbolCloudsLocation3Generic(_nativeObject.location3);
         location4 = new SymbolCloudsLocation4Generic(_nativeObject.location4);
         location5 = new SymbolCloudsLocation5Generic(_nativeObject.location5);
         location6 = new SymbolCloudsLocation6Generic(_nativeObject.location6);
         location7 = new SymbolCloudsLocation7Generic(_nativeObject.location7);
         location8 = new SymbolCloudsLocation8Generic(_nativeObject.location8);
         location9 = new SymbolCloudsLocation9Generic(_nativeObject.location9);
         customStageLocation100 = new SymbolCloudsLocationOliviaJonesGeneric(_nativeObject.customStageLocation100);
      }
      
      public function setNativeInstance(param1:SymbolCitymapCloudsLayer) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.dungeon_burning_bernie)
         {
            dungeon_burning_bernie.setNativeInstance(_nativeObject.dungeon_burning_bernie);
         }
         if(_nativeObject.dungeon_flaming_wheels)
         {
            dungeon_flaming_wheels.setNativeInstance(_nativeObject.dungeon_flaming_wheels);
         }
         if(_nativeObject.dungeon_whiplash)
         {
            dungeon_whiplash.setNativeInstance(_nativeObject.dungeon_whiplash);
         }
         if(_nativeObject.location1)
         {
            location1.setNativeInstance(_nativeObject.location1);
         }
         if(_nativeObject.location2)
         {
            location2.setNativeInstance(_nativeObject.location2);
         }
         if(_nativeObject.location3)
         {
            location3.setNativeInstance(_nativeObject.location3);
         }
         if(_nativeObject.location4)
         {
            location4.setNativeInstance(_nativeObject.location4);
         }
         if(_nativeObject.location5)
         {
            location5.setNativeInstance(_nativeObject.location5);
         }
         if(_nativeObject.location6)
         {
            location6.setNativeInstance(_nativeObject.location6);
         }
         if(_nativeObject.location7)
         {
            location7.setNativeInstance(_nativeObject.location7);
         }
         if(_nativeObject.location8)
         {
            location8.setNativeInstance(_nativeObject.location8);
         }
         if(_nativeObject.location9)
         {
            location9.setNativeInstance(_nativeObject.location9);
         }
         if(_nativeObject.customStageLocation100)
         {
            customStageLocation100.setNativeInstance(_nativeObject.customStageLocation100);
         }
      }
   }
}

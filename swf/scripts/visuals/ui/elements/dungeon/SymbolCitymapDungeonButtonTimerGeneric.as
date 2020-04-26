package visuals.ui.elements.dungeon
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.conventions.SymbolButtonConventionPlateGeneric;
   
   public class SymbolCitymapDungeonButtonTimerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCitymapDungeonButtonTimer = null;
      
      public var symbolButtonConventionPlate:SymbolButtonConventionPlateGeneric = null;
      
      public var txtTimeLeft:ILabel = null;
      
      public function SymbolCitymapDungeonButtonTimerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCitymapDungeonButtonTimer;
         }
         else
         {
            _nativeObject = new SymbolCitymapDungeonButtonTimer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolButtonConventionPlate = new SymbolButtonConventionPlateGeneric(_nativeObject.symbolButtonConventionPlate);
         txtTimeLeft = FlashLabel.fromNative(_nativeObject.txtTimeLeft);
      }
      
      public function setNativeInstance(param1:SymbolCitymapDungeonButtonTimer) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolButtonConventionPlate)
         {
            symbolButtonConventionPlate.setNativeInstance(_nativeObject.symbolButtonConventionPlate);
         }
         FlashLabel.setNativeInstance(txtTimeLeft,_nativeObject.txtTimeLeft);
      }
   }
}

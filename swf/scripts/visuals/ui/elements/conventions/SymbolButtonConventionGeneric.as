package visuals.ui.elements.conventions
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   
   public class SymbolButtonConventionGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonConvention = null;
      
      public var symbolButtonConventionPlate:SymbolButtonConventionPlateGeneric = null;
      
      public var graphic:SymbolConventionGraphicGeneric = null;
      
      public var progress:SymbolConventionFansBarSmallGeneric = null;
      
      public var txtTimeLeft:ILabel = null;
      
      public function SymbolButtonConventionGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonConvention;
         }
         else
         {
            _nativeObject = new SymbolButtonConvention();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolButtonConventionPlate = new SymbolButtonConventionPlateGeneric(_nativeObject.symbolButtonConventionPlate);
         graphic = new SymbolConventionGraphicGeneric(_nativeObject.graphic);
         progress = new SymbolConventionFansBarSmallGeneric(_nativeObject.progress);
         txtTimeLeft = FlashLabel.fromNative(_nativeObject.txtTimeLeft);
      }
      
      public function setNativeInstance(param1:SymbolButtonConvention) : void
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
         if(_nativeObject.graphic)
         {
            graphic.setNativeInstance(_nativeObject.graphic);
         }
         if(_nativeObject.progress)
         {
            progress.setNativeInstance(_nativeObject.progress);
         }
         FlashLabel.setNativeInstance(txtTimeLeft,_nativeObject.txtTimeLeft);
      }
   }
}

package visuals.ui.elements.movie
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonPlusGeneric;
   
   public class SymbolMovieEnergyBgGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMovieEnergyBg = null;
      
      public var txtEnergyLeft:ILabel = null;
      
      public var btnBuyEnergy:SymbolButtonPlusGeneric = null;
      
      public var txtEnergyTimer:ILabel = null;
      
      public function SymbolMovieEnergyBgGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolMovieEnergyBg;
         }
         else
         {
            _nativeObject = new SymbolMovieEnergyBg();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtEnergyLeft = FlashLabel.fromNative(_nativeObject.txtEnergyLeft);
         btnBuyEnergy = new SymbolButtonPlusGeneric(_nativeObject.btnBuyEnergy);
         txtEnergyTimer = FlashLabel.fromNative(_nativeObject.txtEnergyTimer);
      }
      
      public function setNativeInstance(param1:SymbolMovieEnergyBg) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabel.setNativeInstance(txtEnergyLeft,_nativeObject.txtEnergyLeft);
         if(_nativeObject.btnBuyEnergy)
         {
            btnBuyEnergy.setNativeInstance(_nativeObject.btnBuyEnergy);
         }
         FlashLabel.setNativeInstance(txtEnergyTimer,_nativeObject.txtEnergyTimer);
      }
   }
}

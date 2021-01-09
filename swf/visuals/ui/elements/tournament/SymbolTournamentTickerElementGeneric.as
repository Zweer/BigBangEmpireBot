package visuals.ui.elements.tournament
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   
   public class SymbolTournamentTickerElementGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolTournamentTickerElement = null;
      
      public var txtTicker:ILabel = null;
      
      public function SymbolTournamentTickerElementGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolTournamentTickerElement;
         }
         else
         {
            _nativeObject = new SymbolTournamentTickerElement();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtTicker = FlashLabel.fromNative(_nativeObject.txtTicker);
      }
      
      public function setNativeInstance(param1:SymbolTournamentTickerElement) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabel.setNativeInstance(txtTicker,_nativeObject.txtTicker);
      }
   }
}

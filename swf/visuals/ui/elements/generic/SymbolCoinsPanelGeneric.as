package visuals.ui.elements.generic
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   
   public class SymbolCoinsPanelGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCoinsPanel = null;
      
      public var txtGameCurrency:ILabel = null;
      
      public var iconGameCurrency:ILabel = null;
      
      public function SymbolCoinsPanelGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCoinsPanel;
         }
         else
         {
            _nativeObject = new SymbolCoinsPanel();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtGameCurrency = FlashLabel.fromNative(_nativeObject.txtGameCurrency);
         iconGameCurrency = FlashLabel.fromNative(_nativeObject.iconGameCurrency);
      }
      
      public function setNativeInstance(param1:SymbolCoinsPanel) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabel.setNativeInstance(txtGameCurrency,_nativeObject.txtGameCurrency);
         FlashLabel.setNativeInstance(iconGameCurrency,_nativeObject.iconGameCurrency);
      }
   }
}

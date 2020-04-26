package visuals.ui.elements.item
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   
   public class SymbolItemGraphicGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolItemGraphic = null;
      
      public var container:SymbolPlaceholderGeneric = null;
      
      public var txtAmount:ILabel = null;
      
      public function SymbolItemGraphicGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolItemGraphic;
         }
         else
         {
            _nativeObject = new SymbolItemGraphic();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         container = new SymbolPlaceholderGeneric(_nativeObject.container);
         txtAmount = FlashLabel.fromNative(_nativeObject.txtAmount);
      }
      
      public function setNativeInstance(param1:SymbolItemGraphic) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.container)
         {
            container.setNativeInstance(_nativeObject.container);
         }
         FlashLabel.setNativeInstance(txtAmount,_nativeObject.txtAmount);
      }
   }
}

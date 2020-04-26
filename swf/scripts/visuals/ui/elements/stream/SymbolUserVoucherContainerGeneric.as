package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   
   public class SymbolUserVoucherContainerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUserVoucherContainer = null;
      
      public var symbolPanelStreamHeaderBackground:SymbolPanelStreamHeaderBackgroundGeneric = null;
      
      public var txtTitle:ILabel = null;
      
      public var list:SymbolUserVoucherListGeneric = null;
      
      public function SymbolUserVoucherContainerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUserVoucherContainer;
         }
         else
         {
            _nativeObject = new SymbolUserVoucherContainer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolPanelStreamHeaderBackground = new SymbolPanelStreamHeaderBackgroundGeneric(_nativeObject.symbolPanelStreamHeaderBackground);
         txtTitle = FlashLabel.fromNative(_nativeObject.txtTitle);
         list = new SymbolUserVoucherListGeneric(_nativeObject.list);
      }
      
      public function setNativeInstance(param1:SymbolUserVoucherContainer) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolPanelStreamHeaderBackground)
         {
            symbolPanelStreamHeaderBackground.setNativeInstance(_nativeObject.symbolPanelStreamHeaderBackground);
         }
         FlashLabel.setNativeInstance(txtTitle,_nativeObject.txtTitle);
         if(_nativeObject.list)
         {
            list.setNativeInstance(_nativeObject.list);
         }
      }
   }
}

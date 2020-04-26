package visuals.ui.elements.streaming
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   
   public class SymbolStreamingResourcePanelGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStreamingResourcePanel = null;
      
      public var txtResource:ILabel = null;
      
      public var iconStreamingResource:SymbolIconStreamingResourceGeneric = null;
      
      public function SymbolStreamingResourcePanelGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStreamingResourcePanel;
         }
         else
         {
            _nativeObject = new SymbolStreamingResourcePanel();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtResource = FlashLabel.fromNative(_nativeObject.txtResource);
         iconStreamingResource = new SymbolIconStreamingResourceGeneric(_nativeObject.iconStreamingResource);
      }
      
      public function setNativeInstance(param1:SymbolStreamingResourcePanel) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabel.setNativeInstance(txtResource,_nativeObject.txtResource);
         if(_nativeObject.iconStreamingResource)
         {
            iconStreamingResource.setNativeInstance(_nativeObject.iconStreamingResource);
         }
      }
   }
}

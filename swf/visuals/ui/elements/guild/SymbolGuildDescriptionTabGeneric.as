package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   
   public class SymbolGuildDescriptionTabGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildDescriptionTab = null;
      
      public var bgCollapsed:SymbolGuildBottomFrameCollapsedGeneric = null;
      
      public var bgExpanded:SymbolGuildBottomFrameExpandedGeneric = null;
      
      public var txtDescription:ILabelArea = null;
      
      public var clickLayer:SymbolDummyGeneric = null;
      
      public function SymbolGuildDescriptionTabGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildDescriptionTab;
         }
         else
         {
            _nativeObject = new SymbolGuildDescriptionTab();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bgCollapsed = new SymbolGuildBottomFrameCollapsedGeneric(_nativeObject.bgCollapsed);
         bgExpanded = new SymbolGuildBottomFrameExpandedGeneric(_nativeObject.bgExpanded);
         txtDescription = FlashLabelArea.fromNative(_nativeObject.txtDescription);
         clickLayer = new SymbolDummyGeneric(_nativeObject.clickLayer);
      }
      
      public function setNativeInstance(param1:SymbolGuildDescriptionTab) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.bgCollapsed)
         {
            bgCollapsed.setNativeInstance(_nativeObject.bgCollapsed);
         }
         if(_nativeObject.bgExpanded)
         {
            bgExpanded.setNativeInstance(_nativeObject.bgExpanded);
         }
         FlashLabelArea.setNativeInstance(txtDescription,_nativeObject.txtDescription);
         if(_nativeObject.clickLayer)
         {
            clickLayer.setNativeInstance(_nativeObject.clickLayer);
         }
      }
   }
}

package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   
   public class SymbolGuildNoteTabGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildNoteTab = null;
      
      public var bgCollapsed:SymbolGuildBottomFrameCollapsedGeneric = null;
      
      public var bgExpanded:SymbolGuildBottomFrameExpandedGeneric = null;
      
      public var txtNote:ILabelArea = null;
      
      public var clickLayer:SymbolDummyGeneric = null;
      
      public function SymbolGuildNoteTabGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildNoteTab;
         }
         else
         {
            _nativeObject = new SymbolGuildNoteTab();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bgCollapsed = new SymbolGuildBottomFrameCollapsedGeneric(_nativeObject.bgCollapsed);
         bgExpanded = new SymbolGuildBottomFrameExpandedGeneric(_nativeObject.bgExpanded);
         txtNote = FlashLabelArea.fromNative(_nativeObject.txtNote);
         clickLayer = new SymbolDummyGeneric(_nativeObject.clickLayer);
      }
      
      public function setNativeInstance(param1:SymbolGuildNoteTab) : void
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
         FlashLabelArea.setNativeInstance(txtNote,_nativeObject.txtNote);
         if(_nativeObject.clickLayer)
         {
            clickLayer.setNativeInstance(_nativeObject.clickLayer);
         }
      }
   }
}

package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   
   public class SymbolGuildOfficerNoteTabGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildOfficerNoteTab = null;
      
      public var bgCollapsed:SymbolGuildBottomFrameCollapsedGeneric = null;
      
      public var bgExpanded:SymbolGuildBottomFrameExpandedGeneric = null;
      
      public var txtOfficerNote:ILabelArea = null;
      
      public var clickLayer:SymbolDummyGeneric = null;
      
      public function SymbolGuildOfficerNoteTabGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildOfficerNoteTab;
         }
         else
         {
            _nativeObject = new SymbolGuildOfficerNoteTab();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bgCollapsed = new SymbolGuildBottomFrameCollapsedGeneric(_nativeObject.bgCollapsed);
         bgExpanded = new SymbolGuildBottomFrameExpandedGeneric(_nativeObject.bgExpanded);
         txtOfficerNote = FlashLabelArea.fromNative(_nativeObject.txtOfficerNote);
         clickLayer = new SymbolDummyGeneric(_nativeObject.clickLayer);
      }
      
      public function setNativeInstance(param1:SymbolGuildOfficerNoteTab) : void
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
         FlashLabelArea.setNativeInstance(txtOfficerNote,_nativeObject.txtOfficerNote);
         if(_nativeObject.clickLayer)
         {
            clickLayer.setNativeInstance(_nativeObject.clickLayer);
         }
      }
   }
}

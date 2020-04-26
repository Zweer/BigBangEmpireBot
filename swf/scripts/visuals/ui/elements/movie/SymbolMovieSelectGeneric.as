package visuals.ui.elements.movie
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultCheckGeneric;
   
   public class SymbolMovieSelectGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMovieSelect = null;
      
      public var btnSelect:SymbolUiButtonDefaultCheckGeneric = null;
      
      public var cover:SymbolCoverImagePlaceholderGeneric = null;
      
      public var txtDateCaption:ILabelArea = null;
      
      public var txtDate:ILabelArea = null;
      
      public var txtSetCaption:ILabelArea = null;
      
      public var txtSet:ILabelArea = null;
      
      public function SymbolMovieSelectGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolMovieSelect;
         }
         else
         {
            _nativeObject = new SymbolMovieSelect();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         btnSelect = new SymbolUiButtonDefaultCheckGeneric(_nativeObject.btnSelect);
         cover = new SymbolCoverImagePlaceholderGeneric(_nativeObject.cover);
         txtDateCaption = FlashLabelArea.fromNative(_nativeObject.txtDateCaption);
         txtDate = FlashLabelArea.fromNative(_nativeObject.txtDate);
         txtSetCaption = FlashLabelArea.fromNative(_nativeObject.txtSetCaption);
         txtSet = FlashLabelArea.fromNative(_nativeObject.txtSet);
      }
      
      public function setNativeInstance(param1:SymbolMovieSelect) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.btnSelect)
         {
            btnSelect.setNativeInstance(_nativeObject.btnSelect);
         }
         if(_nativeObject.cover)
         {
            cover.setNativeInstance(_nativeObject.cover);
         }
         FlashLabelArea.setNativeInstance(txtDateCaption,_nativeObject.txtDateCaption);
         FlashLabelArea.setNativeInstance(txtDate,_nativeObject.txtDate);
         FlashLabelArea.setNativeInstance(txtSetCaption,_nativeObject.txtSetCaption);
         FlashLabelArea.setNativeInstance(txtSet,_nativeObject.txtSet);
      }
   }
}

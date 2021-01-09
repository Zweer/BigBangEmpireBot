package visuals.ui.elements.settings
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.generic.SymbolUiSliderQualityGeneric;
   
   public class SymbolGameSettingsGeneralContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGameSettingsGeneralContent = null;
      
      public var txtHighAnimationQuality:ILabelArea = null;
      
      public var checkShowItemPattern:SymbolUiCheckboxGeneric = null;
      
      public var txtShowItemPattern:ILabelArea = null;
      
      public var checkShowStorygoals:SymbolUiCheckboxGeneric = null;
      
      public var txtShowStorygoals:ILabelArea = null;
      
      public var txtShowShopPreview:ILabelArea = null;
      
      public var checkShowShopPreview:SymbolUiCheckboxGeneric = null;
      
      public var txtShowFriendbar:ILabelArea = null;
      
      public var checkShowFriendbar:SymbolUiCheckboxGeneric = null;
      
      public var sldQuality:SymbolUiSliderQualityGeneric = null;
      
      public var txtHighlightMovieButton:ILabelArea = null;
      
      public var checkHighlightMovieButton:SymbolUiCheckboxGeneric = null;
      
      public var txtFullscreen:ILabelArea = null;
      
      public var checkFullscreen:SymbolUiCheckboxGeneric = null;
      
      public function SymbolGameSettingsGeneralContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGameSettingsGeneralContent;
         }
         else
         {
            _nativeObject = new SymbolGameSettingsGeneralContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtHighAnimationQuality = FlashLabelArea.fromNative(_nativeObject.txtHighAnimationQuality);
         checkShowItemPattern = new SymbolUiCheckboxGeneric(_nativeObject.checkShowItemPattern);
         txtShowItemPattern = FlashLabelArea.fromNative(_nativeObject.txtShowItemPattern);
         checkShowStorygoals = new SymbolUiCheckboxGeneric(_nativeObject.checkShowStorygoals);
         txtShowStorygoals = FlashLabelArea.fromNative(_nativeObject.txtShowStorygoals);
         txtShowShopPreview = FlashLabelArea.fromNative(_nativeObject.txtShowShopPreview);
         checkShowShopPreview = new SymbolUiCheckboxGeneric(_nativeObject.checkShowShopPreview);
         txtShowFriendbar = FlashLabelArea.fromNative(_nativeObject.txtShowFriendbar);
         checkShowFriendbar = new SymbolUiCheckboxGeneric(_nativeObject.checkShowFriendbar);
         sldQuality = new SymbolUiSliderQualityGeneric(_nativeObject.sldQuality);
         txtHighlightMovieButton = FlashLabelArea.fromNative(_nativeObject.txtHighlightMovieButton);
         checkHighlightMovieButton = new SymbolUiCheckboxGeneric(_nativeObject.checkHighlightMovieButton);
         txtFullscreen = FlashLabelArea.fromNative(_nativeObject.txtFullscreen);
         checkFullscreen = new SymbolUiCheckboxGeneric(_nativeObject.checkFullscreen);
      }
      
      public function setNativeInstance(param1:SymbolGameSettingsGeneralContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabelArea.setNativeInstance(txtHighAnimationQuality,_nativeObject.txtHighAnimationQuality);
         if(_nativeObject.checkShowItemPattern)
         {
            checkShowItemPattern.setNativeInstance(_nativeObject.checkShowItemPattern);
         }
         FlashLabelArea.setNativeInstance(txtShowItemPattern,_nativeObject.txtShowItemPattern);
         if(_nativeObject.checkShowStorygoals)
         {
            checkShowStorygoals.setNativeInstance(_nativeObject.checkShowStorygoals);
         }
         FlashLabelArea.setNativeInstance(txtShowStorygoals,_nativeObject.txtShowStorygoals);
         FlashLabelArea.setNativeInstance(txtShowShopPreview,_nativeObject.txtShowShopPreview);
         if(_nativeObject.checkShowShopPreview)
         {
            checkShowShopPreview.setNativeInstance(_nativeObject.checkShowShopPreview);
         }
         FlashLabelArea.setNativeInstance(txtShowFriendbar,_nativeObject.txtShowFriendbar);
         if(_nativeObject.checkShowFriendbar)
         {
            checkShowFriendbar.setNativeInstance(_nativeObject.checkShowFriendbar);
         }
         if(_nativeObject.sldQuality)
         {
            sldQuality.setNativeInstance(_nativeObject.sldQuality);
         }
         FlashLabelArea.setNativeInstance(txtHighlightMovieButton,_nativeObject.txtHighlightMovieButton);
         if(_nativeObject.checkHighlightMovieButton)
         {
            checkHighlightMovieButton.setNativeInstance(_nativeObject.checkHighlightMovieButton);
         }
         FlashLabelArea.setNativeInstance(txtFullscreen,_nativeObject.txtFullscreen);
         if(_nativeObject.checkFullscreen)
         {
            checkFullscreen.setNativeInstance(_nativeObject.checkFullscreen);
         }
      }
   }
}

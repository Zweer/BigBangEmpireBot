package visuals.ui.elements.dating
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   
   public class SymbolUiDatingPicturesGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUiDatingPictures = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public var line1:SymbolDatingPicturesLineGeneric = null;
      
      public var line2:SymbolDatingPicturesLineGeneric = null;
      
      public var line3:SymbolDatingPicturesLineGeneric = null;
      
      public var line4:SymbolDatingPicturesLineGeneric = null;
      
      public var line5:SymbolDatingPicturesLineGeneric = null;
      
      public var line6:SymbolDatingPicturesLineGeneric = null;
      
      public var line7:SymbolDatingPicturesLineGeneric = null;
      
      public var picturesAll:SymbolDatingPicturesAllPictureContentGeneric = null;
      
      public var picturesSingle:SymbolDatingPicturesSinglePictureContentGeneric = null;
      
      public var girl:SymbolPlaceholderGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public function SymbolUiDatingPicturesGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUiDatingPictures;
         }
         else
         {
            _nativeObject = new SymbolUiDatingPictures();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
         line1 = new SymbolDatingPicturesLineGeneric(_nativeObject.line1);
         line2 = new SymbolDatingPicturesLineGeneric(_nativeObject.line2);
         line3 = new SymbolDatingPicturesLineGeneric(_nativeObject.line3);
         line4 = new SymbolDatingPicturesLineGeneric(_nativeObject.line4);
         line5 = new SymbolDatingPicturesLineGeneric(_nativeObject.line5);
         line6 = new SymbolDatingPicturesLineGeneric(_nativeObject.line6);
         line7 = new SymbolDatingPicturesLineGeneric(_nativeObject.line7);
         picturesAll = new SymbolDatingPicturesAllPictureContentGeneric(_nativeObject.picturesAll);
         picturesSingle = new SymbolDatingPicturesSinglePictureContentGeneric(_nativeObject.picturesSingle);
         girl = new SymbolPlaceholderGeneric(_nativeObject.girl);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
      }
      
      public function setNativeInstance(param1:SymbolUiDatingPictures) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
         }
         if(_nativeObject.line1)
         {
            line1.setNativeInstance(_nativeObject.line1);
         }
         if(_nativeObject.line2)
         {
            line2.setNativeInstance(_nativeObject.line2);
         }
         if(_nativeObject.line3)
         {
            line3.setNativeInstance(_nativeObject.line3);
         }
         if(_nativeObject.line4)
         {
            line4.setNativeInstance(_nativeObject.line4);
         }
         if(_nativeObject.line5)
         {
            line5.setNativeInstance(_nativeObject.line5);
         }
         if(_nativeObject.line6)
         {
            line6.setNativeInstance(_nativeObject.line6);
         }
         if(_nativeObject.line7)
         {
            line7.setNativeInstance(_nativeObject.line7);
         }
         if(_nativeObject.picturesAll)
         {
            picturesAll.setNativeInstance(_nativeObject.picturesAll);
         }
         if(_nativeObject.picturesSingle)
         {
            picturesSingle.setNativeInstance(_nativeObject.picturesSingle);
         }
         if(_nativeObject.girl)
         {
            girl.setNativeInstance(_nativeObject.girl);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
      }
   }
}

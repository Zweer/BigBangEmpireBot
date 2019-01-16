package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.movie.SymbolMovieSelectGeneric;
   
   public class SymbolDialogSelectMovieGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogSelectMovie = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var movie2:SymbolMovieSelectGeneric = null;
      
      public var movie4:SymbolMovieSelectGeneric = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public var movie1:SymbolMovieSelectGeneric = null;
      
      public var movie3:SymbolMovieSelectGeneric = null;
      
      public function SymbolDialogSelectMovieGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogSelectMovie;
         }
         else
         {
            _nativeObject = new SymbolDialogSelectMovie();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         movie2 = new SymbolMovieSelectGeneric(_nativeObject.movie2);
         movie4 = new SymbolMovieSelectGeneric(_nativeObject.movie4);
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
         movie1 = new SymbolMovieSelectGeneric(_nativeObject.movie1);
         movie3 = new SymbolMovieSelectGeneric(_nativeObject.movie3);
      }
      
      public function setNativeInstance(param1:SymbolDialogSelectMovie) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.dialogBackground)
         {
            dialogBackground.setNativeInstance(_nativeObject.dialogBackground);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         if(_nativeObject.movie2)
         {
            movie2.setNativeInstance(_nativeObject.movie2);
         }
         if(_nativeObject.movie4)
         {
            movie4.setNativeInstance(_nativeObject.movie4);
         }
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
         }
         if(_nativeObject.movie1)
         {
            movie1.setNativeInstance(_nativeObject.movie1);
         }
         if(_nativeObject.movie3)
         {
            movie3.setNativeInstance(_nativeObject.movie3);
         }
      }
   }
}

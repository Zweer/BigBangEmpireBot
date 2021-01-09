package visuals.ui.elements.movie
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolIconSelectMovieGeneric;
   
   public class SymbolMovieOffersContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMovieOffersContent = null;
      
      public var btnSelectMovie:SymbolIconSelectMovieGeneric = null;
      
      public var bg:SymbolBackgroundMovieOffersGeneric = null;
      
      public var offer2:SymbolMovieOfferGeneric = null;
      
      public var offer1:SymbolMovieOfferGeneric = null;
      
      public var offer3:SymbolMovieOfferGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtTitle:ILabelArea = null;
      
      public var refresh:SymbolRefreshMovieOffersGeneric = null;
      
      public function SymbolMovieOffersContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolMovieOffersContent;
         }
         else
         {
            _nativeObject = new SymbolMovieOffersContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         btnSelectMovie = new SymbolIconSelectMovieGeneric(_nativeObject.btnSelectMovie);
         bg = new SymbolBackgroundMovieOffersGeneric(_nativeObject.bg);
         offer2 = new SymbolMovieOfferGeneric(_nativeObject.offer2);
         offer1 = new SymbolMovieOfferGeneric(_nativeObject.offer1);
         offer3 = new SymbolMovieOfferGeneric(_nativeObject.offer3);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtTitle = FlashLabelArea.fromNative(_nativeObject.txtTitle);
         refresh = new SymbolRefreshMovieOffersGeneric(_nativeObject.refresh);
      }
      
      public function setNativeInstance(param1:SymbolMovieOffersContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.btnSelectMovie)
         {
            btnSelectMovie.setNativeInstance(_nativeObject.btnSelectMovie);
         }
         if(_nativeObject.bg)
         {
            bg.setNativeInstance(_nativeObject.bg);
         }
         if(_nativeObject.offer2)
         {
            offer2.setNativeInstance(_nativeObject.offer2);
         }
         if(_nativeObject.offer1)
         {
            offer1.setNativeInstance(_nativeObject.offer1);
         }
         if(_nativeObject.offer3)
         {
            offer3.setNativeInstance(_nativeObject.offer3);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabelArea.setNativeInstance(txtTitle,_nativeObject.txtTitle);
         if(_nativeObject.refresh)
         {
            refresh.setNativeInstance(_nativeObject.refresh);
         }
      }
   }
}

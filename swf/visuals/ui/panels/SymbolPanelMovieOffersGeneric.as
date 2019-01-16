package visuals.ui.panels
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.buttons.SymbolButtonHelpGeneric;
   import visuals.ui.elements.movie.SymbolMovieOffersContentGeneric;
   import visuals.ui.elements.movie.SymbolMovieOffersNoOffersContentGeneric;
   
   public class SymbolPanelMovieOffersGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPanelMovieOffers = null;
      
      public var background:SymbolDummyGeneric = null;
      
      public var noOffersContent:SymbolMovieOffersNoOffersContentGeneric = null;
      
      public var offersContent:SymbolMovieOffersContentGeneric = null;
      
      public var btnHelp:SymbolButtonHelpGeneric = null;
      
      public function SymbolPanelMovieOffersGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPanelMovieOffers;
         }
         else
         {
            _nativeObject = new SymbolPanelMovieOffers();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolDummyGeneric(_nativeObject.background);
         noOffersContent = new SymbolMovieOffersNoOffersContentGeneric(_nativeObject.noOffersContent);
         offersContent = new SymbolMovieOffersContentGeneric(_nativeObject.offersContent);
         btnHelp = new SymbolButtonHelpGeneric(_nativeObject.btnHelp);
      }
      
      public function setNativeInstance(param1:SymbolPanelMovieOffers) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         if(_nativeObject.noOffersContent)
         {
            noOffersContent.setNativeInstance(_nativeObject.noOffersContent);
         }
         if(_nativeObject.offersContent)
         {
            offersContent.setNativeInstance(_nativeObject.offersContent);
         }
         if(_nativeObject.btnHelp)
         {
            btnHelp.setNativeInstance(_nativeObject.btnHelp);
         }
      }
   }
}

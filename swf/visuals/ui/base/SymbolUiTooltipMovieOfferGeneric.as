package visuals.ui.base
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundTooltipGeneric;
   import visuals.ui.elements.movie.SymbolMovieRewardTooltipFansGeneric;
   import visuals.ui.elements.movie.SymbolMovieStarTooltipRewardGeneric;
   
   public class SymbolUiTooltipMovieOfferGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUiTooltipMovieOffer = null;
      
      public var background:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var title:ILabelArea = null;
      
      public var fans:SymbolMovieRewardTooltipFansGeneric = null;
      
      public var star1:SymbolMovieStarTooltipRewardGeneric = null;
      
      public var star2:SymbolMovieStarTooltipRewardGeneric = null;
      
      public var star3:SymbolMovieStarTooltipRewardGeneric = null;
      
      public function SymbolUiTooltipMovieOfferGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUiTooltipMovieOffer;
         }
         else
         {
            _nativeObject = new SymbolUiTooltipMovieOffer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.background);
         title = FlashLabelArea.fromNative(_nativeObject.title);
         fans = new SymbolMovieRewardTooltipFansGeneric(_nativeObject.fans);
         star1 = new SymbolMovieStarTooltipRewardGeneric(_nativeObject.star1);
         star2 = new SymbolMovieStarTooltipRewardGeneric(_nativeObject.star2);
         star3 = new SymbolMovieStarTooltipRewardGeneric(_nativeObject.star3);
      }
      
      public function setNativeInstance(param1:SymbolUiTooltipMovieOffer) : void
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
         FlashLabelArea.setNativeInstance(title,_nativeObject.title);
         if(_nativeObject.fans)
         {
            fans.setNativeInstance(_nativeObject.fans);
         }
         if(_nativeObject.star1)
         {
            star1.setNativeInstance(_nativeObject.star1);
         }
         if(_nativeObject.star2)
         {
            star2.setNativeInstance(_nativeObject.star2);
         }
         if(_nativeObject.star3)
         {
            star3.setNativeInstance(_nativeObject.star3);
         }
      }
   }
}

package visuals.ui.elements.movie
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   
   public class SymbolMovieTournamentTournamentInfoBigGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMovieTournamentTournamentInfoBig = null;
      
      public var txtRank:ILabelArea = null;
      
      public function SymbolMovieTournamentTournamentInfoBigGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolMovieTournamentTournamentInfoBig;
         }
         else
         {
            _nativeObject = new SymbolMovieTournamentTournamentInfoBig();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtRank = FlashLabelArea.fromNative(_nativeObject.txtRank);
      }
      
      public function setNativeInstance(param1:SymbolMovieTournamentTournamentInfoBig) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabelArea.setNativeInstance(txtRank,_nativeObject.txtRank);
      }
   }
}

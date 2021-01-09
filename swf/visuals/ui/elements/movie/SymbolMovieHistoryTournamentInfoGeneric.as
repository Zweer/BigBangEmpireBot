package visuals.ui.elements.movie
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   
   public class SymbolMovieHistoryTournamentInfoGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMovieHistoryTournamentInfo = null;
      
      public var txtRank:ILabelArea = null;
      
      public function SymbolMovieHistoryTournamentInfoGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolMovieHistoryTournamentInfo;
         }
         else
         {
            _nativeObject = new SymbolMovieHistoryTournamentInfo();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtRank = FlashLabelArea.fromNative(_nativeObject.txtRank);
      }
      
      public function setNativeInstance(param1:SymbolMovieHistoryTournamentInfo) : void
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

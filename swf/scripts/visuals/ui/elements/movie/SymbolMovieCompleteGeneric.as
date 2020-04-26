package visuals.ui.elements.movie
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolIconButtonReportGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   
   public class SymbolMovieCompleteGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMovieComplete = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var cover:SymbolCoverImagePlaceholderGeneric = null;
      
      public var rating:SymbolMovieRatingStarsGeneric = null;
      
      public var tournament:SymbolMovieHistoryTournamentInfoGeneric = null;
      
      public var txtStudioOrActorCaption:ILabelArea = null;
      
      public var txtStudioOrActor:ILabelArea = null;
      
      public var txtDateCaption:ILabelArea = null;
      
      public var txtDate:ILabelArea = null;
      
      public var txtSetCaption:ILabelArea = null;
      
      public var txtSet:ILabelArea = null;
      
      public var txtFansCaption:ILabelArea = null;
      
      public var txtFans:ILabelArea = null;
      
      public var shareInfo:SymbolMovieShareInfoGeneric = null;
      
      public var btnReport:SymbolIconButtonReportGeneric = null;
      
      public function SymbolMovieCompleteGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolMovieComplete;
         }
         else
         {
            _nativeObject = new SymbolMovieComplete();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         cover = new SymbolCoverImagePlaceholderGeneric(_nativeObject.cover);
         rating = new SymbolMovieRatingStarsGeneric(_nativeObject.rating);
         tournament = new SymbolMovieHistoryTournamentInfoGeneric(_nativeObject.tournament);
         txtStudioOrActorCaption = FlashLabelArea.fromNative(_nativeObject.txtStudioOrActorCaption);
         txtStudioOrActor = FlashLabelArea.fromNative(_nativeObject.txtStudioOrActor);
         txtDateCaption = FlashLabelArea.fromNative(_nativeObject.txtDateCaption);
         txtDate = FlashLabelArea.fromNative(_nativeObject.txtDate);
         txtSetCaption = FlashLabelArea.fromNative(_nativeObject.txtSetCaption);
         txtSet = FlashLabelArea.fromNative(_nativeObject.txtSet);
         txtFansCaption = FlashLabelArea.fromNative(_nativeObject.txtFansCaption);
         txtFans = FlashLabelArea.fromNative(_nativeObject.txtFans);
         shareInfo = new SymbolMovieShareInfoGeneric(_nativeObject.shareInfo);
         btnReport = new SymbolIconButtonReportGeneric(_nativeObject.btnReport);
      }
      
      public function setNativeInstance(param1:SymbolMovieComplete) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         if(_nativeObject.cover)
         {
            cover.setNativeInstance(_nativeObject.cover);
         }
         if(_nativeObject.rating)
         {
            rating.setNativeInstance(_nativeObject.rating);
         }
         if(_nativeObject.tournament)
         {
            tournament.setNativeInstance(_nativeObject.tournament);
         }
         FlashLabelArea.setNativeInstance(txtStudioOrActorCaption,_nativeObject.txtStudioOrActorCaption);
         FlashLabelArea.setNativeInstance(txtStudioOrActor,_nativeObject.txtStudioOrActor);
         FlashLabelArea.setNativeInstance(txtDateCaption,_nativeObject.txtDateCaption);
         FlashLabelArea.setNativeInstance(txtDate,_nativeObject.txtDate);
         FlashLabelArea.setNativeInstance(txtSetCaption,_nativeObject.txtSetCaption);
         FlashLabelArea.setNativeInstance(txtSet,_nativeObject.txtSet);
         FlashLabelArea.setNativeInstance(txtFansCaption,_nativeObject.txtFansCaption);
         FlashLabelArea.setNativeInstance(txtFans,_nativeObject.txtFans);
         if(_nativeObject.shareInfo)
         {
            shareInfo.setNativeInstance(_nativeObject.shareInfo);
         }
         if(_nativeObject.btnReport)
         {
            btnReport.setNativeInstance(_nativeObject.btnReport);
         }
      }
   }
}

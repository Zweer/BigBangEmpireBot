package visuals.ui.elements.movie
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   
   public class SymbolMovieMeterGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMovieMeter = null;
      
      public var fill:SymbolMovieMeterFillGeneric = null;
      
      public var txtProgressInfo:ILabelArea = null;
      
      public var tooltipArea:SymbolMovieMeterTooltipAreaGeneric = null;
      
      public var txtTimeLeft:ILabelArea = null;
      
      public function SymbolMovieMeterGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolMovieMeter;
         }
         else
         {
            _nativeObject = new SymbolMovieMeter();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         fill = new SymbolMovieMeterFillGeneric(_nativeObject.fill);
         txtProgressInfo = FlashLabelArea.fromNative(_nativeObject.txtProgressInfo);
         tooltipArea = new SymbolMovieMeterTooltipAreaGeneric(_nativeObject.tooltipArea);
         txtTimeLeft = FlashLabelArea.fromNative(_nativeObject.txtTimeLeft);
      }
      
      public function setNativeInstance(param1:SymbolMovieMeter) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.fill)
         {
            fill.setNativeInstance(_nativeObject.fill);
         }
         FlashLabelArea.setNativeInstance(txtProgressInfo,_nativeObject.txtProgressInfo);
         if(_nativeObject.tooltipArea)
         {
            tooltipArea.setNativeInstance(_nativeObject.tooltipArea);
         }
         FlashLabelArea.setNativeInstance(txtTimeLeft,_nativeObject.txtTimeLeft);
      }
   }
}

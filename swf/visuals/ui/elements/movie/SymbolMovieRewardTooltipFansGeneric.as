package visuals.ui.elements.movie
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolIconFansGeneric;
   
   public class SymbolMovieRewardTooltipFansGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMovieRewardTooltipFans = null;
      
      public var txtTitle:ILabelArea = null;
      
      public var iconFans:SymbolIconFansGeneric = null;
      
      public var txtFans:ILabelArea = null;
      
      public var txtInfo:ILabelArea = null;
      
      public function SymbolMovieRewardTooltipFansGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolMovieRewardTooltipFans;
         }
         else
         {
            _nativeObject = new SymbolMovieRewardTooltipFans();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtTitle = FlashLabelArea.fromNative(_nativeObject.txtTitle);
         iconFans = new SymbolIconFansGeneric(_nativeObject.iconFans);
         txtFans = FlashLabelArea.fromNative(_nativeObject.txtFans);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
      }
      
      public function setNativeInstance(param1:SymbolMovieRewardTooltipFans) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabelArea.setNativeInstance(txtTitle,_nativeObject.txtTitle);
         if(_nativeObject.iconFans)
         {
            iconFans.setNativeInstance(_nativeObject.iconFans);
         }
         FlashLabelArea.setNativeInstance(txtFans,_nativeObject.txtFans);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
      }
   }
}

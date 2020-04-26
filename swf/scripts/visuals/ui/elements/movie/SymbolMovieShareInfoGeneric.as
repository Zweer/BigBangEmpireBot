package visuals.ui.elements.movie
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   
   public class SymbolMovieShareInfoGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMovieShareInfo = null;
      
      public var background:SymbolMovieShareBackgroundGeneric = null;
      
      public var txtShare:ILabel = null;
      
      public function SymbolMovieShareInfoGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolMovieShareInfo;
         }
         else
         {
            _nativeObject = new SymbolMovieShareInfo();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolMovieShareBackgroundGeneric(_nativeObject.background);
         txtShare = FlashLabel.fromNative(_nativeObject.txtShare);
      }
      
      public function setNativeInstance(param1:SymbolMovieShareInfo) : void
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
         FlashLabel.setNativeInstance(txtShare,_nativeObject.txtShare);
      }
   }
}

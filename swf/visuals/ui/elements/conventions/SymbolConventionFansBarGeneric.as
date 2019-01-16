package visuals.ui.elements.conventions
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   
   public class SymbolConventionFansBarGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolConventionFansBar = null;
      
      public var m:SymbolConventionFansBarMaskGeneric = null;
      
      public var txtFans:ILabelArea = null;
      
      public function SymbolConventionFansBarGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolConventionFansBar;
         }
         else
         {
            _nativeObject = new SymbolConventionFansBar();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         m = new SymbolConventionFansBarMaskGeneric(_nativeObject.m);
         txtFans = FlashLabelArea.fromNative(_nativeObject.txtFans);
      }
      
      public function setNativeInstance(param1:SymbolConventionFansBar) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.m)
         {
            m.setNativeInstance(_nativeObject.m);
         }
         FlashLabelArea.setNativeInstance(txtFans,_nativeObject.txtFans);
      }
   }
}

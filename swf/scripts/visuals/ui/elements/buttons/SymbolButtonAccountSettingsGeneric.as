package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   
   public class SymbolButtonAccountSettingsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonAccountSettings = null;
      
      public var caption:ILabelArea = null;
      
      public function SymbolButtonAccountSettingsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonAccountSettings;
         }
         else
         {
            _nativeObject = new SymbolButtonAccountSettings();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         caption = FlashLabelArea.fromNative(_nativeObject.caption);
      }
      
      public function setNativeInstance(param1:SymbolButtonAccountSettings) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabelArea.setNativeInstance(caption,_nativeObject.caption);
      }
   }
}

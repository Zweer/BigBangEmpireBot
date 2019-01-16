package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolIconAccountSwitchGeneric;
   
   public class SymbolButtonAccountSwitchGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonAccountSwitch = null;
      
      public var caption:ILabelArea = null;
      
      public var iconAccountSwitch:SymbolIconAccountSwitchGeneric = null;
      
      public function SymbolButtonAccountSwitchGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonAccountSwitch;
         }
         else
         {
            _nativeObject = new SymbolButtonAccountSwitch();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         caption = FlashLabelArea.fromNative(_nativeObject.caption);
         iconAccountSwitch = new SymbolIconAccountSwitchGeneric(_nativeObject.iconAccountSwitch);
      }
      
      public function setNativeInstance(param1:SymbolButtonAccountSwitch) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabelArea.setNativeInstance(caption,_nativeObject.caption);
         if(_nativeObject.iconAccountSwitch)
         {
            iconAccountSwitch.setNativeInstance(_nativeObject.iconAccountSwitch);
         }
      }
   }
}

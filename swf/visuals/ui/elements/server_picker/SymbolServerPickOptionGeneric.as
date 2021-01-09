package visuals.ui.elements.server_picker
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.generic.SymbolDropdownBackgroundGeneric;
   
   public class SymbolServerPickOptionGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolServerPickOption = null;
      
      public var active:SymbolServerPickOptionActiveGeneric = null;
      
      public var background:SymbolDropdownBackgroundGeneric = null;
      
      public var txtServerId:ILabelArea = null;
      
      public function SymbolServerPickOptionGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolServerPickOption;
         }
         else
         {
            _nativeObject = new SymbolServerPickOption();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         active = new SymbolServerPickOptionActiveGeneric(_nativeObject.active);
         background = new SymbolDropdownBackgroundGeneric(_nativeObject.background);
         txtServerId = FlashLabelArea.fromNative(_nativeObject.txtServerId);
      }
      
      public function setNativeInstance(param1:SymbolServerPickOption) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.active)
         {
            active.setNativeInstance(_nativeObject.active);
         }
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         FlashLabelArea.setNativeInstance(txtServerId,_nativeObject.txtServerId);
      }
   }
}

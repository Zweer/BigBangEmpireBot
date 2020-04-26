package visuals.ui.elements.quest
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   
   public class SymbolGameTipMessageGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGameTipMessage = null;
      
      public var caption:ILabelArea = null;
      
      public function SymbolGameTipMessageGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGameTipMessage;
         }
         else
         {
            _nativeObject = new SymbolGameTipMessage();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         caption = FlashLabelArea.fromNative(_nativeObject.caption);
      }
      
      public function setNativeInstance(param1:SymbolGameTipMessage) : void
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

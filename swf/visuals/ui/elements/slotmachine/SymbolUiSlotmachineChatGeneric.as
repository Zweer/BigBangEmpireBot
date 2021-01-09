package visuals.ui.elements.slotmachine
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   
   public class SymbolUiSlotmachineChatGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUiSlotmachineChat = null;
      
      public var chat:ILabelArea = null;
      
      public function SymbolUiSlotmachineChatGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUiSlotmachineChat;
         }
         else
         {
            _nativeObject = new SymbolUiSlotmachineChat();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         chat = FlashLabelArea.fromNative(_nativeObject.chat);
      }
      
      public function setNativeInstance(param1:SymbolUiSlotmachineChat) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabelArea.setNativeInstance(chat,_nativeObject.chat);
      }
   }
}

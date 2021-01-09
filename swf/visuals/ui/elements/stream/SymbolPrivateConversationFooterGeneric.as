package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.lib.flash.FlashTextInputArea;
   import com.playata.framework.display.ui.controls.ITextInputArea;
   import flash.display.MovieClip;
   
   public class SymbolPrivateConversationFooterGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPrivateConversationFooter = null;
      
      public var textFieldBackground:SymbolPanelStreamInputBackgroundGeneric = null;
      
      public var inputMessage:ITextInputArea = null;
      
      public var btnSend:SymbolButtonSendPrivateConversationMessageGeneric = null;
      
      public function SymbolPrivateConversationFooterGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPrivateConversationFooter;
         }
         else
         {
            _nativeObject = new SymbolPrivateConversationFooter();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         textFieldBackground = new SymbolPanelStreamInputBackgroundGeneric(_nativeObject.textFieldBackground);
         inputMessage = FlashTextInputArea.fromNative(_nativeObject.inputMessage);
         btnSend = new SymbolButtonSendPrivateConversationMessageGeneric(_nativeObject.btnSend);
      }
      
      public function setNativeInstance(param1:SymbolPrivateConversationFooter) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.textFieldBackground)
         {
            textFieldBackground.setNativeInstance(_nativeObject.textFieldBackground);
         }
         FlashTextInputArea.setNativeInstance(inputMessage,_nativeObject.inputMessage);
         if(_nativeObject.btnSend)
         {
            btnSend.setNativeInstance(_nativeObject.btnSend);
         }
      }
   }
}

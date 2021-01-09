package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolStreamMessageContainerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStreamMessageContainer = null;
      
      public var divider:SymbolPanelStreamDividerGeneric = null;
      
      public var serverSystemMessageContainer:SymbolServerSystemMessageContainerGeneric = null;
      
      public var privateSystemMessage:SymbolPrivateSystemMessageGeneric = null;
      
      public var privateConversationMessageContainer:SymbolPrivateConversationMessageContainerGeneric = null;
      
      public function SymbolStreamMessageContainerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStreamMessageContainer;
         }
         else
         {
            _nativeObject = new SymbolStreamMessageContainer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         divider = new SymbolPanelStreamDividerGeneric(_nativeObject.divider);
         serverSystemMessageContainer = new SymbolServerSystemMessageContainerGeneric(_nativeObject.serverSystemMessageContainer);
         privateSystemMessage = new SymbolPrivateSystemMessageGeneric(_nativeObject.privateSystemMessage);
         privateConversationMessageContainer = new SymbolPrivateConversationMessageContainerGeneric(_nativeObject.privateConversationMessageContainer);
      }
      
      public function setNativeInstance(param1:SymbolStreamMessageContainer) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.divider)
         {
            divider.setNativeInstance(_nativeObject.divider);
         }
         if(_nativeObject.serverSystemMessageContainer)
         {
            serverSystemMessageContainer.setNativeInstance(_nativeObject.serverSystemMessageContainer);
         }
         if(_nativeObject.privateSystemMessage)
         {
            privateSystemMessage.setNativeInstance(_nativeObject.privateSystemMessage);
         }
         if(_nativeObject.privateConversationMessageContainer)
         {
            privateConversationMessageContainer.setNativeInstance(_nativeObject.privateConversationMessageContainer);
         }
      }
   }
}

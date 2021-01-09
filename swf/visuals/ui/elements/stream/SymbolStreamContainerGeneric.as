package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolStreamContainerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStreamContainer = null;
      
      public var systemMessageStreamContainer:SymbolSystemMessageStreamContainerGeneric = null;
      
      public var privateConversationStreamContainer:SymbolPrivateConversationStreamContainerGeneric = null;
      
      public function SymbolStreamContainerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStreamContainer;
         }
         else
         {
            _nativeObject = new SymbolStreamContainer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         systemMessageStreamContainer = new SymbolSystemMessageStreamContainerGeneric(_nativeObject.systemMessageStreamContainer);
         privateConversationStreamContainer = new SymbolPrivateConversationStreamContainerGeneric(_nativeObject.privateConversationStreamContainer);
      }
      
      public function setNativeInstance(param1:SymbolStreamContainer) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.systemMessageStreamContainer)
         {
            systemMessageStreamContainer.setNativeInstance(_nativeObject.systemMessageStreamContainer);
         }
         if(_nativeObject.privateConversationStreamContainer)
         {
            privateConversationStreamContainer.setNativeInstance(_nativeObject.privateConversationStreamContainer);
         }
      }
   }
}

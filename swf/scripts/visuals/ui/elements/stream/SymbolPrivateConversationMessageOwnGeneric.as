package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   
   public class SymbolPrivateConversationMessageOwnGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPrivateConversationMessageOwn = null;
      
      public var spacer:SymbolDummyGeneric = null;
      
      public var bubble:SymbolMessageStreamBubbleOwnGeneric = null;
      
      public var txtMessage:ILabelArea = null;
      
      public var txtCreation:ILabel = null;
      
      public var btnDelete:SymbolButtonDeletePrivateConversationMessageGeneric = null;
      
      public var btnCopy:SymbolButtonCopyPrivateConversationMessageGeneric = null;
      
      public function SymbolPrivateConversationMessageOwnGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPrivateConversationMessageOwn;
         }
         else
         {
            _nativeObject = new SymbolPrivateConversationMessageOwn();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         spacer = new SymbolDummyGeneric(_nativeObject.spacer);
         bubble = new SymbolMessageStreamBubbleOwnGeneric(_nativeObject.bubble);
         txtMessage = FlashLabelArea.fromNative(_nativeObject.txtMessage);
         txtCreation = FlashLabel.fromNative(_nativeObject.txtCreation);
         btnDelete = new SymbolButtonDeletePrivateConversationMessageGeneric(_nativeObject.btnDelete);
         btnCopy = new SymbolButtonCopyPrivateConversationMessageGeneric(_nativeObject.btnCopy);
      }
      
      public function setNativeInstance(param1:SymbolPrivateConversationMessageOwn) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.spacer)
         {
            spacer.setNativeInstance(_nativeObject.spacer);
         }
         if(_nativeObject.bubble)
         {
            bubble.setNativeInstance(_nativeObject.bubble);
         }
         FlashLabelArea.setNativeInstance(txtMessage,_nativeObject.txtMessage);
         FlashLabel.setNativeInstance(txtCreation,_nativeObject.txtCreation);
         if(_nativeObject.btnDelete)
         {
            btnDelete.setNativeInstance(_nativeObject.btnDelete);
         }
         if(_nativeObject.btnCopy)
         {
            btnCopy.setNativeInstance(_nativeObject.btnCopy);
         }
      }
   }
}

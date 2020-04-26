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
   
   public class SymbolPrivateConversationMessageOtherGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPrivateConversationMessageOther = null;
      
      public var spacer:SymbolDummyGeneric = null;
      
      public var bubble:SymbolMessageStreamBubbleOtherGeneric = null;
      
      public var txtMessage:ILabelArea = null;
      
      public var txtCreation:ILabel = null;
      
      public var txtSenderName:ILabel = null;
      
      public var btnCopy:SymbolButtonCopyPrivateConversationMessageGeneric = null;
      
      public function SymbolPrivateConversationMessageOtherGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPrivateConversationMessageOther;
         }
         else
         {
            _nativeObject = new SymbolPrivateConversationMessageOther();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         spacer = new SymbolDummyGeneric(_nativeObject.spacer);
         bubble = new SymbolMessageStreamBubbleOtherGeneric(_nativeObject.bubble);
         txtMessage = FlashLabelArea.fromNative(_nativeObject.txtMessage);
         txtCreation = FlashLabel.fromNative(_nativeObject.txtCreation);
         txtSenderName = FlashLabel.fromNative(_nativeObject.txtSenderName);
         btnCopy = new SymbolButtonCopyPrivateConversationMessageGeneric(_nativeObject.btnCopy);
      }
      
      public function setNativeInstance(param1:SymbolPrivateConversationMessageOther) : void
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
         FlashLabel.setNativeInstance(txtSenderName,_nativeObject.txtSenderName);
         if(_nativeObject.btnCopy)
         {
            btnCopy.setNativeInstance(_nativeObject.btnCopy);
         }
      }
   }
}

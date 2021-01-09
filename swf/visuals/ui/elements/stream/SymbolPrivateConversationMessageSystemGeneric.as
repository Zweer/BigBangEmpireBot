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
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundRoundedGeneric;
   
   public class SymbolPrivateConversationMessageSystemGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPrivateConversationMessageSystem = null;
      
      public var spacer:SymbolDummyGeneric = null;
      
      public var bubble:SymbolSlice9BackgroundRoundedGeneric = null;
      
      public var txtMessage:ILabelArea = null;
      
      public var txtCreation:ILabel = null;
      
      public function SymbolPrivateConversationMessageSystemGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPrivateConversationMessageSystem;
         }
         else
         {
            _nativeObject = new SymbolPrivateConversationMessageSystem();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         spacer = new SymbolDummyGeneric(_nativeObject.spacer);
         bubble = new SymbolSlice9BackgroundRoundedGeneric(_nativeObject.bubble);
         txtMessage = FlashLabelArea.fromNative(_nativeObject.txtMessage);
         txtCreation = FlashLabel.fromNative(_nativeObject.txtCreation);
      }
      
      public function setNativeInstance(param1:SymbolPrivateConversationMessageSystem) : void
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
      }
   }
}

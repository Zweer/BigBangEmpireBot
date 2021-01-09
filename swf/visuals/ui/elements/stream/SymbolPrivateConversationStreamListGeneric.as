package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.generic.SymbolScrollKnobSmallGeneric;
   import visuals.ui.elements.generic.SymbolScrollLineSmallGeneric;
   
   public class SymbolPrivateConversationStreamListGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPrivateConversationStreamList = null;
      
      public var listContainer:SymbolDummyGeneric = null;
      
      public var txtNoMessages:ILabelArea = null;
      
      public var scrollBarLine:SymbolScrollLineSmallGeneric = null;
      
      public var scrollBarKnob:SymbolScrollKnobSmallGeneric = null;
      
      public function SymbolPrivateConversationStreamListGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPrivateConversationStreamList;
         }
         else
         {
            _nativeObject = new SymbolPrivateConversationStreamList();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         listContainer = new SymbolDummyGeneric(_nativeObject.listContainer);
         txtNoMessages = FlashLabelArea.fromNative(_nativeObject.txtNoMessages);
         scrollBarLine = new SymbolScrollLineSmallGeneric(_nativeObject.scrollBarLine);
         scrollBarKnob = new SymbolScrollKnobSmallGeneric(_nativeObject.scrollBarKnob);
      }
      
      public function setNativeInstance(param1:SymbolPrivateConversationStreamList) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.listContainer)
         {
            listContainer.setNativeInstance(_nativeObject.listContainer);
         }
         FlashLabelArea.setNativeInstance(txtNoMessages,_nativeObject.txtNoMessages);
         if(_nativeObject.scrollBarLine)
         {
            scrollBarLine.setNativeInstance(_nativeObject.scrollBarLine);
         }
         if(_nativeObject.scrollBarKnob)
         {
            scrollBarKnob.setNativeInstance(_nativeObject.scrollBarKnob);
         }
      }
   }
}

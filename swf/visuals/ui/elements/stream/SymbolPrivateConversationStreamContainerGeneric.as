package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.lib.flash.FlashTextInput;
   import com.playata.framework.display.ui.controls.ITextInput;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonWideGeneric;
   
   public class SymbolPrivateConversationStreamContainerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPrivateConversationStreamContainer = null;
      
      public var buttonBackground:SymbolPanelStreamElementBackgroundGeneric = null;
      
      public var btnNew:SymbolUiButtonWideGeneric = null;
      
      public var list:SymbolPrivateConversationStreamListGeneric = null;
      
      public var symbolPanelStreamInputBackground:SymbolPanelStreamInputBackgroundGeneric = null;
      
      public var inputFilter:ITextInput = null;
      
      public function SymbolPrivateConversationStreamContainerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPrivateConversationStreamContainer;
         }
         else
         {
            _nativeObject = new SymbolPrivateConversationStreamContainer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         buttonBackground = new SymbolPanelStreamElementBackgroundGeneric(_nativeObject.buttonBackground);
         btnNew = new SymbolUiButtonWideGeneric(_nativeObject.btnNew);
         list = new SymbolPrivateConversationStreamListGeneric(_nativeObject.list);
         symbolPanelStreamInputBackground = new SymbolPanelStreamInputBackgroundGeneric(_nativeObject.symbolPanelStreamInputBackground);
         inputFilter = FlashTextInput.fromNative(_nativeObject.inputFilter);
      }
      
      public function setNativeInstance(param1:SymbolPrivateConversationStreamContainer) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.buttonBackground)
         {
            buttonBackground.setNativeInstance(_nativeObject.buttonBackground);
         }
         if(_nativeObject.btnNew)
         {
            btnNew.setNativeInstance(_nativeObject.btnNew);
         }
         if(_nativeObject.list)
         {
            list.setNativeInstance(_nativeObject.list);
         }
         if(_nativeObject.symbolPanelStreamInputBackground)
         {
            symbolPanelStreamInputBackground.setNativeInstance(_nativeObject.symbolPanelStreamInputBackground);
         }
         FlashTextInput.setNativeInstance(inputFilter,_nativeObject.inputFilter);
      }
   }
}

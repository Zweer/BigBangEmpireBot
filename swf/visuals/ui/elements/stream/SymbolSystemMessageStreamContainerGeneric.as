package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.lib.flash.FlashTextInput;
   import com.playata.framework.display.ui.controls.ITextInput;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonGoalFilterGeneric;
   
   public class SymbolSystemMessageStreamContainerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolSystemMessageStreamContainer = null;
      
      public var list:SymbolPrivateSystemMessageStreamListGeneric = null;
      
      public var mailFilter:SymbolPrivateSystemMessageFilterGeneric = null;
      
      public var symbolPanelStreamInputBackground:SymbolPanelStreamInputBackgroundGeneric = null;
      
      public var inputFilter:ITextInput = null;
      
      public var btnFilter:SymbolButtonGoalFilterGeneric = null;
      
      public var serverMessageStream:SymbolServerMessageStreamGeneric = null;
      
      public function SymbolSystemMessageStreamContainerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolSystemMessageStreamContainer;
         }
         else
         {
            _nativeObject = new SymbolSystemMessageStreamContainer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         list = new SymbolPrivateSystemMessageStreamListGeneric(_nativeObject.list);
         mailFilter = new SymbolPrivateSystemMessageFilterGeneric(_nativeObject.mailFilter);
         symbolPanelStreamInputBackground = new SymbolPanelStreamInputBackgroundGeneric(_nativeObject.symbolPanelStreamInputBackground);
         inputFilter = FlashTextInput.fromNative(_nativeObject.inputFilter);
         btnFilter = new SymbolButtonGoalFilterGeneric(_nativeObject.btnFilter);
         serverMessageStream = new SymbolServerMessageStreamGeneric(_nativeObject.serverMessageStream);
      }
      
      public function setNativeInstance(param1:SymbolSystemMessageStreamContainer) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.list)
         {
            list.setNativeInstance(_nativeObject.list);
         }
         if(_nativeObject.mailFilter)
         {
            mailFilter.setNativeInstance(_nativeObject.mailFilter);
         }
         if(_nativeObject.symbolPanelStreamInputBackground)
         {
            symbolPanelStreamInputBackground.setNativeInstance(_nativeObject.symbolPanelStreamInputBackground);
         }
         FlashTextInput.setNativeInstance(inputFilter,_nativeObject.inputFilter);
         if(_nativeObject.btnFilter)
         {
            btnFilter.setNativeInstance(_nativeObject.btnFilter);
         }
         if(_nativeObject.serverMessageStream)
         {
            serverMessageStream.setNativeInstance(_nativeObject.serverMessageStream);
         }
      }
   }
}

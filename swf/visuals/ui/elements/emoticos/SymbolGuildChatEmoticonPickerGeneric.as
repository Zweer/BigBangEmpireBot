package visuals.ui.elements.emoticos
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.generic.SymbolArrowBlackGeneric;
   
   public class SymbolGuildChatEmoticonPickerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildChatEmoticonPicker = null;
      
      public var symbolArrowBlack:SymbolArrowBlackGeneric = null;
      
      public var background:SymbolGuildChatEmoticonPickerBackgroundGeneric = null;
      
      public var separator:SymbolGuildChatEmoticonPickerSeparatorGeneric = null;
      
      public var txtInfo:ILabel = null;
      
      public var icons:SymbolPlaceholderGeneric = null;
      
      public function SymbolGuildChatEmoticonPickerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildChatEmoticonPicker;
         }
         else
         {
            _nativeObject = new SymbolGuildChatEmoticonPicker();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolArrowBlack = new SymbolArrowBlackGeneric(_nativeObject.symbolArrowBlack);
         background = new SymbolGuildChatEmoticonPickerBackgroundGeneric(_nativeObject.background);
         separator = new SymbolGuildChatEmoticonPickerSeparatorGeneric(_nativeObject.separator);
         txtInfo = FlashLabel.fromNative(_nativeObject.txtInfo);
         icons = new SymbolPlaceholderGeneric(_nativeObject.icons);
      }
      
      public function setNativeInstance(param1:SymbolGuildChatEmoticonPicker) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolArrowBlack)
         {
            symbolArrowBlack.setNativeInstance(_nativeObject.symbolArrowBlack);
         }
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         if(_nativeObject.separator)
         {
            separator.setNativeInstance(_nativeObject.separator);
         }
         FlashLabel.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         if(_nativeObject.icons)
         {
            icons.setNativeInstance(_nativeObject.icons);
         }
      }
   }
}
